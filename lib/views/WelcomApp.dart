import 'package:flutter/material.dart';
import 'package:studen_co_loco/helpers/splash_animation.dart';
import 'package:studen_co_loco/views/LoginApp.dart';

/*
 onPressed:(){
                            Navigator.push(
                              context, SplashAnimation(widget: LoginPage())
                            );
                          }, 
                          */
class WelcomPage extends StatefulWidget {
  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.person,
                  size: 90,
                  color: Colors.white,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: 'Email',
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    )));
  }
}
