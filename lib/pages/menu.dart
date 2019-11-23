import 'package:dementia_plus/pages/tracker/caregiver.dart';
import 'package:dementia_plus/pages/tracker/map.dart';
import 'package:dementia_plus/pages/tracker/patient.dart';
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
            Button("Learn",page:Learn()),
            SizedBox(height: 10.0,),
            Button("Professional Help",page:Patient()),
            SizedBox(height: 10.0,),
            Button("Locate Patient",page:Caregiver()),
          ],
        ),
      ),
    );
  }
}
