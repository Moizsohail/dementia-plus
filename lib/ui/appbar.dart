import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String text) {
  return AppBar(
    elevation: 0.0,
    iconTheme: IconThemeData(color: (Colors.grey)),
    backgroundColor: Colors.white10,
    title: Text(text,style: TextStyle(color: Colors.grey),),
    centerTitle: true,
    actions: <Widget>[
      FlatButton(
        child: Icon(Icons.home,color: Colors.grey,),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        },
      )
    ],
  );
}
