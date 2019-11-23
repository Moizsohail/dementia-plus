import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dementia_plus/models/tracker.dart';
import 'package:dementia_plus/ui/appbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Sender extends StatefulWidget {
  String collection = "tracker";
  Sender(this.docId, this.pin);
  String pin;
  String docId;
  @override
  State<StatefulWidget> createState() => _SenderState();
}

class _SenderState extends State<Sender> {
  var twoMinute = const Duration(seconds: 40);
  @override
  void initState() {
    super.initState();
    Timer.periodic(twoMinute, send);
  }

  void send(_) async {
    print('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
    Position pos = await Geolocator().getCurrentPosition();
    Firestore.instance
        .collection(widget.collection)
        .document(widget.docId)
        .updateData(
            Tracker(widget.pin, GeoPoint(pos.latitude, pos.longitude)).toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Connected"),
      body: Center(
        child: Text("Sending Location Data"),
      ),
    );
  }
}
