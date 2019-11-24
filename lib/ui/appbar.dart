import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String text,{bool logout=false,void logoutfunc()}) {
  return AppBar(
    elevation: 0.0,
    iconTheme: IconThemeData(color: (Colors.grey)),
    backgroundColor: Colors.white10,
    title: Text(text,style: TextStyle(color: Colors.grey),),
    centerTitle: true,
    
    actions: <Widget>[
      FlatButton(
        child: Icon(!logout?Icons.home:Icons.exit_to_app,color: Colors.grey,),
        onPressed: () {
          if(!logout)
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          else{
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/auth', (Route<dynamic> route) => false);
            logoutfunc();
          }
        },
      )
    ],
  );
}
