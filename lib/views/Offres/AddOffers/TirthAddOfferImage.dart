import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studen_co_loco/models/Offers.dart';
import 'package:studen_co_loco/widgets/custom_modal_action_button.dart';
import 'package:studen_co_loco/widgets/custom_textfield.dart';
import 'package:studen_co_loco/widgets/custum_numberfield.dart';




class OfferImagePage extends StatefulWidget {
  final Offer offer;
  
  OfferImagePage({Key key, @required this.offer}) : super(key: key);

  @override
  _OfferImagePageState createState() => _OfferImagePageState();
}

class _OfferImagePageState extends State<OfferImagePage> {

  TextEditingController _photo = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  Offer offer;
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Location Photo - 3')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: <Widget>[
           Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomTextField(
                labelText: 'Phone du logement', controller: _phone),
          ),
          
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomTextField(
                labelText: 'Photo du logement', controller: _photo),
          ),
          
          Spacer(),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text("Enregistrer"),
            onPressed: () async {
              //offer.photo = _photo.text; 
              //offer.tel =  _phone.text;
              Offer newOffer = new Offer('Titre Example', 'Titre Example', 'Titre Example','Titre Example', 'Titre Example', 'Titre Example','Titre Example', 'Titre Example');
              print('object');

              Firestore.instance.collection("Offers").add({
                 "name": "john",
                  "age": 50,
                  "email": "example@example.com",
              }).then((value) {
                print(value.documentID);
                Firestore.instance
                    .collection("offers")
                    .document(value.documentID);
              });
              /*
              await db.collection('offers').add(
                newOffer.toJson()
              );
              */
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),

    );
  }
  
    
}