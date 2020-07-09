import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studen_co_loco/helpers/splash_animation.dart';
import 'package:studen_co_loco/views/LoginApp.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //function to set a duration of how long itl be shown to user
  void startTimer() {
    Timer(Duration(seconds: 3), () {
      //Navigator.of(context).pushReplacementNamed('login');
      //Navigator.push(context, SplashAnimation(widget: LoginPage()));
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LoginPage();
      }));
    });
  }

  //Calling our function by launching the interface
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.deepOrange,
      body: Container(
        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/main_logo.png',
            width: MediaQuery.of(context).size.width * 1,
            
          ),
        ),
      ),
    );
  }
}
