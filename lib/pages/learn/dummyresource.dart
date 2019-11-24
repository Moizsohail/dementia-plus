import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummyResource extends StatefulWidget {
  final String text;
  DummyResource(this.text);
  @override
  State<StatefulWidget> createState() => _DummyResourceState();
}

class _DummyResourceState extends State<DummyResource> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, "Resources"),
        body: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Text(widget.text,
                      style: TextStyle(color: Color(0xff1A939A), fontSize: 25)),
                ),
                Expanded(
                    flex: 1,
                    child: FlatButton(
                      child:
                          Icon(liked ? Icons.favorite : Icons.favorite_border),
                      onPressed: () {
                        setState(() {
                          liked = !liked;
                        });
                      },
                    ))
              ]),
              SizedBox(height: 15,),
              Container(
                  child: Card(
                    color: Colors.black,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 70.0),
                                  child: Icon(Icons.play_arrow,color: Colors.white,size: 50,)))))),
                                  SizedBox(height: 15,),
              Text("Summary",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0)),
                      SizedBox(height: 15,),
              Text(
                "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ));
  }
}
