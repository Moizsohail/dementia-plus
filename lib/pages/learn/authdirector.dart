import 'package:dementia_plus/pages/learn/community.dart';
import 'package:dementia_plus/pages/learn/loginregister.dart';
import 'package:dementia_plus/tools/authentication.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class AuthDirector extends StatefulWidget {
  AuthDirector({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _AuthDirectorState();
}

class _AuthDirectorState extends State<AuthDirector> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    }).catchError((onError){print('hi');});
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      widget.auth.signOut();
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return Center(child: CircularProgressIndicator());
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return Login(
          widget.auth,
          loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return Community(
            _userId,
            widget.auth,
            logoutCallback,
          );
        } else
          return Center(child: CircularProgressIndicator());
        break;
      default:
        return Center(child: CircularProgressIndicator());
    }
  }
}
