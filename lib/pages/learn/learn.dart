import 'package:dementia_plus/ui/appbar.dart';
import 'package:dementia_plus/ui/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'community.dart';

class Learn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  List<String> learnOptions;
  @override
  void initState() {
    super.initState();
    learnOptions = [
      "About Dementia",
      "Behaviour",
      "Mood",
      "Therapies",
      "Therapies",
      "Therapies",
      "Therapies"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Learn"),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ImageCardButton("Community", page: Community())),
        Expanded(
            child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          children: List.generate(learnOptions.length, (index) {
            return ImageCardButton(learnOptions[index]);
          }),
        ))
      ]),
    );
  }
}
