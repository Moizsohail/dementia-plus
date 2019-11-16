import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
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
                            prefixIcon: Icon(Icons.search),
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
              Expanded(
                  child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(posts[index]),
                  );
                },
              ))
            ],
          ),
        )));
  }
}
