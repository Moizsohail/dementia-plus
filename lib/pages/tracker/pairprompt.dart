import 'package:dementia_plus/pages/tracker/caregiver.dart';
import 'package:dementia_plus/pages/tracker/patient.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:dementia_plus/ui/buttons.dart';
import 'package:flutter/material.dart';

class PairPrompt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PairPromptState();
}

class _PairPromptState extends State<PairPrompt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Locate Patient"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Who are you using this app for",
              maxLines: null,
              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "You will require two internet connected smartphones for this process",
              maxLines: null,
              style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 15,
            ),
            Button(
              "Caregiver (To Track)",
              page: Caregiver(),
            ),
            SizedBox(
              height: 15,
            ),
            Button("Patient (To Locate)", page: Patient())
          ],
        ),
      ),
    );
  }
}
