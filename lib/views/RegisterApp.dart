import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading;
  String _errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
        children: <Widget>[
          
          //Headers
          //showCircularProgress(),
          showHeader(),
          showForm(),
        ],
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
          showFullNameInput(),
          showEmailInput(),
          showPasswordInput(),
          Spacer(),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: Text(
                'Register'.toUpperCase(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.person,
              size: 90,
              color: Colors.white,
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

  Widget showFullNameInput() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: new TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          hintText: 'Full Name',
        ),
        validator: (value) =>
            value.isEmpty ? 'Full Name can\'t be empty' : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showEmailInput() {
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
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
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
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        //onSaved: (value) => _password = value.trim(),
      ),
    );
  }


}
