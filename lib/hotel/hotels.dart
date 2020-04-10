import 'dart:core';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../globals_values/globals.dart';
import 'HotelBook.dart';

class Hotels extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Hotel();
  }
}

class Hotel extends State<Hotels> {
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
  List<double> growableList;

  void changedDropDownItem(String selectedCity) {
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

  GlobalState _store = GlobalState.instance;
  var res;
  String fir = "----/--/--";
  String sec = "----/--/--";
  String dropdownValue;
  double price = 600.0;
  int a1 = 0, a2 = 2, a3 = 0, a4 = 2, a5 = 1;
  QuerySnapshot result;

  _onclick() {
    return Firestore.instance.collection('hotels').getDocuments();
  }

  String _img;

  @override
  Hotel() {
    Hotel1();
  }

  Hotel1() async {
    _onclick().then((result1) {
      setState(() {
        result = result1;
      });
    });
  }

  String _name;
  String _address;
  String q1, q2, q3, q4, q5, q6, q7, q8, q9;
  int x1, x2, x3, x4, x5;
  double z1, z2, z3;

  Widget _resultList() {
    if (result != null) {
      return prefix0.ListView.builder(
          itemCount: result.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            _name = result.documents[i].data['name'];
            _address = result.documents[i].data['address'];
            q1 = result.documents[i].data['price_of_single'];
            q2 = result.documents[i].data['price_of_Double'];
            q3 = result.documents[i].data['price_of_Triple'];
            z1 = double.parse(q1);
            z2 = double.parse(q2);
            z3 = double.parse(q3);
            growableList = [0.0, z1, z2, z3];
            return prefix0.Column(
              children: <Widget>[
                InkWell(
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0)),
                              child: Image.network(
                                "${result.documents[i].data['img']}",
                                width: MediaQuery.of(context).size.width / 2.4,
                                height: MediaQuery.of(context).size.width / 3,
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "$_name",
                                    style: prefix0.TextStyle(
                                        fontSize: prefix0.MediaQuery.of(context)
                                                .size
                                                .width /
                                            20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: prefix0.MediaQuery.of(context)
                                                .size
                                                .width /
                                            28,
                                      ),
                                      SingleChildScrollView(
                                        child: Text(
                                          "$_address",
                                          style: prefix0.TextStyle(
                                              fontSize:
                                                  prefix0.MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      30),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text("\$$q2",
                                      style: prefix0.TextStyle(
                                          fontSize:
                                              prefix0.MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20)),
                                  Row(
                                    children: <Widget>[
                                      result.documents[i].data['one_star'] ==
                                              '0'
                                          ? Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['two_star'] ==
                                              '0'
                                          ? Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['two_star1'] ==
                                              '0'
                                          ? Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['three_star'] ==
                                              '0'
                                          ? Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['four_star'] ==
                                              '0'
                                          ? Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['five_star'] ==
                                              '0'
                                          ? Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['one_star'] ==
                                              '1'
                                          ? Icon(
                                              Icons.star_half,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['two_star'] ==
                                              '1'
                                          ? Icon(
                                              Icons.star_half,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['three_star'] ==
                                              '1'
                                          ? Icon(
                                              Icons.star_half,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['four_star'] ==
                                              '1'
                                          ? Icon(
                                              Icons.star_half,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['five_star'] ==
                                              '1'
                                          ? Icon(
                                              Icons.star_half,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['one_star'] ==
                                              '2'
                                          ? Icon(
                                              Icons.star_border,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['two_star'] ==
                                              '2'
                                          ? Icon(
                                              Icons.star_border,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['three_star'] ==
                                              '2'
                                          ? Icon(
                                              Icons.star_border,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['four_star'] ==
                                              '2'
                                          ? Icon(
                                              Icons.star_border,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                      result.documents[i].data['five_star'] ==
                                              '2'
                                          ? Icon(
                                              Icons.star_border,
                                              color: Colors.yellow,
                                              size: 20,
                                            )
                                          : prefix0.Container(),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  onTap: () {
                    {
                      dropdownValue = result.documents[i].data['img'];

                      _store.set('order2222', dropdownValue);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HotelBook()));
                    }
                    //     print("555555555555555555555");
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
              ],
            );
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

  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: GradientAppBar(
            title: Text('Visit Egypt'),
            backgroundColorStart: Color(0xFFFBD52D),
            backgroundColorEnd: Color(0xFFEF3A7B),
          ),
          body: Center(
              child: prefix0.ListView(
            children: <Widget>[
              Column(
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
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Check-in",
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: new MaterialButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.all(0),
                                  height: 5,
                                  child: new Text("$fir"),
                                  onPressed: () async {
                                    final List<DateTime> picked =
                                        await DateRagePicker.showDatePicker(
                                            context: context,
                                            initialFirstDate:
                                                new DateTime.now(),
                                            initialLastDate:
                                                (new DateTime.now())
                                                    .add(new Duration(days: 7)),
                                            firstDate: new DateTime(date.year),
                                            lastDate:
                                                new DateTime(date.year + 2));
                                    if (picked != null && picked.length == 2) {
                                      setState(() {
                                        res = picked;
                                        fir = "${res[0]}";
                                        fir = fir.substring(0, 10);
                                        sec = "${res[1]}";
                                        sec = sec.substring(0, 10);
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Check-out",
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: new MaterialButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.all(0),
                                  height: 5,
                                  child: new Text("$sec"),
                                  onPressed: () async {
                                    final List<DateTime> picked =
                                        await DateRagePicker.showDatePicker(
                                            context: context,
                                            initialFirstDate:
                                                new DateTime.now(),
                                            initialLastDate:
                                                (new DateTime.now())
                                                    .add(new Duration(days: 7)),
                                            firstDate: new DateTime(date.year),
                                            lastDate:
                                                new DateTime(date.year + 2));
                                    if (picked != null && picked.length == 2) {
                                      //   print(picked);
                                      setState(() {
                                        res = picked;
                                        fir = "${res[0]}";
                                        fir = fir.substring(0, 10);
                                        sec = "${res[1]}";
                                        sec = sec.substring(0, 10);
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Room type",
                                style: TextStyle(color: Colors.white),
                              ),
                              new DropdownButton(
                                isDense: true,
                                value: _currentCity,
                                items: _dropDownMenuItems,
                                onChanged: changedDropDownItem,
                              )
                            ],
                          ),
                        ],
                      ))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  _resultList(),
                ],
              ),
            ],
          ))),
    );
  }
}
