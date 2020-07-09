import 'package:flutter/material.dart';
import 'package:studen_co_loco/views/HomeApp.dart';
import 'package:studen_co_loco/views/LoginApp.dart';
import 'package:studen_co_loco/views/SplachApp.dart';
import 'views/RegisterApp.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        'login': (context) =>LoginPage()
      },
    );
  }
}
