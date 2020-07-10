import 'package:flutter/material.dart';
import 'package:studen_co_loco/models/Offers.dart';
import 'package:studen_co_loco/views/Offres/AddOffers/TirthAddOfferImage.dart';
import 'package:studen_co_loco/widgets/custom_modal_action_button.dart';
import 'package:studen_co_loco/widgets/custom_textfield.dart';
import 'package:studen_co_loco/widgets/custum_numberfield.dart';


class OfferDetailsPage extends StatefulWidget {
  final Offer offer;
  OfferDetailsPage({Key key, @required this.offer}) : super(key: key);

  @override
  _OfferDetailsPageState createState() => _OfferDetailsPageState();
}

class _OfferDetailsPageState extends State<OfferDetailsPage> {

  TextEditingController _superficie = new TextEditingController();
  TextEditingController _capacite = new TextEditingController();
  TextEditingController _prix = new TextEditingController();
  Offer offer;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Location Details - 2')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomTextField(
                labelText: 'Superficie du logement', controller: _superficie),
            ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomTextField(
                labelText: 'Capacite du logement', controller: _capacite),
            ),
          
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomTextField(
                labelText: 'Prix du logement', controller: _prix),
          ),
          Spacer(),
          RaisedButton(
            child: Text("Continue"),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () {
              offer.superficie = _superficie.text;
              offer.capacite = _capacite.text;
              offer.prix = _prix.text;
              Navigator.push(context, MaterialPageRoute(builder: (context) => OfferImagePage(offer: offer)));
            },
          ),
        ],
      ),

    );
  }
  
    
}