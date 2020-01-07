import 'dart:core';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../globals_values/globals.dart';
import '../home_page/home.dart';
import 'package:url_launcher/url_launcher.dart';

class setting1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return setting12();
  }
}

class setting12 extends State<setting1> {
  final _formKey = GlobalKey<FormState>();
  GlobalState _store = GlobalState.instance;

  TextEditingController _email;
  final FocusNode _email555 = FocusNode();
  final FocusNode _username555 = FocusNode();
  final FocusNode _phonenumber555 = FocusNode();
  final FocusNode _password555 = FocusNode();
  final FocusNode _password5551 = FocusNode();
  TextEditingController _password;
  TextEditingController _phonenumber;
  TextEditingController _username;
  TextEditingController _password1;
  String _email1, _password12;
  bool _isHidden = true;
  void initState() {
    _email = new TextEditingController();
    _email.text = _store.get("email");
    _username = new TextEditingController();
    _username.text = _store.get("username");
    _phonenumber = new TextEditingController();
    _phonenumber.text = _store.get("phone_number");
    _password = new TextEditingController();
    _password.text = _store.get("password");
    _password1 = new TextEditingController();
    _password1.text = _store.get("password");
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  DateTime now = DateTime.now();

  _onclick() {
    if (_formKey.currentState.validate()) {
      Firestore.instance
          .collection('sign_up')
          .document("${_store.get("id")}")
          .setData({
        "username": "${_username.text}",
        "email": "${_email.text}",
        "password": "${_password.text}",
        "phone_number": "${_phonenumber.text}",
        "password": "${_password.text}",
        "you_added_in": "${now.toString()}"
      }).whenComplete(() {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email.text, password: _password.text)
            .whenComplete(() {
          if (_email.text != "${_store.get("email")}") {
            _store.set("useremail", _email.text);
          }
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/LandPage', (Route<dynamic> route) => false);
        });
      });
    }
  }

  @override
  prefix0.Widget build(prefix0.BuildContext context) {
    // TODO: implement build
    return prefix0.SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(
          title: Text('setting'),
          backgroundColorStart: Color(0xFFFBD52D),
          backgroundColorEnd: Color(0xFFEF3A7B),
        ),
        body: prefix0.Container(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _username,
                      textInputAction: TextInputAction.next,
                      focusNode: _username555,
                      onFieldSubmitted: (term) {
                        _fieldFocusChange(context, _username555, _email555);
                      },
                      decoration: new InputDecoration(
                        icon: new Icon(Icons.person),
                        labelText: "Your User Name",
                        hintText: "Enter your User Name",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your User Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      textInputAction: TextInputAction.next,
                      focusNode: _email555,
                      onSaved: (input) => _email1 = input,
                      onFieldSubmitted: (term) {
                        _fieldFocusChange(context, _email555, _password555);
                      },
                      decoration: new InputDecoration(
                        icon: new Icon(Icons.alternate_email),
                        labelText: "Your Email",
                        hintText: "Enter your Email",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your Eamil';
                        }
                        if (value.contains("@gmail")) {
                          return null;
                        } else if (value.contains(".")) {
                          return "your Eamil doesn't validat";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phonenumber,
                      textInputAction: TextInputAction.next,
                      focusNode: _phonenumber555,
                      decoration: new InputDecoration(
                        icon: new Icon(Icons.phone),
                        labelText: "Your Phone Number",
                        hintText: "Enter your Phone Number",
                      ),
                      onFieldSubmitted: (term) {
                        _fieldFocusChange(
                            context, _phonenumber555, _username555);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your Phone Number';
                        } else if (value.length < 6) {
                          return 'your phone number must more than 11';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _password,
                      keyboardType: TextInputType.text,
                      obscureText: "Password" == "Password" ? _isHidden : false,
                      textInputAction: TextInputAction.next,
                      focusNode: _password555,
                      onSaved: (input) => _password12 = input,
                      onFieldSubmitted: (term) {
                        _fieldFocusChange(
                            context, _phonenumber555, _password5551);
                      },
                      decoration: InputDecoration(
                        icon: new Icon(Icons.lock),
                        labelText: "Your Password",
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your password';
                        }
                        if (value.length < 6) {
                          return 'your password must more than 6';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _password1,
                      obscureText: "Password" == "Password" ? _isHidden : false,
                      keyboardType: TextInputType.text,
                      focusNode: _password5551,
                      onFieldSubmitted: (value) {
                        _password5551.unfocus();
                      },
                      decoration: InputDecoration(
                        icon: new Icon(Icons.lock),
                        labelText: "Confirm Password",
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                      validator: (value) {
                        if (_password.text != _password1.text) {
                          return 'Your password don\'t match';
                        }

                        return null;
                      },
                    ),
                    Align(
                      child: Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                colors: [Color(0xfffbd12d), Color(0xffef3b78)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: FlatButton(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                backgroundColor: Colors.transparent,
                                fontSize: 25),
                          ),
                          onPressed: _onclick,
                        ),
                        padding: new EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 100.0),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                    /* Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [Color(0xfffbd12d), Color(0xffef3b78)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: FlatButton(
                        child: Text(
                          "UpDate",
                          style: TextStyle(
                              backgroundColor: Colors.transparent,
                              fontSize: MediaQuery.of(context).size.width / 23),
                        ),
                        onPressed: _onclick,
                      ),
                    )*/
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
