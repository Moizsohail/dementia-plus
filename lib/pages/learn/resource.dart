import 'package:dementia_plus/pages/learn/dummyresource.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';

class Resource extends StatefulWidget {
  Resource(this.title);
  final String title;
  @override
  State<StatefulWidget> createState() => _ResourceState();
}

class _ResourceState extends State<Resource> {
  Widget getCard() {
    return Container(
        child: Card(
      child: Container(
        padding: EdgeInsets.all(9.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: InkWell(
                child: Text(
                  "Refusal To Eat",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DummyResource("Refusal to eat")));
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                child: Icon(
                  Icons.favorite_border,
                  color: Color(0xff1A939A),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text(widget.title),
                    background: Image.network(
                      "https://images.pexels.com/photos/278312/pexels-photo-278312.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                      fit: BoxFit.cover,
                    )))
          ];
        },
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return getCard();
          },
        ),
      ),
    );
  }
}
