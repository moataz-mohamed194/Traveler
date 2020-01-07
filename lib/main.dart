import 'dart:async';
import 'dart:io';

import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'globals_values/globals.dart';
import 'home_page/home.dart';
import 'intro/first.dart';
import 'user/login.dart';

Future main() async {
  GlobalState _store = GlobalState.instance;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String boolValue = prefs.getString('installed');
  //print("$boolValue");
  String boolValue2 = prefs.getString('login');
  // print("$boolValue2");
  if (boolValue == 'yes') {
    if (boolValue2 == 'yes') {
      //   print(prefs.getString('email'));
      _store.set('useremail', prefs.getString('email'));
      runApp(hometime());
    } else {
      runApp(installed());
    }
  } else {
    runApp(firsttime());
  }
  /* runApp(
      firsttime()
  );*/
}

class firsttime extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => new First(),
        '/Login': (BuildContext context) => new Login(),
        '/LandPage': (BuildContext context) => new LandPage()
      },
      home: First(),
    );
  }
}

class hometime extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => new First(),
        '/Login': (BuildContext context) => new Login(),
        '/LandPage': (BuildContext context) => new LandPage()
      },
      home: LandPage(),
    );
  }
}

class installed extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => new First(),
        '/Login': (BuildContext context) => new Login(),
        '/LandPage': (BuildContext context) => new LandPage()
      },
      home: Login(),
    );
  }
}
