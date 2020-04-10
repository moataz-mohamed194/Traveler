import 'dart:async';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'globals_values/globals.dart';
import 'home_page/home.dart';
import 'intro/first.dart';
import 'user/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalState _store = GlobalState.instance;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String boolValue = prefs.getString('installed');
  String boolValue2 = prefs.getString('login');
  if (boolValue == 'yes') {
    if (boolValue2 == 'yes') {
      _store.set('useremail', prefs.getString('email'));
      runApp(hometime());
    } else {
      runApp(installed());
    }
  } else {
    runApp(firsttime());
  }
}

class firsttime extends StatelessWidget {
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
