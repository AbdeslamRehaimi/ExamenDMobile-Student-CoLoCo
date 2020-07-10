import 'package:flutter/material.dart';
import 'package:studen_co_loco/models/Offers.dart';
import 'package:studen_co_loco/views/Offres/AddOffers/SecAddOfferDetails.dart';
import 'package:studen_co_loco/widgets/custom_modal_action_button.dart';
import 'package:studen_co_loco/widgets/custom_textfield.dart';
import 'package:studen_co_loco/widgets/custum_numberfield.dart';

class OfferLocationPage extends StatelessWidget {
  final Offer offer;
  OfferLocationPage({Key key, @required this.offer}) : super(key: key);
  //TextEditingController _titre;
  //TextEditingController _adress;
  //TextEditingController _description;

  final _titre = TextEditingController();
  final _adress = TextEditingController();
  final _description = TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Location Inf - 1')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomTextField(labelText: 'Titre du logement', controller: _titre),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomTextField(
                labelText: 'L’adresse du logement', controller: _adress),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomTextField(
                labelText: 'Description du logement', controller: _description),
          ),
         
          MaterialButton(
            child: Text("Continue", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
            height: 45,
            shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.deepOrange,
            padding: EdgeInsets.fromLTRB(140.0, 0.0, 140.0, 0.0),
        
            textColor: Colors.white,
            onPressed: () { 
              
              offer.titre = _titre.text.toString();
              offer.adress = _adress.text.toString();
              offer.description = _description.text.toString();
              
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OfferDetailsPage(offer: offer)));
            },
          ),
        ],
      ),
    );
  }
}
