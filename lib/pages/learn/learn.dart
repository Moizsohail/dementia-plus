import 'package:dementia_plus/pages/learn/authdirector.dart';
import 'package:dementia_plus/pages/learn/resource.dart';
import 'package:dementia_plus/tools/authentication.dart';
import 'package:dementia_plus/tools/learnOption.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:dementia_plus/ui/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Learn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  List<LearnOption> learnOptions;
  @override
  void initState() {
    super.initState();

    learnOptions = [
      LearnOption(
          "About Dementia", "aboutdementia.jpg", ["FAQs about dementia"]),
      LearnOption("Behavior", "aboutdementia.jpg", [
        "How to manage the patients change in behavior?",
        "Patient has become aggressive"
      ]),
      LearnOption("Mood", "aboutdementia.jpg",
          ["What to do about patients frequent mood swings?"]),
      LearnOption("Therapies", "aboutdementia.jpg", ["Most popular therapies"]),
      LearnOption(
          "Financial", "aboutdementia.jpg", ["How to manage financial issues"]),
      LearnOption("Law", "aboutdementia.jpg", ["Legal Benefits"])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, "Learn"),
        body: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            SizedBox(height: 10),
            SizedBox(
                height: 100.0,
                child: ImageCardButton("Community Portal",
                    bgColor: Color(0xff1A939A),
                    page: AuthDirector(auth: Auth()))),
            SizedBox(height: 10),
          ])),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.5),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ImageCardButton(learnOptions[index].title,
                  bgColor: Color(0xff55ced5),
                  page: Resource(learnOptions[index]));
            }, childCount: learnOptions.length),
          )
        ]));
  }
}
