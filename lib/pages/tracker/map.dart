import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends StatefulWidget {
  String docId;
  String collection = "tracker";
  Maps(this.docId);
  @override
  State<StatefulWidget> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController _mapController;
  LatLng _mainLocation = LatLng(25.69893, 32.6421);
  final Map<String, Marker> _markers = {};
  Position _currentLocation = Position(latitude: 25.69893, longitude: 32.6421);
  void _getLocation() async {
    _currentLocation = await Geolocator().getCurrentPosition();

    _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(_currentLocation.latitude, _currentLocation.longitude))));
  }

  @override
  void initState() {
    super.initState();

    Firestore.instance
        .collection(widget.collection)
        .document(widget.docId)
        .snapshots()
        .listen((data) {
      GeoPoint location = data['location'];
      setState(() {
        _markers.clear();
        final marker = Marker(
            position: LatLng(location.latitude, location.longitude),
            markerId: MarkerId("curr_loc"));
        _markers["Current Location"] = marker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getLocation,
      // ),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_currentLocation.latitude.toString()),
          Expanded(
              child: GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
                // target: _mainLocation,
                target: LatLng(
                    _currentLocation.latitude, _currentLocation.longitude),
                zoom: 10),
            mapType: MapType.normal,
            markers: _markers.values.toSet(),
            onMapCreated: (controller) {
              setState(() {
                _mapController = controller;
              });
            },
          ))
        ],
      ),
    );
  }
}
