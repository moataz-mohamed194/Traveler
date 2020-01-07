import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../user/login.dart';
import 'IntroPages.dart';

//first seen
class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Welcome to Egypt',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway')),
                  ),
                  Container(
                    child: Text(
                      'Take the full control of your visit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontFamily: 'GoudyBookletter'),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.5),
                  child: Image.asset('images/pyramids.png')),
              Container(
                child: FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text('Start your journey →',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'Raleway')),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IntroPages()),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
