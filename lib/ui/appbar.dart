import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String text) {
  return AppBar(
    title: Text(text),
    centerTitle: true,
    actions: <Widget>[
      FlatButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        },
      )
    ],
  );
}
