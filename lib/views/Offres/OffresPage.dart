import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studen_co_loco/views/tests/OffreDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:studen_co_loco/views/Offres/detailsPopup.dart';

class OffrePage extends StatefulWidget {
  @override
  _OffrePageState createState() => _OffrePageState();
}

class _OffrePageState extends State<OffrePage> {
  var clients = [];
  List<Widget> list = new List<Widget>();

  void initState() {
    super.initState();
    populateMarkers();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: [
                    buildPostSection(
                      "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=640",
                      "assets/images/profile.png"),
                      buildPostSection(
                      "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=640",
                      "assets/images/profile.png"),
                      buildPostSection(
                      "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=640",
                      "assets/images/profile.png"),
                      
                  //buildPostSection(clients)

                  //Row(children: list)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPostSection(String urlPost, String urlProfilePhoto) {
  //Container buildPostSection(variables) {
    //String urlPost = variable[0]['photo'];
    String urlProfilePhoto = "assets/images/profile.png";
    
      return Container(
        
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildPostFirstRow(urlProfilePhoto),
            SizedBox(
              height: 10,
            ),
            //buildPostPicture(urlPost),
            buildPostPicture(urlPost),
            SizedBox(
              height: 5,
            ),
            Text(
              "Superficier     :  15 m2",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Max Etudiant :  4",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Bundled with :  Wifi, Laver linge, free electricite",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
          ],
        ),
      );
    
  }

  Row buildPostFirstRow(String urlProfilePhoto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Gestion click sur image
            GestureDetector(
              onTap: () {
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
              },
              child: Hero(
                tag: urlProfilePhoto,
                child: CircleAvatar(
                  radius: 12,
                  //backgroundImage: NetworkImage(urlProfilePhoto),
                  child: Image.asset(urlProfilePhoto),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Text(
                    "Co-Loc : House with two rooms",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                              child: DetailsShow(),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ));
                        });
                    //print('Typed a title offer');
                  },
                ),
                Text(
                  "0625896525",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
        Icon(
          Icons.fiber_new,
          color: Colors.red,
          size: 35,
        )
      ],
    );
  }

  Stack buildPostPicture(String urlPost) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlPost),
              )),
        ),
        //THIS IS WHERE TO PUPULATE PRICE AND INFOS OF OFFER
        _displayContent(clients),
      ],
    );
  }

  Widget _displayContent(data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, top: 200.0, bottom: 20.0),
        child: Container(
          padding: const EdgeInsets.all(14.0),
          width: 250,
          decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x20000000),
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ]),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.dashboard,
                color: Colors.white,
                size: 20,
              ),
              Divider(
                color: Colors.grey,
                height: 8,
                thickness: 2,
              ),
              Text(
                '500 DH/mois',
                style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
