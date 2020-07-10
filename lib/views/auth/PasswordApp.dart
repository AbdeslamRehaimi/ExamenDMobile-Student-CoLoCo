import 'package:flutter/material.dart';
import 'package:studen_co_loco/helpers/splash_animation.dart';
import 'package:studen_co_loco/views/auth/LoginApp.dart';
import 'package:studen_co_loco/views/auth/RegisterApp.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  String _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                    ),
                    borderRadius: BorderRadius.only(
                        //Radius shape
                        bottomLeft: Radius.circular(160))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/main_logo.png',
                        width: MediaQuery.of(context).size.width * 1,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32, right: 32),
                        child: Text(
                          'Reset Password',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                      ]),

                      child: TextFormField(
                        decoration: InputDecoration(
                        //border: InputBorder.none,
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Email',
                        
                        ),
                        validator: (String value) {
                          if(value.isEmpty){
                            return 'Email is required';
                          }
                        },
                        onSaved: (String value){
                          _email = value;
                        },
                      ),

                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, SplashAnimation(widget: ResetPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, left: 230),
                        child: new Text('Have an account?',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, SplashAnimation(widget: LoginPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, left: 230),
                        child: new Text('Register ?',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Center(
                        child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(120.0, 0.0, 120.0, 0.0),
                        height: 45,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.deepOrange,
                        child: Text(
                          'Send Password'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        /*onPressed: () {
                          Navigator.push(
                              context, SplashAnimation(widget: LoginPage()));
                        },*/
                        onPressed: () {
                          //condition if not valide
                          if(!_formKey.currentState.validate()){
                            return;
                          }  
                          //else validate inputs affectation by calling onSave of the textinput
                          _formKey.currentState.save();
                          print(_email);
                        },
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
