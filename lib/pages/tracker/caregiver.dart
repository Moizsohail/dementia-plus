import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dementia_plus/models/tracker.dart';
import 'package:dementia_plus/pages/tracker/map.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';

class Caregiver extends StatefulWidget {
  final collection = "tracker";
  final pin = Random().nextInt(1000);
  @override
  State<StatefulWidget> createState() => _CaregiverState();
}

class _CaregiverState extends State<Caregiver> {
  StreamSubscription<QuerySnapshot> ss;
  
  String docId;
  // final f = new NumberFormat("0000");
  TextEditingController _controller = TextEditingController();
  String error;
  @override
  void initState() {
    super.initState();
    error = null;
  }

  @override
  void dispose() {
    _controller.dispose();
    if(ss != null)ss.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Caregiver"),
      body: Container(
        padding: EdgeInsets.all(9.0),
          child: Form(
              
              child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Container(),),

                  Text("Enter key here",style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),),
                  SizedBox(height: 10,),
                  TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        errorText: error,
                        
                        hintText: "0000",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Expanded(child: Container(),),
                  RaisedButton(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                          "Pair",
                          style: TextStyle(color: Colors.white),
                        ))),
                    padding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_controller.text.isEmpty)
                        setState(() {
                          error = "Required";
                        });
                      ss = Firestore.instance
                          .collection(widget.collection)
                          .where("pin", isEqualTo: _controller.text)
                          .snapshots()
                          .listen((data) async {
                        print(data.documents.length);
                        if (data.documents.length == 0) {
                          setState(() {
                            error = "Incorrect Key";
                          });
                          return null;
                        }
                        error = null;
                        docId = data.documents[0].documentID;
                        print(docId);
                        final Tracker _tracker = Tracker(
                            data.documents[0]['pin'],
                            data.documents[0]['location'],
                            connected: true);
                        await Firestore.instance
                            .collection(widget.collection)
                            .document(docId)
                            .updateData(_tracker.toMap());
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Maps(docId)));
                      });
                    },
                  )
                ],
              )))),
    );
  }
}
