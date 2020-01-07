import 'dart:core';
import 'dart:ui';

import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../globals_values/globals.dart';
import 'plane.dart';

class flites extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return flitedata();
  }
}

class flitedata extends State<flites> {
  final DateTime initialDate = DateTime.now();
  static List _airport = [
    "",
    "london airport",
    "cairo airport",
    "alex airport"
  ];
  List<DropdownMenuItem<String>> _dropDownMenuItemsfor_currentairport;
  String _currentairport;

  @override
  void initState() {
    _dropDownMenuItemsfor_currentairport = getDropDownMenuItems();
    _currentairport = _dropDownMenuItemsfor_currentairport[0].value;
    _dropDownMenuItemsfor_newtairport = getDropDownMenuItems();
    _currentairport_newtairport = _dropDownMenuItemsfor_newtairport[0].value;
    numberss = getDropDownMenuItems_newtairport1();
    numbers = numberss[0].value;
    numberss1 = getDropDownMenuItems_newtairport11();
    numbers1 = numberss1[0].value;
    selectedDate = initialDate;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String airport in _airport) {
      items.add(new DropdownMenuItem(
        value: airport,
        child: new Text(airport),
      ));
    }
    return items;
  }

  String now;

  void changedDropDownItemfor_currentairport(String selectedCity) {
    now = _airport[0];
    setState(() {
      _currentairport = selectedCity;
    });
  }

  List _newtairport = _airport;
  List<DropdownMenuItem<String>> _dropDownMenuItemsfor_newtairport;
  String _currentairport_newtairport;

  List<DropdownMenuItem<String>> getDropDownMenuItems_newtairport() {
    List<DropdownMenuItem<String>> items1 = new List();
    for (String airport1 in _newtairport) {
      items1.add(new DropdownMenuItem(
        value: airport1,
        child: new Text(airport1),
      ));
    }
    return items1;
  }

  String future;

  void changedDropDownItemfor_newtairport(String selectedCity) {
    future = _newtairport[0];
    setState(() {
      _currentairport_newtairport = selectedCity;
    });
  }

  static DateTime selectedDate;
  static DateTime date = DateTime.now();
  static String v;
  static String cc = "$date".substring(0, 10);

  List _conut = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  List<DropdownMenuItem<String>> numberss;
  String numbers;

  List<DropdownMenuItem<String>> getDropDownMenuItems_newtairport1() {
    List<DropdownMenuItem<String>> items11 = new List();
    for (String airport11 in _conut) {
      items11.add(new DropdownMenuItem(
        value: airport11,
        child: new Text(airport11),
      ));
    }
    return items11;
  }

  String future1;

  void changedDropDownItemfor_newtairport1(String selectedCity) {
    future = _conut[0];
    setState(() {
      numbers = selectedCity;
    });
  }

  List _conut1 = ["Economy", "Business", "First", "Premium economy"];
  List<DropdownMenuItem<String>> numberss1;
  String numbers1;

  List<DropdownMenuItem<String>> getDropDownMenuItems_newtairport11() {
    List<DropdownMenuItem<String>> items11 = new List();
    for (String airport11 in _conut1) {
      items11.add(new DropdownMenuItem(
        value: airport11,
        child: new Text(airport11),
      ));
    }
    return items11;
  }

  GlobalState _store = GlobalState.instance;
  String future11;

  void changedDropDownItemfor_newtairport11(String selectedCity) {
    future = _conut1[0];
    setState(() {
      numbers1 = selectedCity;
    });
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                prefix0.Row(
                  children: <Widget>[
                    prefix0.Text("count of Traveller"),
                    prefix0.Container(
                      margin: prefix0.EdgeInsets.only(left: 10),
                      child: new DropdownButton(
                        isDense: true,
                        value: numbers,
                        items: numberss,
                        onChanged: changedDropDownItemfor_newtairport1,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    prefix0.Text("Cabin type"),
                    Container(
                      margin: prefix0.EdgeInsets.only(left: 10),
                      child: new DropdownButton(
                        isDense: true,
                        value: numbers1,
                        items: numberss1,
                        onChanged: changedDropDownItemfor_newtairport11,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  search() {
    _store.set("from", _currentairport);
    _store.set("to", _currentairport_newtairport);
    _store.set("date", cc);
    if (_store.get('from') != "" && _store.get('to') != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => plane()));
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
        body: prefix0.Container(
            margin: prefix0.EdgeInsets.all(15),
            child: prefix0.Column(children: <Widget>[
              prefix0.Container(
                margin: prefix0.EdgeInsets.only(bottom: 30),
                child: Row(
                  children: <Widget>[
                    prefix0.Expanded(
                      child: prefix0.Column(
                        children: <Widget>[
                          Card(
                            child: prefix0.Column(
                              children: <Widget>[
                                Text("From"),
                                new DropdownButton(
                                  isDense: true,
                                  value: _currentairport,
                                  items: _dropDownMenuItemsfor_currentairport,
                                  onChanged:
                                      changedDropDownItemfor_currentairport,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    prefix0.Expanded(
                        child: prefix0.Column(
                      children: <Widget>[
                        Card(
                          child: prefix0.Column(
                            children: <Widget>[
                              Text("to"),
                              new DropdownButton(
                                isDense: true,
                                value: _currentairport_newtairport,
                                items: _dropDownMenuItemsfor_newtairport,
                                onChanged: changedDropDownItemfor_newtairport,
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              prefix0.Container(
                margin: prefix0.EdgeInsets.only(bottom: 30),
                child: Row(
                  children: <Widget>[
                    prefix0.Expanded(
                        child: prefix0.Container(
                      child: Card(
                          child: prefix0.Container(
                        child: prefix0.Column(
                          children: <Widget>[
                            Builder(
                              builder: (context) => MaterialButton(
                                child: new Text("Pick date range"),
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate:
                                              selectedDate ?? initialDate,
                                          firstDate: DateTime(
                                              DateTime.now().year - 1, 5),
                                          lastDate: DateTime(
                                              DateTime.now().year + 1, 9))
                                      .then((date) => setState(() {
                                            selectedDate = date;

                                            v = "$selectedDate";
                                            cc = v.substring(0, 10);
                                          }));
                                },
                              ),
                            ),
                            prefix0.Text("$cc")
                          ],
                        ),
                        padding: prefix0.EdgeInsets.only(bottom: 10),
                      )),
                    )),
                    prefix0.Expanded(
                      child: Card(
                          child: prefix0.Container(
                        padding: prefix0.EdgeInsets.only(bottom: 10),
                        child: prefix0.Column(
                          children: <Widget>[
                            FlatButton(
                              child: new Text("Numbers of traveller"),
                              onPressed: _neverSatisfied,
                            ),
                            prefix0.Text("$numbers"),
                          ],
                        ),
                      )),
                    )
                  ],
                ),
              ),
              prefix0.Container(
                height: prefix0.MediaQuery.of(context).size.width / 6,
                width: prefix0.MediaQuery.of(context).size.width / 6,
                child: prefix0.Container(
                  child:
                      IconButton(icon: Icon(Icons.search), onPressed: search),
                  color: Colors.amberAccent,
                ),
              )
            ])),
      ),
    );
  }
}
