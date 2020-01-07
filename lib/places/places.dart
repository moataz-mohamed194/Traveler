import 'dart:core';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../globals_values/globals.dart';
import 'viewpalces.dart';

class Places extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState000();
  }
}

class _MyHomePageState000 extends State<Places> {
  GlobalState _store = GlobalState.instance;

  List _cities = ["", "Single", "Double", "Triple"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
        value: city,
        child: new Text(city),
      ));
    }
    return items;
  }

  double res0 = 200;

  void changedDropDownItem(String selectedCity) {
    List<double> growableList = [0.0, 200, 300, 400];
    res0 = growableList[0];
    setState(() {
      _currentCity = selectedCity;
      if (_currentCity == "") {
        res0 = growableList[1];
      } else if (_currentCity == "Single") {
        res0 = growableList[1];
      } else if (_currentCity == "Double") {
        res0 = growableList[2];
      } else if (_currentCity == "Triple") {
        res0 = growableList[3];
      }
    });
  }

  var res;
  String fir = "          ";
  String sec = "          ";
  double price = 600.0;
  int a1 = 0, a2 = 2, a3 = 0, a4 = 2, a5 = 1;
  bool pressed1 = false;
  bool pressed2 = true;
  bool pressed3 = true;
  bool pressed4 = true;
  bool pressed5 = true;
  bool pressed6 = true;
  bool pressed7 = true;
  bool pressed8 = true;
  QuerySnapshot result;

  _onclick1() {
    return Firestore.instance.collection('places').getDocuments();
  }

  @override
  _MyHomePageState000() {
    hotel1();
  }

  hotel1() async {
    _onclick1().then((result1) {
      setState(() {
        result = result1;
        print("fffffffffffffffffffffffffffffffffffffffffffffff");
      });
    });
  }

  String _places = "all";
  String dropdownValue;

  Widget _resultList1() {
    if (result != null) {
      return prefix0.ListView.builder(
          itemCount: result.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            if (_places == result.documents[i].data['place']) {
              return prefix0.Column(
                children: <Widget>[
                  InkWell(
                    child: prefix0.Stack(
                      children: <Widget>[
                        Container(
                          alignment: prefix0.Alignment.center,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                            child: Image.network(
                              "${result.documents[i].data['img']}",
                              width: MediaQuery.of(context).size.width / 1.2,
                            ),
                          ),
                        ),
                        Container(
                          alignment: prefix0.Alignment.center,
                          child: prefix0.Text(
                            "${result.documents[i].data['name']}",
                            style: prefix0.TextStyle(
                              fontSize: 20,
                              color: prefix0.Color(0xFFF47E58),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      {
                        dropdownValue = result.documents[i].data['name'];

                        _store.set('order', dropdownValue);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => viewplaces()));
                      }
                      print("555555555555555555555");
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                ],
              );
            } else if (_places == "all") {
              return prefix0.Column(
                children: <Widget>[
                  InkWell(
                    child: prefix0.Stack(
                      children: <Widget>[
                        Container(
                          alignment: prefix0.Alignment.center,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                            child: Image.network(
                              "${result.documents[i].data['img']}",
                              width: MediaQuery.of(context).size.width / 1.2,
                            ),
                          ),
                        ),
                        Container(
                          alignment: prefix0.Alignment.center,
                          child: prefix0.Text(
                            "${result.documents[i].data['name']}",
                            style: prefix0.TextStyle(
                              fontSize: 20,
                              color: prefix0.Color(0xFFF47E58),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      {
                        dropdownValue = result.documents[i].data['name'];

                        _store.set('order', dropdownValue);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => viewplaces()));
                      }

                      print("555555555555555555555");
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                ],
              );
            } else {
              return prefix0.Container();
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
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('Visit Egypt'),
          backgroundColorStart: Color(0xFFFBD52D),
          backgroundColorEnd: Color(0xFFEF3A7B),
        ),
        body: prefix0.Container(
            child: Center(
          child: prefix0.Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: prefix0.Center(
                    child: Container(
                      alignment: prefix0.Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      height: prefix0.MediaQuery.of(context).size.height / 23,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressed6 = true;
                                  pressed7 = true;
                                  pressed8 = true;
                                  pressed1 = !pressed1;
                                  pressed2 = true;
                                  pressed3 = true;
                                  pressed4 = true;
                                  pressed5 = true;
                                  this._places = "all";
                                });
                              },
                              child: Text(
                                "All",
                                style: pressed1
                                    ? TextStyle(color: Colors.black)
                                    : TextStyle(color: Colors.green),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressed4 = true;
                                  pressed3 = true;
                                  pressed2 = true;
                                  pressed1 = true;
                                  pressed5 = !pressed5;
                                  pressed6 = true;
                                  pressed7 = true;
                                  pressed8 = true;
                                  this._places = "Cairo";
                                });
                              },
                              child: Text(
                                "Cairo",
                                style: pressed5
                                    ? TextStyle(color: Colors.black)
                                    : TextStyle(color: Colors.green),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressed6 = true;
                                  pressed7 = true;
                                  pressed8 = true;
                                  pressed3 = true;
                                  pressed5 = true;
                                  pressed1 = true;
                                  pressed2 = true;
                                  pressed4 = !pressed4;
                                  this._places = "Alexandria";
                                });
                              },
                              child: Text(
                                "Alexandria",
                                style: pressed4
                                    ? TextStyle(color: Colors.black)
                                    : TextStyle(color: Colors.green),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressed5 = true;
                                  pressed4 = true;
                                  pressed1 = true;
                                  pressed2 = true;
                                  pressed3 = !pressed3;
                                  pressed6 = true;
                                  pressed7 = true;
                                  pressed8 = true;
                                  this._places = "giza";
                                });
                              },
                              child: Text(
                                "Giza",
                                style: pressed3
                                    ? TextStyle(color: Colors.black)
                                    : TextStyle(color: Colors.green),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressed5 = true;
                                  pressed3 = true;
                                  pressed4 = true;
                                  pressed1 = true;
                                  pressed2 = !pressed2;
                                  pressed6 = true;
                                  this._places = "Luxur";
                                  pressed7 = true;
                                  pressed8 = true;
                                });
                              },
                              child: Text(
                                "Luxur",
                                style: pressed2
                                    ? TextStyle(color: Colors.black)
                                    : TextStyle(color: Colors.green),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressed5 = true;
                                  pressed3 = true;
                                  pressed4 = true;
                                  pressed1 = true;
                                  this._places = "Hurghada";
                                  pressed2 = true;
                                  pressed6 = !pressed6;
                                  pressed7 = true;
                                  pressed8 = true;
                                });
                              },
                              child: Text(
                                "Hurghada",
                                style: pressed6
                                    ? TextStyle(color: Colors.black)
                                    : TextStyle(color: Colors.green),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressed5 = true;
                                  pressed3 = true;
                                  pressed4 = true;
                                  pressed1 = true;
                                  this._places = "Dahab";
                                  pressed6 = true;
                                  pressed2 = true;
                                  pressed7 = !pressed7;
                                  pressed8 = true;
                                });
                              },
                              child: Text(
                                "Dahab",
                                style: pressed7
                                    ? TextStyle(color: Colors.black)
                                    : TextStyle(color: Colors.green),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressed5 = true;
                                  pressed3 = true;
                                  pressed4 = true;
                                  pressed1 = true;
                                  pressed6 = true;
                                  pressed2 = true;
                                  this._places = "Siwa_Oasis";
                                  pressed7 = true;
                                  pressed8 = !pressed8;
                                });
                              },
                              child: Text(
                                "Siwa Oasis",
                                style: pressed8
                                    ? TextStyle(color: Colors.black)
                                    : TextStyle(color: Colors.green),
                              )),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              _resultList1(),
            ],
          ),
        )));
  }
}
