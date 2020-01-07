import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../user/login.dart';
import 'first.dart';

class IntroPages extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: Colors.white,
      bubbleBackgroundColor: Colors.green,
      body: Text(
        'Choose the flight company, check the flight schedule and book your flight',
      ),
      title: Text('Book your flight'),
      mainImage: Image.asset(
        'images/flight.png',
        width: 350,
        height: 350,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(
        fontSize: 35,
        fontFamily: 'Raleway2',
        color: Color(0xFF636363),
      ),
      bodyTextStyle: TextStyle(
          fontSize: 20,
          fontFamily: 'GoudyBookletter',
          color: Color(0xFFBBBABA)),
    ),
    PageViewModel(
      pageColor: Colors.white,
      bubbleBackgroundColor: Color(0xFFEF3A7B),
      body: Text('Find your ideal hoteal for the price and book your room'),
      title: Text('Book your hotel'),
      mainImage: Image.asset(
        'images/hotel.png',
        width: 350,
        height: 350,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(
        fontSize: 35,
        fontFamily: 'Raleway2',
        color: Color(0xFF636363),
      ),
      bodyTextStyle: TextStyle(
        fontSize: 22,
        fontFamily: 'GoudyBookletter',
        color: Color(0xFFBBBABA),
      ),
    ),
    PageViewModel(
      pageColor: Colors.white,
      bubbleBackgroundColor: Colors.yellow,
      body: Text(
          'Take your tour guide any where an enjoy your journey as never done before'),
      title: Text('Always be guided'),
      mainImage: Image.asset(
        'images/guid.png',
        width: 350,
        height: 350,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(
        fontSize: 35,
        fontFamily: 'Raleway2',
        color: Color(0xFF636363),
      ),
      bodyTextStyle: TextStyle(
          fontSize: 22,
          fontFamily: 'GoudyBookletter',
          color: Color(0xFFBBBABA)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        pages,
        onTapDoneButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        pageButtonsColor: Color(0xFFEF3A7B),
        pageButtonTextSize: 25,
      ),
    );
  }
}
