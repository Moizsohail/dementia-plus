import 'package:dementia_plus/tools/authentication.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login(this.auth, this._callback);
  final BaseAuth auth;
  final VoidCallback _callback;
  final String title = "Community";
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

enum FormStatus { login, register }

class _LoginState extends State<Login> {
  FormStatus _formStatus = FormStatus.login;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  Widget getField(String text, String hint, callback) {
    return TextFormField(
      decoration: InputDecoration(hintText: hint),
      validator: (e) {
        if (e.length == 0) return "You cannot leave this empty";
        return null;
      },
      onSaved: callback,
    );
  }

  bool validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit(ctx) {
    if (_formStatus == FormStatus.login) {
      if (validateAndSave()) {
        widget.auth.signIn(email, password).then((e) {
          widget._callback();
        }).catchError((e) {
          final snackBar = SnackBar(
              content: Text(e.message,
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              backgroundColor: Colors.greenAccent);
          Scaffold.of(ctx).showSnackBar(snackBar);
        });
      }
    }
    else{
      if (validateAndSave()) {
        widget.auth.signUp(email, password).then((e) {
          widget._callback();
        }).catchError((e) {
          
          final snackBar = SnackBar(
              content: Text(e.message,
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              backgroundColor: Colors.greenAccent);
          Scaffold.of(ctx).showSnackBar(snackBar);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _formStatus == FormStatus.login ? login() : register();
  }

  Widget login() {
    return Scaffold(
        appBar: customAppBar(context, widget.title),
        body: Builder(builder: (BuildContext ctx) {
          return Container(
              child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 15.0),
                ),
                getField("Email", "youremail@mail.com", (x) {
                  email = x;
                }),
                getField("Password", "******", (x) {
                  password = x;
                }),
                RaisedButton(
                  onPressed: () => validateAndSubmit(ctx),
                  child: Text("Sign In"),
                ),
                Row(children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _formStatus = FormStatus.register;
                      });
                    },
                    child: Text("I do not have an account"),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("I forgot my password"),
                  ),
                ]),
              ],
            ),
          ));
        }));
  }

  Widget register() {
    return Scaffold(
        appBar: customAppBar(context, widget.title),
        body: Builder(builder: (BuildContext ctx) {
          return Container(
              child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 15.0),
                ),
                getField("Email", "youremail@mail.com", (x) {
                  email = x;
                }),
                getField("Password", "******", (x) {
                  password = x;
                }),
                RaisedButton(
                  onPressed: () => validateAndSubmit(ctx),
                  child: Text("Sign Up"),
                ),
                Row(children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _formStatus = FormStatus.login;
                      });
                    },
                    child: Text("I do not have an account"),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("I forgot my password"),
                  ),
                ]),
              ],
            ),
          ));
        }));
  }
}
