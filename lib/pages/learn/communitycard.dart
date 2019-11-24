import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dementia_plus/models/community.dart';
import 'package:dementia_plus/tools/authentication.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';

class CommunityCard extends StatefulWidget {
  CommunityCard(this.auth, this._callback, this.post, this.color);
  final CommunityModel post;
  final BaseAuth auth;
  final VoidCallback _callback;
  final Color color;
  @override
  State<StatefulWidget> createState() => _CommunityCardState();
}

class _CommunityCardState extends State<CommunityCard> {
  TextEditingController controller = TextEditingController();

  List<Widget> getCards() {
    return List.generate(
        widget.post.answer.length,
        (index) => Container(
                child: Card(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Answer" + index.toString(),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0),),
                      SizedBox(height: 5,),
                      Text(
                        widget.post.answer[index].answer,
                        maxLines: null,
                        style: TextStyle(color: Colors.black,fontSize: 17.0)
                      ),
                      SizedBox(height: 5,),
                      Text("Anonymous",style:TextStyle(color: Colors.grey,fontSize: 6.0))
                    ],
                  )),
            )));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, "Community",
            logoutfunc: widget._callback, logout: true),
        body: Container(
          padding: EdgeInsets.all(0),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              color: widget.color,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 6,
                          child: CustomScrollView(slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildListDelegate([
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              widget.post.subject,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30),
                                            ),
                                            Text(widget.post.description,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)),
                                          ],
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: <Widget>[
                                            FlatButton(
                                              onPressed: () {},
                                              child: Icon(Icons.thumb_up,color: Colors.white,),
                                            ),
                                            FlatButton(
                                              onPressed: () {},
                                              child: Icon(Icons.thumb_down,color: Colors.white,),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                                Text("Anonymous"),
                                Text(widget.post.answer.length.toString()+ " Answers"),
                                SizedBox(height: 15,)
                              ]),
                            ),
                            SliverList(
                                delegate: SliverChildListDelegate(getCards())),
                          ])),
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: TextField(
                                controller: controller,
                                style: TextStyle(color: Colors.black87),
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Type Answer",
                                    hintStyle: TextStyle(fontSize: 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)))),
                          ),
                          Expanded(
                              flex: 1,
                              child: FlatButton(
                                child: Icon(Icons.send),
                                onPressed: () {
                                  setState(() {
                                    widget.post.answer
                                        .add(AnswerModel(controller.text));
                                    Firestore.instance
                                        .collection("community")
                                        .document(widget.post.docId)
                                        .updateData(widget.post.toMap());
                                  });
                                  controller.clear();
                                },
                              ))
                        ],
                      ))
                    ],
                  ))),
        ));
  }
}
