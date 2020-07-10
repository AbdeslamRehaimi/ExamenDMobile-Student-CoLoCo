import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FireBaseMap extends StatefulWidget {
  @override
  _FireBaseMapState createState() => _FireBaseMapState();
}

class _FireBaseMapState extends State<FireBaseMap> {
  var currentClient;
  var currentBearing;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 1;
  //**************** */
  bool mapToggle = false;
  var currentLocation;
  GoogleMapController mapController;
  var clients = [];

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((value) {
      currentLocation = value;
      mapToggle = true;
      populateMarkers();
      print('_________begin___________');
    });
  }

  populateMarkers() {
    clients = [];
    final dbref = FirebaseDatabase.instance.reference().child('example');
    FutureBuilder(
      future: dbref.once(),
      builder: (context, AsyncSnapshot<DataSnapshot> snapshot){
        if(snapshot.hasData){
          clients.clear();
          Map<dynamic, dynamic> values = snapshot.data.value;
          values.forEach((key, values) {
            clients.add(values);
            print(values);
          });
        }
      },
    );
 
  }

  initMarker(client) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    print("marker ID: " + _markerIdCounter.toString());
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(client['geoloc']['latitude'].latitude, client['geoloc']['longitude'].longitude),
      infoWindow: InfoWindow(
          title: client['name'],
          snippet: 'There are currently ' +
              client['name'].toString() +
              ' users here.'),
      onTap: () {
        _onMarkerTapped(markerId);
      },
    );
    setState(() {
      markers[markerId] = marker;
    });
  }


  void _onMarkerTapped(MarkerId markerId) {
    final Marker tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        if (markers.containsKey(selectedMarker)) {
          final Marker resetOld = markers[selectedMarker]
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[selectedMarker] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        markers[markerId] = newMarker;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  //height: MediaQuery.of(context).size.height - 80.0,
                  height: double.infinity,
                  width: double.infinity,
                  child: mapToggle

                      ? GoogleMap(
                          onMapCreated: onMapCreated,
                          initialCameraPosition: CameraPosition(
                            //this is for my location, now changing it to newyork location
                            //target: LatLng(currentLocation.latitude, currentLocation.longitude),
                            target: LatLng(40.730610, -73.935242),
                            zoom: 8.0,
                            tilt: 10.0,
                          ),
                        )
                      : Center(
                          child: Text(
                            'Loading ... Plaise wait..',
                            //style: TextStyle(fontSize: 20.0),
                          ),
                        ))
            ],
          )
        ],
      ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}