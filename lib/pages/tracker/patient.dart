import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dementia_plus/models/tracker.dart';
import 'package:dementia_plus/pages/tracker/sender.dart';
import 'package:dementia_plus/tools/firestorehelper.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Patient extends StatefulWidget {
  final String collection = "tracker";

  @override
  State<StatefulWidget> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  FirestoreHelper _firestore = FirestoreHelper("tracker");
  Tracker _tracker;
  int pin;
  var docID;
  StreamSubscription<QuerySnapshot> subscription;
  StreamSubscription<DocumentSnapshot> subscription2;
  bool successUpload = false;
  void createEntry() async {
    pin = Random().nextInt(1000);
    subscription = Firestore.instance
        .collection(widget.collection)
        .where("pin", isEqualTo: pin)
        .snapshots()
        .listen((data) async {
      if (data.documents.length == 0) {
        Position pos = await Geolocator().getCurrentPosition();
        _tracker =
            Tracker(pin.toString(), GeoPoint(pos.latitude, pos.longitude));
        docID = await _firestore.addData(_tracker.toMap());
        setState(() {
          successUpload = true;
        });
      } else {
        setState(() {});
      }
    });
  }

  void listenForConnection() {
    subscription2 = Firestore.instance
        .collection(widget.collection)
        .document(docID)
        .snapshots()
        .listen((data) {
      if (data['connected'])
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    Sender(docID, pin.toString())));
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    subscription2.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  // final f = new NumberFormat("0000");
  @override
  Widget build(BuildContext context) {
    if (!successUpload)
      createEntry();
    else
      listenForConnection();
    return Scaffold(
      appBar: customAppBar(context, "Patient"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          successUpload
              ? Text(pin.toString(),
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 100))
              : CircularProgressIndicator(),
          successUpload
              ? Text(
                  "Enter this key in another smartphone",
                  style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),
                )
              : Text("Please Wait"),
        ],
      )),
    );
  }
}
