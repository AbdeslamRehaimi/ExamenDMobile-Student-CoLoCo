import 'package:flutter/material.dart';
import 'package:studen_co_loco/services/Authentication.dart';
import 'package:studen_co_loco/views/Offres/OfferAdd.dart';
import 'package:studen_co_loco/views/tests/OfferGoogleFirebase.dart';
import 'package:studen_co_loco/views/tests/OffersGoogleMap.dart';
import 'package:studen_co_loco/views/Offres/OffresPage.dart';
import 'package:studen_co_loco/widgets/custom_button.dart';
import 'package:studen_co_loco/views/auth/LoginApp.dart';
import 'package:studen_co_loco/views/Offres/OffersMap.dart';

class HomePage extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  
  HomePage({Key key, this.auth, this.userId, this.logoutCallback}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //A page controller to manipulate which page is visible in a a view pour user
  PageController _pageController = PageController();
  // btn +
  double currentPage = 0;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });

    final dt = new DateTime.now();
    String dta = '6';

    //implements basic material design visual
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 35,
            color: Theme.of(context).accentColor,
          ),
          Positioned(
            right: 20,
            top: 38,
            //right: 0,
            /*
            child: Text(
              //num date aujourdhui
              dta,
              style: TextStyle(fontSize: 200, color: Color(0x10000000)),
            ),
            */
            child: Image.asset(
              'assets/images/main_logo.png',
              width: MediaQuery.of(context).size.width * .4,
              fit: BoxFit.fitHeight,
            ),
          ),
          _mainContent(context),
        ],
      ),
      //Button plus action .. add events/tasks
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    //which Dialog to add event or task or memo to show to show
                    //if else
                    child:
                        //currentPage == 0 ?  AddTaskPage() : currentPage == 1 ? AddEventPage() : AddMemoPage(),
                        currentPage == 0 ? AddOfferPage() : AddOfferPage(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))));
              });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.airplay),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add_location),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _mainContent(BuildContext context) {
    final dt = new DateTime.now();
    //String dta = DateFormat('EEEE').format(dt);
    String dta = 'June';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            //date aujourdhiu
            dta,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _button(context),
        ),
        //Show page content / the main veiw
        Expanded(
            child: PageView(
          controller: _pageController,
          children: <Widget>[OffrePage(), OffersMapPage()],
          //Declare All my views to show
          //children: <Widget>[TaskPage(), EventPage(), MemoPage()],
        ))
      ],
    );
  }

//Button navigation
  Widget _button(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: CustomButton(
          onPressed: () {
            _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut);
          },
          buttonText: "Offres",
          color:
              //currentPage < 0.5 ? Theme.of(context).accentColor : Colors.white,
              currentPage == 0 ? Theme.of(context).accentColor : Colors.white,
          textColor:
              //currentPage < 0.5 ? Colors.white : Theme.of(context).accentColor,
              currentPage == 0 ? Colors.white : Theme.of(context).accentColor,
          //borderColor: currentPage < 0.5
          borderColor: currentPage == 0
              ? Colors.transparent
              : Theme.of(context).accentColor,
        )),
        SizedBox(
          width: 32,
          //width: 8,
        ),
        Expanded(
            child: CustomButton(
          onPressed: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut);
          },
          buttonText: "Maps",
          color:
              currentPage == 1 ? Theme.of(context).accentColor : Colors.white,
          //currentPage > 0.5 ? Theme.of(context).accentColor : Colors.white,
          textColor:
              currentPage == 1 ? Colors.white : Theme.of(context).accentColor,
          //currentPage > 0.5 ? Colors.white : Theme.of(context).accentColor,
          //borderColor: currentPage > 0.5
          borderColor: currentPage == 1
              ? Colors.transparent
              : Theme.of(context).accentColor,
        ))
      ],
    );
  }
}
