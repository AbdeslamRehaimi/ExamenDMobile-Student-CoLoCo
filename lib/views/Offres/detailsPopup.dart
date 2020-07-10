import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studen_co_loco/widgets/custom_modal_action_button.dart';

class DetailsShow extends StatefulWidget {
  @override
  _DetailsShowState createState() => _DetailsShowState();
}

class _DetailsShowState extends State<DetailsShow> {
  var clients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //padding: EdgeInsets.only(top: 8),
          children: <Widget>[
            
            buildPostSection(
                'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=640',
                "assets/images/main_logo.png"),
            
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
            "Superficier     :  15 m2",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Max Etudiant :  4",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Bundled with :  Wifi, Laver linge, free electricite",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),

          SizedBox(
            height: 8,
          ),
          Divider(
                color: Colors.grey,
                height: 8,
                thickness: 2,
              ),
          CustomModalActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              Navigator.of(context).pop();
            },
          )
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
                  "Co-Loc : House with two rooms",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
                Text(
                  "0625896525",
                  style: TextStyle(
                      fontSize: 16,
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
          height: MediaQuery.of(context).size.width - 150,
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
                
                image: NetworkImage(urlPost)
              )
            ),
        ),
        //THIS IS WHERE TO PUPULATE PRICE AND INFOS OF OFFER
        _displayContent(clients),
      ],
    );
  }

  Widget _displayContent(data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, top: 200.0, bottom: 20.0, right: 50),
        child: Container(
          padding: const EdgeInsets.all(14.0),
          width: 250,
          decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x20000000),
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ]),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.dashboard,
                color: Colors.white,
                size: 20,
              ),
              Divider(
                color: Colors.grey,
                height: 8,
                thickness: 2,
              ),
              Text(
                '500 DH/mois',
                style: TextStyle(
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
