import 'package:dementia_plus/pages/profhelp/help.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:dementia_plus/ui/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Nearest Help"),
      body: Container(
        padding: EdgeInsets.all(10),
          child: Column(
        children: <Widget>[
          Text("Enter your location"),
          TextField(style: TextStyle(color:Colors.black),decoration: InputDecoration(hintText: "Enter Area",prefixIcon: Icon(Icons.location_city),border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
          SizedBox(height:15.0),
          TextField(style: TextStyle(color:Colors.black),decoration: InputDecoration(hintText: "Enter City",prefixIcon: Icon(Icons.place),border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
          Expanded(
            child: Text('hi'),
          ),
          Button("Find Help", page: Help())
        ],
      )),
    );
  }
}
