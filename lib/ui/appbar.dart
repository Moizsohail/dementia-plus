import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String text,
    {bool logout = false, void logoutfunc()}) {
  return AppBar(
    iconTheme: IconThemeData(color: (Colors.white)),
    title: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
    centerTitle: true,
    actions: <Widget>[
      FlatButton(
        child: Icon(
          !logout ? Icons.home : Icons.exit_to_app,
          color: Colors.white,
        ),
        onPressed: () {
          if (!logout)
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          else {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/auth', (Route<dynamic> route) => false);
            logoutfunc();
          }
        },
      )
    ],
  );
}
