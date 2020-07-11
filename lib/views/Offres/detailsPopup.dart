import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studen_co_loco/widgets/custom_modal_action_button.dart';

class DetailsShow extends StatelessWidget {
  final  variable;
  DetailsShow({Key key, @required this.variable}) : super(key: key);

  DetailsShow dt ;
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
            
            buildPostSection(variable),
            
          ],
        ),
      ),
    );
  }

  Container buildPostSection(variable) {
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
          buildPostFirstRow(variable),
          SizedBox(
            height: 10,
          ),
          buildPostPicture(variable),
          SizedBox(
            height: 5,
          ),
          Text(
            "Superficier     :  ${variable['superficie']}",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Max Etudiant :  ${variable['capacite']}",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Bundled with :  ${variable['description']}",
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
             // Navigator.of(context).pop();
            },
            onSave: () {
              //Navigator.of(context).pop();
            },
          )
        ],
      ),
      
    );
  }

  Row buildPostFirstRow(variable) {
    String urlProfilePhoto = "assets/images/main_logo.png";
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
                  "${variable['titre']}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
                Text(
                  "${variable['tel']}",
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

  Stack buildPostPicture(variable) {
    return Stack(
      children: [
        Container(
          //height: MediaQuery.of(context).size.width - 150,
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
                
                image: NetworkImage(variable['photo'].toString()),
              )
            ),
        ),
        //THIS IS WHERE TO PUPULATE PRICE AND INFOS OF OFFER
        _displayContent(variable),
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
                '${variable['prix']} DH/mois',
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
