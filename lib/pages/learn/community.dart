import 'package:dementia_plus/tools/authentication.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  Community(this.userId,this.auth,this._callback);
  final String userId;
  final BaseAuth auth;
  final VoidCallback _callback;
  final String title = "Community";
  @override
  State<StatefulWidget> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final mySearchController = TextEditingController();
  List<String> posts;
  @override
  void initState() {
    super.initState();
    posts = List.generate(7, (i) => i.toString());
    mySearchController.addListener(() {
      setState(() {
        posts = List.generate(
            int.parse(mySearchController.text), (i) => i.toString());
      });
    });
  }

  @override
  void dispose() {
    mySearchController.dispose();
    super.dispose();
  }

  Widget _getCards(int index) {
    return Card(
      color: Colors.blue,
      margin: EdgeInsets.only(top: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "How can i deal with the patients arrogance?",
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
                          "5 Answers",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      child: Icon(Icons.thumb_up,color: Colors.white60),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Icon(Icons.thumb_down,color: Colors.white54,),
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
        appBar: customAppBar(context, widget.title),
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search..",
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0))),
                        controller: mySearchController,
                      )),
                  Expanded(
                      flex: 1,
                      child: RaisedButton(
                        child: Icon(Icons.add),
                        shape: CircleBorder(),
                        onPressed: () {},
                      ))
                ],
              ),
              SizedBox(height: 10.0,),
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
