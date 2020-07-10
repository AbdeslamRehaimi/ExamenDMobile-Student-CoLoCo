import 'package:flutter/material.dart';
import 'package:studen_co_loco/models/Offers.dart';
import 'package:studen_co_loco/services/Authentication.dart';
import 'package:studen_co_loco/views/HomeApp.dart';
import 'package:studen_co_loco/views/Offres/AddOffers/FirstAddOffersLoc.dart';
import 'package:studen_co_loco/views/Offres/AddOffers/TirthAddOfferImage.dart';
import 'package:studen_co_loco/views/RootMaping.dart';
import 'package:studen_co_loco/views/SplachApp.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      //home: new RootPage(auth: new Auth()),
    );
  }
}
