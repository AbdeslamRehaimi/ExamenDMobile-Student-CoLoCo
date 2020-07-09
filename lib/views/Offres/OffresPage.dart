import 'package:flutter/material.dart';
import 'package:studen_co_loco/views/Offres/OffreDetails.dart';
import 'package:flutter/cupertino.dart';

class OffrePage extends StatefulWidget {
  @override
  _OffrePageState createState() => _OffrePageState();
}

class _OffrePageState extends State<OffrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: [
                  buildPostSection('assets/images/main_logo.png',
                      "assets/images/main_logo.png"),
                  buildPostSection(
                      "assets/images/02.png", "assets/images/profile.png"),
                  buildPostSection(
                      "assets/images/03.png", "assets/images/profile.png"),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPostSection(String urlPost, String urlProfilePhoto) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPostFirstRow(urlProfilePhoto),
          SizedBox(
            height: 10,
          ),
          buildPostPicture(urlPost),
          SizedBox(
            height: 5,
          ),
          Text(
            "963 likes",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Row buildPostFirstRow(String urlProfilePhoto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => OffreDetailsPage( url: urlProfilePhoto)));
              },
              child: Hero(
                tag: urlProfilePhoto,
                child: CircleAvatar(
                  radius: 12,
                  //backgroundImage: NetworkImage(urlProfilePhoto),
                  child: Image.asset(urlProfilePhoto),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tom Smith",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Iceland",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
        Icon(
          Icons.fiber_new,
          color: Colors.red,
          size: 35,
        )
      ],
    );
  }

  Stack buildPostPicture(String urlPost) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlPost),
              )),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Icon(Icons.favorite,
              size: 35, color: Colors.white.withOpacity(0.7)),
        )
      ],
    );
  }
}
