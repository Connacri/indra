import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Geoloca extends StatefulWidget {
  const Geoloca({Key? key}) : super(key: key);

  @override
  _GeolocaState createState() => _GeolocaState();
}

class _GeolocaState extends State<Geoloca> {
  @override
  Widget build(BuildContext context) {
    return Geo();
  }
}

class Geo extends StatefulWidget {
  const Geo({Key? key}) : super(key: key);

  @override
  _GeoState createState() => _GeoState();
}

class _GeoState extends State<Geo> {
  bool mapToggle = false;
  var currentLocation;
  late GoogleMapController mapController;

  void iniState() {
    super.initState();
    Geolocator.getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Demoo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height - 80.0,
                    width: double.infinity,
                    child: mapToggle
                        ? GoogleMap(
                            initialCameraPosition: CameraPosition(
                                target: LatLng(currentLocation.latitude,
                                    currentLocation.longitude),
                                zoom: 10.0),
                            onMapCreated: onMapCreated,
                          )
                        : Center(
                            child: Text(
                              'Loading.. Plaise Kara3..',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ))
              ],
            ),
          )
        ],
      ),
    );
  }

  OnMapCreated() => onMapCreated;

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
