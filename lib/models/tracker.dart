import 'package:cloud_firestore/cloud_firestore.dart';

class Tracker {
  String pin;
  GeoPoint location;
  bool connected;
  Tracker(this.pin, this.location,{this.connected = false});
  Map<String, dynamic> toMap() {
    return {"pin": pin, "location": location,"connected":connected};
  }
}
