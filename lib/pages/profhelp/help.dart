import 'package:dementia_plus/pages/profhelp/dummycontacts.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:dementia_plus/ui/buttons.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, "Find Help"),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                child: Image.asset("img/placeholder.png"),
              ),
              Expanded(child:Container()),
              Button(
                "Select Another City",
                bgcolor: Color(0xffff2d55),
                onpressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Button("Caregiver", page: DummyContacts()),
              SizedBox(
                height: 10,
              ),
              Button("Doctor", page: DummyContacts()),
              Expanded(child: Container(),)
            ],
          ),
        ));
  }
}
