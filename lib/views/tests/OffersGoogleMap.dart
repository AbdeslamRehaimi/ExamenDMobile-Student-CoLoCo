import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleMapApp extends StatefulWidget {
  @override
  _GoogleMapAppState createState() => _GoogleMapAppState();
}

class _GoogleMapAppState extends State<GoogleMapApp> {
  
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
    });
  }

  populateMarkers() {
    clients = [];
    Firestore.instance.collection('markers').getDocuments().then((value) {
      if (value.documents.isNotEmpty) {
        for (int i = 0; i < value.documents.length; i++) {
          clients.add(value.documents[i].data);
          initMarker(value.documents[i].data);
        }
      }
    });
  }

/*
  initMarker(client){
    mapController.clearMarkers().then((val) {
      mapController.addMarker(MarkerOptions(
      position:
      LatLng(client['location'].latitude, client['location'].longitude),
      draggable: false,
      infoWindowText: InfoWindowText(client['clientName'], 'Nice')));
    });
  }
 */
  initMarker(client) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    print("marker ID: " + _markerIdCounter.toString());
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(client['location'].latitude, client['location'].longitude),
      infoWindow: InfoWindow(
          title: client['clientName'],
          snippet: 'There are currently ' +
              client['clientName'].toString() +
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
    return Scaffold(
      appBar: AppBar(
        title: Text('map'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height - 80.0,
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
                            style: TextStyle(fontSize: 20.0),
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
