import 'package:dementia_plus/pages/profhelp/locationinfo.dart';
import 'package:dementia_plus/pages/tracker/pairprompt.dart';
import 'package:dementia_plus/ui/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dementia_plus/pages/learn/learn.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 18,right: 18,bottom: 130),
              child:Image.asset('img/dc.png')),
            Button("Learn",page:Learn()),
            SizedBox(height: 10.0,),
            Button("Professional Help",page:LocationInfo()),
            SizedBox(height: 10.0,),
            Button("Locate Patient",page:PairPrompt()),
          ],
        ),
      ),
    );
  }
}
