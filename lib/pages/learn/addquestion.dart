import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dementia_plus/models/community.dart';
import 'package:dementia_plus/tools/authentication.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dementia_plus/ui/buttons.dart';

class AddQuestion extends StatefulWidget {
  AddQuestion(this.auth, this._callback);
  final BaseAuth auth;
  final VoidCallback _callback;
  @override
  State<StatefulWidget> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  InputDecoration inputDecoration(String text) {
    return InputDecoration(
        hintText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)));
  }

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, "Ask Question",
            logout: true, logoutfunc: widget._callback),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: controller1,
                decoration: inputDecoration("Subject..."),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                maxLength: 100,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: controller2,
                keyboardType: TextInputType.multiline,
                maxLines: 7,
                decoration: inputDecoration("Description..."),
                maxLength: 400,
              ),
              SizedBox(
                height: 20.0,
              ),
              Button("Ask", onpressed: () {
                CommunityModel c = CommunityModel();
                c.subject = controller1.text;
                c.description = controller2.text;
                Firestore.instance.collection("community").add(c.toMap());
                Navigator.pop(context);
              })
            ],
          )),
        ));
  }
}
