import 'dart:core';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/menu/setting.dart';
import '../menu/tran.dart';
import 'package:url_launcher/url_launcher.dart';
import '../supermarket/supermarket.dart';
import '../globals_values/globals.dart';
import '../hotel/hotels.dart';
import '../food/food.dart';
import '../menu/about.dart';
import '../gift/gift.dart';
import '../gift/coffee_model.dart';
import '../menu/emergency.dart';
import '../places/places.dart';
import '../plane/file.dart';

class LandPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandPage1();
  }
}

class LandPage1 extends State<LandPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Fisrt1(),
    Fisrt2(),
    Fisrt3(),
    Fisrt4()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String username = "Mohamed Ahmed Lotfy";
  String phonenumber = "01289555089";

  _onclick1() {
    return Firestore.instance.collection('sign_up').getDocuments();
  }

  GlobalState _store = GlobalState.instance;

  QuerySnapshot result;

  @override
  LandPage1() {
    getdata();
    //shared();
  }

  shared2(String q, String w, String e) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', 'yes');
    prefs.setString('email', '$q');
    prefs.setString('username', '$w');
    prefs.setString('phonenumber', '$e');

    /* String usser;
    usser=_store.set('useremail', usser);
usser =prefs.getString('email');*/
  }

  shared(String q, String w, String e) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', 'yes');
    prefs.setString('email', '$q');
    prefs.setString('username', '$w');
    prefs.setString('phonenumber', '$e');

    /* String usser;
    usser=_store.set('useremail', usser);
usser =prefs.getString('email');*/
  }

  get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _store.set('useremail', prefs.getString('email'));
    //  print("jjjjjjjjjjjjjjjjjjjj${prefs.getString('email')}");
    //  print("qqqqqqqqqqqqq${_store.get('useremail')}");
  }

  getdata() async {
    _onclick1().then((result1) {
      setState(() {
        result = result1;
        //   print("fffffffffffffffffffffffffffffffffffffffffffffff");
      });
    });
  }

  Widget _resultList1() {
    if (result != null) {
      return ListView.builder(
          itemCount: result.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            if (_store.get('useremail') == result.documents[i].data['email']) {
              shared(
                  result.documents[i].data['email'],
                  result.documents[i].data['username'],
                  result.documents[i].data['phone_number']);
              _store.set("id", "${result.documents[i].documentID}");

              _store.set("email", "${result.documents[i].data['email']}");
              _store.set("password", "${result.documents[i].data['password']}");
              _store.set("phone_number",
                  "${result.documents[i].data['phone_number']}");
              _store.set("username", "${result.documents[i].data['username']}");
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                accountName: Text("${result.documents[i].data['username']}"),
                accountEmail:
                    Text("${result.documents[i].data['phone_number']}"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/alex.jpg'),
                ),
                arrowColor: Colors.red,
              );
              /*Container(
                child: Column(
                  children: <Widget>[
                    Text("${result.documents[i].data['email']}"),
                    Text("${result.documents[i].data['phone_number']}"),
                    Text("${result.documents[i].data['username']}"),
                  ],
                ),

              );*/

            } else {
              return Container();
            }
          });
    }
  }

  action1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', 'no');
  }

  action() async {
    await FirebaseAuth.instance.signOut().whenComplete(() {
      action1();
      {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false);
      }
    }).catchError((e) {
      // print(e);
    });
    // print('ssssssssssssssssssss');
  }

  Logout() {
    //   print('zzzzzzzzzzzzzzzz');
    action();
    // there is error
    /* async
   await FirebaseAuth.instance.signOut().whenComplete(() {
      {Navigator.of(context).pushNamedAndRemoveUntil('/Login',(Route<dynamic> route)=>false);}

    }).catchError((e){
      print(e);
    });*/
  }

  String url = "https://translate.google.com.eg/?hl=en&tab=wT&authuser=0";

  Translation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => tranclation1()));

//    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(
          title: Text('Visit Egypt'),
          backgroundColorStart: Color(0xFFFBD52D),
          backgroundColorEnd: Color(0xFFEF3A7B),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              _resultList1(),
              ListTile(
                title: Text('Translation'),
                onTap: () {
                  Translation();
                },
              ),
              Divider(),
              ListTile(
                title: Text('emergency'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => emergency()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('settings'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => setting1()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('about'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => about()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  Logout();
                },
              ),
            ],
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class Fisrt1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Ccc();
  }
}

class Ccc extends State<Fisrt1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: FlatButton(
                child: Image.asset('images/plane.png'),
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => flites()));

                  //   print("plane");
                }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: FlatButton(
                child: Image.asset('images/hotel2.png'),
                onPressed: (() {
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hotels()));
                  }
                  //     print("hotel");
                }),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 6,
              child: FlatButton(
                child: Image.asset('images/location.png'),
                onPressed: (() {
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Places()));
                  }
                  //        print("map");
                }),
              ),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: FlatButton(
                child: Image.asset('images/food.png'),
                onPressed: (() {
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => food()));
                  }
                  // print("food");
                }),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: FlatButton(
                child: Image.asset('images/shopping.png'),
                onPressed: (() {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage111()));
                  }
                  //     print("shopping");
                }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: FlatButton(
                child: Image.asset('images/gift.png'),
                onPressed: (() {
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => gift()));
                  }
                  //  print("gift");
                }),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Fisrt2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Ccc2();
  }
}

class Ccc2 extends State<Fisrt2> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Index 1: Business',
          style: optionStyle,
        )
      ],
    );
  }
}

class Fisrt3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Ccc3();
  }
}

class Ccc3 extends State<Fisrt3> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Index 2: Business',
          style: optionStyle,
        )
      ],
    );
  }
}

class Fisrt4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Ccc4();
  }
}

class Ccc4 extends State<Fisrt4> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Index 3: Business',
          style: optionStyle,
        )
      ],
    );
  }
}
