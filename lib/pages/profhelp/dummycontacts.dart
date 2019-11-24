import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';

class DummyContacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DummyContactsState();
}

class _DummyContactsState extends State<DummyContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "HelpLines"),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 30),
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Person" + index.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Contact: +9200000000",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
              );
            },
          )),
    );
  }
}
