import 'package:dementia_plus/pages/learn/authdirector.dart';
import 'package:dementia_plus/pages/learn/resource.dart';
import 'package:dementia_plus/tools/authentication.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:dementia_plus/ui/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(appBar:customAppBar(context, "Community"), body:CustomScrollView(slivers: <Widget>[
      SliverList(
          delegate: SliverChildListDelegate(<Widget>[
        SizedBox(
            height: 150.0,
            child:
                ImageCardButton("Community", page: AuthDirector(auth: Auth())))
      ])),
      SliverGrid(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return ImageCardButton(learnOptions[index],
              page: Resource(learnOptions[index]));
        }, childCount: learnOptions.length),
      )
    ]));
  }
}
