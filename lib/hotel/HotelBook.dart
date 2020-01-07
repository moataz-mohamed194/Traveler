import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../globals_values/globals.dart';

//room booking
class HotelBook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dd();
  }
}

class dd extends State<HotelBook> {
  _onclick() {}
  GlobalState _store = GlobalState.instance;

  List _cities = ["Room Type", "Single", "Double", "Triple"];

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

  String capacity = "0";
  String bathrooms = "0";
  String beds = "0";
  String res0 = "0.0";
  List<String> growableList;

  void changedDropDownItem(String selectedCity) {
    res0 = "0.0";
    setState(() {
      _currentCity = selectedCity;
      if (_currentCity == "Room Type") {
        res0 = growableList[0];
        bathrooms = "0";
        capacity = "0";
        beds = "0";
      } else if (_currentCity == "Single") {
        res0 = growableList[1];
        bathrooms = "1";
        capacity = "1";
        beds = "1";
      } else if (_currentCity == "Double") {
        res0 = growableList[2];
        bathrooms = "1";
        capacity = "2";
        beds = "2";
      } else if (_currentCity == "Triple") {
        res0 = growableList[3];
        bathrooms = "2";
        capacity = "3";
        beds = "3";
      }
    });
  }

  double price = 600.0;

  _onclick1() {
    return Firestore.instance.collection('hotels').getDocuments();
  }

  QuerySnapshot result;

  @override
  dd() {
    hotel1();
  }

  hotel1() async {
    _onclick1().then((result1) {
      setState(() {
        result = result1;
        //    print("fffffffffffffffffffffffffffffffffffffffffffffff");
      });
    });
  }

  String q1, q2, q3, q4, q5, q6, q7, q8, q9;
  double z1, z2, z3;

  Widget _resultList1() {
    if (result != null) {
      return prefix0.ListView.builder(
          itemCount: result.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            if (_store.get('order2222') == result.documents[i].data['img']) {
              q1 = result.documents[i].data['price_of_single'];
              q2 = result.documents[i].data['price_of_Double'];
              q3 = result.documents[i].data['price_of_Triple'];
              z1 = double.parse(q1);
              z2 = double.parse(q2);
              z3 = double.parse(q3);
              growableList = ["0.0", q1, q2, q3];

              return new prefix0.Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        child: Image.network(
                            '${result.documents[i].data['img_room']}'),
                      ),
                      AppBar(
                        iconTheme: IconThemeData(
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Card(
                          child: Container(
                            child: Text(
                              '\ $res0 \nper night',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            padding: EdgeInsets.all(5),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '${result.documents[i].data['name']}',
                                      style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    ),
                                    prefix0.Container(
                                      child: new DropdownButton(
                                        isDense: true,
                                        value: _currentCity,
                                        items: _dropDownMenuItems,
                                        onChanged: changedDropDownItem,
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: FlatButton.icon(
                                onPressed: _onclick,
                                icon: Icon(
                                  Icons.location_on,
                                  size: MediaQuery.of(context).size.width / 20,
                                ),
                                label: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Text(
                                    "${result.documents[i].data['address']}",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Booked 20 times',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'GoudyBookletter'),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Review',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'GoudyBookletter'),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                'Report',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'GoudyBookletter'),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 15,
                          thickness: 2,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Details',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset('images/house.png'),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Column(
                                    children: <Widget>[
                                      Text(''),
                                      Text('Entire place'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset('images/capacity.png'),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '$capacity',
                                        style: TextStyle(
                                          color: Color(0xFF30BCED),
                                        ),
                                      ),
                                      Text('Capacity'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset('images/door.png'),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          color: Color(0xFF30BCED),
                                        ),
                                      ),
                                      Text('Bedrooms'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset('images/Tub.png'),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '$bathrooms',
                                        style: TextStyle(
                                          color: Color(0xFF30BCED),
                                        ),
                                      ),
                                      Text('Bathrooms'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset('images/bed.png'),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '$beds',
                                        style: TextStyle(
                                          color: Color(0xFF30BCED),
                                        ),
                                      ),
                                      Text('Beds'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FlatButton(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFFBD52D), Color(0xFFEF3A7B)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Center(
                              child: Text('Book now',
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 28,
                                      color: Colors.white)),
                            ),
                          ),
                          onPressed: () => null,
                        ),
                      ],
                    ),
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
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              _resultList1(),
            ],
          ),
        ],
      ),
    );
  }
}
