import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import "package:latlong/latlong.dart" as LatLng;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studen_co_loco/models/Offers.dart';
import 'package:studen_co_loco/views/Offres/detailsPopup.dart';

class OffersMapPage extends StatefulWidget {
  @override
  _OffersMapPageState createState() => _OffersMapPageState();
}

class _OffersMapPageState extends State<OffersMapPage> {
  List<Marker> allMarkers = [];
  var clients = [];
  Offer allOffers;

  void initState() {
    super.initState();
    populateMarkers();
  }

  setMarkers() {
    for (int i = 0; i < clients.length; i++) {
      addToList(clients[i]);
    }
    /*
    allMarkers.add(
      new Marker(
          width: 45.0,
          height: 45.0,
          point: new LatLng.LatLng(40.73, -74.00),
          builder: (context) => new Container(
                child: IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.red,
                  iconSize: 45.0,
                  onPressed: () {
                    print('Marker Taped');
                  },
                ),
              )),
    );
    */
    return allMarkers;
  }

  populateMarkers() {
    clients = [];
    Firestore.instance.collection('Offers').getDocuments().then((value) {
      if (value.documents.isNotEmpty) {
        for (int i = 0; i < value.documents.length; i++) {
          clients.add(value.documents[i].data);
          //initMarker(value.documents[i].data);
        }
      }
    });
  }

  addToList(variable) async {
    //final query = 'New York, canal street';
    final query = variable['adress'];
    var adresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = adresses.first;

    setState(() {
      allMarkers.add(new Marker(
          width: 45.0,
          height: 45.0,
          point: new LatLng.LatLng(
              first.coordinates.latitude, first.coordinates.longitude),
          builder: (context) => new Container(
                child: IconButton(
                    icon: Icon(Icons.location_on),
                    iconSize: 45.0,
                    onPressed: () {
                      print(variable['adress']);
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                                child: DetailsShow(),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))));
                          });
                      //print('Typed a title offer');
                    }),
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(title: new Text('Leaflet Maps'),
      leading: new IconButton(icon: Icon(Icons.ac_unit), onPressed: () {addToList();}),
      ),*/

      body: new FlutterMap(
          options: new MapOptions(
            //POSITIONED INIT ON BENI MELLAL
            center: new LatLng.LatLng(32.33725, -6.34983), minZoom: 10.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(

                /*
            new Marker(
              width: 45.0,
              height: 45.0,
              point: new LatLng.LatLng(40.73, -74.00),
              builder: (context) => new Container(
                child: IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.red,
                  iconSize: 45.0,
                  onPressed: () {
                    print('Marker Taped');
                  },
                ),
              )
            )
            */
                markers: setMarkers())
          ]),
    );
  }
}
