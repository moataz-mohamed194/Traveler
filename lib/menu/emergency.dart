import 'dart:core';
import 'dart:ui';

import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class emergency extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return emergency1();
  }
}

class emergency1 extends State<emergency> {
  call1() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(
          title: Text('Emergency'),
          backgroundColorStart: Color(0xFFFBD52D),
          backgroundColorEnd: Color(0xFFEF3A7B),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Center(
                child: Text(
                  "emergency",
                  style: prefix0.TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    launch("tel:123");
                    call1();
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: prefix0.Column(
                        children: <Widget>[
                          Text(
                            "Ambulance service:",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.teal.shade900,
                                fontFamily: 'Source_Sans_Pro'),
                          ),
                          Text(
                            "123",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.teal.shade900,
                                fontFamily: 'Source_Sans_Pro'),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  )),
              GestureDetector(
                  onTap: () {
                    launch("tel:125");
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: prefix0.Column(
                        children: <Widget>[
                          Text("Civil defense and fire fighting:",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source_Sans_Pro')),
                          Text("125",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source_Sans_Pro')),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  )),
              GestureDetector(
                  onTap: () {
                    launch("tel:122");
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: prefix0.Column(
                        children: <Widget>[
                          Text("Police:",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source_Sans_Pro')),
                          Text("122",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source_Sans_Pro')),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  )),
              GestureDetector(
                  onTap: () {
                    launch("tel:+201221110000");
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: prefix0.Column(
                        children: <Widget>[
                          Text("Road emergencies:",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source_Sans_Pro')),
                          Text("012 2111 0000",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source_Sans_Pro')),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  )),
              GestureDetector(
                  onTap: () {
                    launch("tel:180");
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: prefix0.Column(
                        children: <Widget>[
                          Text("The current civil defense:",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source_Sans_Pro')),
                          Text("180",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source_Sans_Pro')),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
