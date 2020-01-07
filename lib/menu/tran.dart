import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart' as prefix1;
import 'package:translator/translator.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class tranclation1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return tranclation12();
  }
}

class tranclation12 extends State<tranclation1> {
  TextEditingController _firsttext;
  TextEditingController _secondtext;

  void initState() {
    _secondtext = new TextEditingController();
    _firsttext = new TextEditingController();
  }

  void pp() {
    translat();
  }

  var translation;
  var _secondtext1 = "0";
  Future translat() async {
    final translator = new GoogleTranslator();

    translation =
        await translator.translate("${_firsttext.text.toString()}", to: 'en');

    setState(() {
      _secondtext1 = translation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: GradientAppBar(
        title: Text('tranclation'),
        backgroundColorStart: Color(0xFFFBD52D),
        backgroundColorEnd: Color(0xFFEF3A7B),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: _firsttext,
              textInputAction: TextInputAction.next,
              decoration: new InputDecoration(
                icon: new Icon(Icons.translate),
                labelText: "Arabic Word",
                hintText: "Arabic Word",
              ),
            ),
            RaisedButton(
              onPressed: () {
                pp();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(child: Icon(Icons.g_translate)),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Translation",
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
              color: Color(0xFFFBD52D),
            ),
            Text(
              "$_secondtext1",
              style: prefix1.TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    ));
  }
}
