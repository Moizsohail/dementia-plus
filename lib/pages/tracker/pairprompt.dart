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
        child: Column(
          children: <Widget>[
            Text(
              "Select appropriate option",
              maxLines: null,
            ),
            Button("Caregiver",page: Caregiver(),),
            Button("Patient",page: Patient())
          ],
        ),
      ),
    );
  }
}
