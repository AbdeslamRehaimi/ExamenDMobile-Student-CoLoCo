import 'package:flutter/material.dart';
import 'package:studen_co_loco/helpers/splash_animation.dart';
import 'package:studen_co_loco/services/Authentication.dart';
import 'package:studen_co_loco/views/auth/LoginApp.dart';
import 'package:studen_co_loco/views/auth/PasswordApp.dart';

class RegisterPage extends StatefulWidget {
  //final BaseAuth auth;
  //final VoidCallback loginCallback;
  //RegisterPage({this.auth, this.loginCallback});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _confPassword;
  BaseAuth auth ;
  String userId = "";

  bool _isLoading;
  String _errorMessage;
  bool _isLoginForm;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //Headers
              //showCircularProgress(),
              showHeader(),

              showForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showForm() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 62),
      child: Column(
        children: <Widget>[
          showEmailInput(),
          showPasswordInput(),
          showConfirmPassword(),
          Spacer(),
          new GestureDetector(
            onTap: () {
              Navigator.push(context, SplashAnimation(widget: LoginPage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 230),
              child: new Text('Login ?', style: TextStyle(color: Colors.grey)),
            ),
          ),
          Spacer(),
          Spacer(),
          Container(
            child: Center(
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(140.0, 0.0, 140.0, 0.0),
                height: 45,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.deepOrange,
                child: Text(
                  'Register'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                /*
                onPressed: () {
                  Navigator.push(context, SplashAnimation(widget: LoginPage()));
                },
                */
                onPressed: () {
                  //condition if not valide
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  //else validate inputs affectation by calling onSave of the textinput
                  _formKey.currentState.save();
                  validateAndSubmit();
                  
                }
               
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
          ),
          borderRadius:
              //Radius shape
              BorderRadius.only(bottomLeft: Radius.circular(160))),
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
                'Register',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showConfirmPassword() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: new TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        maxLines: 1,
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Confirme Password is required';
          }
        },
        onSaved: (String value) {
          _confPassword = value;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.security,
            color: Colors.grey,
          ),
          hintText: 'Confirme Password',
        ),
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showEmailInput() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: new TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.email,
            color: Colors.grey,
          ),
          hintText: 'Email',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is required';
          }
        },
        onSaved: (String value) {
          _email = value;
        },
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      margin: EdgeInsets.only(top: 32),
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.vpn_key,
            color: Colors.grey,
          ),
          hintText: 'Password',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is required';
          }
        },
        onSaved: (String value) {
          _password = value;
        },
        //onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    userId = await auth.signIn(_email, _password);
  }
/*
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }
  */
}
