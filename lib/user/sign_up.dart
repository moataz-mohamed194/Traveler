import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'login.dart';

class sign_up extends StatefulWidget {
  @override
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new sign_upPage();
  }
}

class sign_upPage extends State<sign_up> {
  final _formKey = GlobalKey<FormState>();
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

  void initState() {
    _email = new TextEditingController();
    _username = new TextEditingController();
    _phonenumber = new TextEditingController();
    _password = new TextEditingController();
    _password1 = new TextEditingController();
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  bool _isHidden1 = true;

  void _toggleVisibility1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  void showbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('you are disconnected'),
                new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Icon(Icons.close),
                )
              ],
            ),
          );
        });
  }

  void isused() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Your Email Is Used'),
                new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Icon(Icons.close),
                )
              ],
            ),
          );
        });
  }

  String myText3 = "";
  int q = 0;
  int w = 0;
  static int len = 0;
  static int len1 = 0;
  String _email1, _password12;

  String _erroe;

  _onclick() async {
    bool final1 = false;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (_formKey.currentState.validate()) {
      final result = await InternetAddress.lookup('google.com');
      QuerySnapshot _myDoc =
          await Firestore.instance.collection('sign_up').getDocuments();

      List<DocumentSnapshot> _myDocCount = _myDoc.documents;
      setState(() {
        len = _myDocCount.length;
      });
      int i = 0;
      try {
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          //  print('connected');
          final FormState form = _formKey.currentState;
          int len = 0;
          int len1;
          List<DocumentSnapshot> _myDocCount = _myDoc.documents;
          setState(() {
            len = _myDocCount.length;
            len1 = len + 1;
          });
          DateTime now = DateTime.now();
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email.text, password: _password.text)
              .whenComplete(() {
            //     print("added");
            {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            }
            setState(() {
              _erroe = "d";
            });
          }).catchError((e) {
            //  print("Erroeee: $e");
            setState(() {
              _erroe =
                  "PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)";
            });
          });
          if (_erroe ==
              "PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)") {
            isused();
          } else if (_erroe == "d") {
            Firestore.instance.collection('sign_up').document("$len1").setData({
              "username": "${_username.text}",
              "email": "${_email.text}",
              "password": "${_password.text}",
              "phone_number": "${_phonenumber.text}",
              "you_added_in": "${now.toString()}"
            }).catchError((e) {
//              print(e);
            });
            _password.clear();
            _password1.clear();
            _phonenumber.clear();
            _username.clear();
            _email.clear();
          }
        }
      } on SocketException catch (_) {
        //    print('not connected');
        showbottomsheet();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              Container(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Raleway2',
                    color: Color(0xFF636363),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 28,
              ),
              Form(
                key: _formKey,
                child: new Container(
                    child: new Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'EG',
                        favorite: ['+20', 'EG'],
                        showCountryOnly: false,
                        alignLeft: false,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width - 90,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phonenumber,
                            textInputAction: TextInputAction.next,
                            focusNode: _phonenumber555,
                            decoration: new InputDecoration(
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
                          )),
                    ]),
                    new TextFormField(
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
                    new TextFormField(
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
                      controller: _password,
                      keyboardType: TextInputType.text,
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
                        suffixIcon: "Password" == "Password"
                            ? IconButton(
                                onPressed: _toggleVisibility,
                                icon: _isHidden
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              )
                            : null,
                      ),
                      obscureText: "Password" == "Password" ? _isHidden : false,
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
                        suffixIcon: "Password" == "Password"
                            ? IconButton(
                                onPressed: _toggleVisibility1,
                                icon: _isHidden1
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              )
                            : null,
                      ),
                      obscureText:
                          "Password" == "Password" ? _isHidden1 : false,
                      validator: (value) {
                        if (_password.text != _password1.text) {
                          return 'Your password don\'t match';
                        }

                        return null;
                      },
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              Container(
                child: InkWell(
                  child: Text(
                    "By topping on 'Create' you agree to terms of us and privacy policy",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.height / 50,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    /*{
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => forgetpassword()));
                    }*/
                  },
                ),
                //alignment: Alignment.topRight,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              Align(
                child: Container(
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
                          backgroundColor: Colors.transparent, fontSize: 25),
                    ),
                    onPressed: _onclick,
                  ),
                  padding: new EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 100.0),
                ),
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5.5,
              ),
              Column(
                children: <Widget>[
                  Text('I have an account?',
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Raleway',
                      )),
                  InkWell(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
