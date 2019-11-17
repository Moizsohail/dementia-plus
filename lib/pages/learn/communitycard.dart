import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';

class CommunityCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommunityCardState();
}

class _CommunityCardState extends State<CommunityCard> {
  List<Widget> getCards() {
    return List.generate(
        16,
        (index) => Container(
                child: Card(
              child: Container(child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Answer"+index.toString()),
                  Text(
                    "Aasdjfjaosidjfo aisjdfo aisjdfoiajs doifjsdofjiasod fijaosdfjaosidjfaos jidfosjidfoaijsdf",
                    maxLines: null,
                  ),
                  Text("Anonymous")
                ],
              )),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, "Community"),
        body: Container(
          child: Card(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                                "How can i deal with the patients arrogance")),
                        Expanded(
                            child: Column(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {},
                              child: Icon(Icons.thumb_up),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Icon(Icons.thumb_down),
                            )
                          ],
                        ))
                      ],
                    ),
                    Text("Anonymous"),
                    Text("5 Answers"),
                  ]),
                ),
                SliverList(delegate: SliverChildListDelegate(getCards())),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Row(
                    children: <Widget>[
                      Expanded(flex: 5, child: TextField()),
                      Expanded(
                          flex: 1,
                          child: FlatButton(
                            child: Icon(Icons.send),
                            onPressed: () {},
                          ))
                    ],
                  )
                ]))
              ],
            ),
          ),
        ));
  }
}
