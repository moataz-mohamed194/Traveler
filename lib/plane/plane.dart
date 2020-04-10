import 'dart:core';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../globals_values/globals.dart';
// to make sure that page is work choose the plane time be 2020-10-24 or 2020-12-19

class plane extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return planes();
  }
}

class planes extends State<plane> {
  GlobalState _store = GlobalState.instance;

  booking() {
    print("will open in booking");
  }

  bool res;
  @override
  planes() {
    hotel1();
  }

  QuerySnapshot result;

  _onclick1() {
    return Firestore.instance.collection('plane').getDocuments();
  }

  hotel1() async {
    _onclick1().then((result1) {
      setState(() {
        result = result1;
      });
    });
  }

  String date_plane, date_planefor_user, w1, w2;
  DateTime dateTime_date_plane, dateTime_date_planefor_user;
  Widget _resultList1() {
    if (result != null) {
      return prefix0.ListView.builder(
          itemCount: result.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            date_plane = result.documents[i].data['date'];
            date_planefor_user = _store.get('date');
            dateTime_date_plane = DateTime.parse(date_plane);
            dateTime_date_planefor_user = DateTime.parse(date_planefor_user);
            if (_store.get('from') == result.documents[i].data['from'] &&
                _store.get('to') == result.documents[i].data['to'] &&
                dateTime_date_plane == dateTime_date_planefor_user) {
              res = true;
              return Card(
                  child: InkWell(
                child: Container(
                  padding: prefix0.EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          prefix0.Column(
                            children: <Widget>[
                              Text(
                                "Company :",
                                style: prefix0.TextStyle(fontSize: 12),
                              ),
                              Text(
                                "${result.documents[i].data['company']}",
                                style: prefix0.TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          prefix0.Column(
                            children: <Widget>[
                              Text(
                                "From :",
                                style: prefix0.TextStyle(fontSize: 12),
                              ),
                              Text(
                                "${result.documents[i].data['from']}",
                                style: prefix0.TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          prefix0.Column(
                            children: <Widget>[
                              Text(
                                "to :",
                                style: prefix0.TextStyle(fontSize: 12),
                              ),
                              Text(
                                "${result.documents[i].data['to']}",
                                style: prefix0.TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          prefix0.Container(
                            margin: prefix0.EdgeInsets.only(
                                left:
                                    prefix0.MediaQuery.of(context).size.width /
                                        25),
                            child: prefix0.Column(
                              children: <Widget>[
                                Text("Price:"),
                                Text(":${result.documents[i].documentID}:"),
                                Container(
                                  child: Text(
                                    "${result.documents[i].data['price']}\$",
                                    style: prefix0.TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "${result.documents[i].data['date']}",
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  booking();
                },
              ));
            } else {
              res = false;
              return prefix0.Container(
                  // child: Text("data"),
                  );
            }
          });
    } else {
      return prefix0.Center(
        child: SpinKitDualRing(
          color: Color(0xfff48953),
          size: 50.0,
        ),
      );
    }
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
        body: Container(
          child: Column(
            children: <Widget>[
              _resultList1(),
            ],
          ),
        ),
      ),
    );
  }
}
