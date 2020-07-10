import 'package:flutter/material.dart';
import 'package:studen_co_loco/models/Offers.dart';
import 'package:studen_co_loco/views/Offres/AddOffers/SecAddOfferDetails.dart';
import 'package:studen_co_loco/widgets/custom_modal_action_button.dart';
import 'package:studen_co_loco/widgets/custom_textfield.dart';
import 'package:studen_co_loco/widgets/custum_numberfield.dart';

class OfferLocationPage extends StatefulWidget {
  final Offer offer;
  OfferLocationPage({Key key, @required this.offer}) : super(key: key);

  @override
  _OfferLocationPageState createState() => _OfferLocationPageState();
}

class _OfferLocationPageState extends State<OfferLocationPage> {
  //TextEditingController _titre;
  //TextEditingController _adress;
  //TextEditingController _description;

  final _titre = TextEditingController();
  final _adress = TextEditingController();
  final _description = TextEditingController();


  Offer offer;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Location Inf - 1')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomTextField(labelText: 'Titre u logement', controller: _titre),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomTextField(
                labelText: 'L’adresse du logement', controller: _adress),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomTextField(
                labelText: 'Description u logement', controller: _description),
          ),
         
          RaisedButton(
            child: Text("Continue"),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () { 
              /*
              offer.titre = _titre.text.toString();
              offer.adress = _adress.text.toString();
              offer.description = _description.text.toString();
              */
              print(_titre);
              print('holla');
              print('holla');
              print('holla');
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
