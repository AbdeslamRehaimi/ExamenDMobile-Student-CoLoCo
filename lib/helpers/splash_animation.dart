import 'package:flutter/cupertino.dart';

class SplashAnimation extends PageRouteBuilder{
  final Widget widget;
  SplashAnimation({this.widget}):super(
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secAnimation,
      Widget child
    ){
      animation = CurvedAnimation(parent: animation, curve: Curves.decelerate);
      return ScaleTransition(alignment: Alignment.center, scale: animation, child: child,);
    },
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation){
      return widget;
    }
  );
}