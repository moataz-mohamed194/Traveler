import 'dart:core';
import 'dart:ui';

import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class about extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return about1();
  }
}

class about1 extends State<about> {
  @override
  prefix0.Widget build(prefix0.BuildContext context) {
    // TODO: implement build
    return prefix0.SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(
          title: Text('About'),
          backgroundColorStart: Color(0xFFFBD52D),
          backgroundColorEnd: Color(0xFFEF3A7B),
        ),
        body: prefix0.Container(),
      ),
    );
  }
}
