import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dementia_plus/models/community.dart';
import 'package:dementia_plus/pages/learn/addquestion.dart';
import 'package:dementia_plus/pages/learn/communitycard.dart';
import 'package:dementia_plus/tools/authentication.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:dementia_plus/ui/misc.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  Community(this.userId, this.auth, this._callback);
  final String userId;
  final BaseAuth auth;
  final VoidCallback _callback;
  final String title = "Community";
  final String collection = "community";
  @override
  State<StatefulWidget> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final mySearchController = TextEditingController();
  List<CommunityModel> posts = [];
  StreamSubscription<QuerySnapshot> ss;
  
  @override
  void initState() {
    super.initState();

    ss = Firestore.instance
        .collection(widget.collection)
        .snapshots()
        .listen((data) {
      
      setState(() {
        posts = [];
        for (int i = 0; i < data.documents.length; i++) {
          DocumentSnapshot f = data.documents[i];
          CommunityModel c = CommunityModel();
          c.fromMap(f);
          posts.add(c);
        }
      });
    });
  }

  @override
  void dispose() {
    mySearchController.dispose();
    ss.cancel();
    super.dispose();
  }

  Widget _getCards(int index) {
    return Card(
      color: index%2 == 1?Color(0xff1A939A):Color(0xff55ced5),
      margin: EdgeInsets.only(top: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommunityCard(widget.auth,
                                  widget._callback, posts[index],index%2 == 1?Color(0xff1A939A):Color(0xff55ced5))));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].subject,
                          style: TextStyle(color: Colors.white, fontSize: 23),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Anonymous",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          posts[index].answer.length.toString() + " Answers",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      child: Icon(Icons.thumb_up, color: Colors.white60),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.white54,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, widget.title,
            logout: true, logoutfunc: widget._callback),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add,),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        AddQuestion(widget.auth, widget._callback)));
          },
        ),
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              SearchBar(mySearchController),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return _getCards(index);
                },
              ))
            ],
          ),
        )));
  }
}
