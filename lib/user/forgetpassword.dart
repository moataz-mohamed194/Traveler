import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgetpassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyHomePageState2();
  }
}

class _MyHomePageState2 extends State<forgetpassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email;
  final FocusNode _email555 = FocusNode();
  final FocusNode _password555 = FocusNode();
  TextEditingController _password;

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

  _onclick() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: new SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              Container(
                child: Text(
                  "Forget ",
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Enter the user name and phone number that you use to sign up your account",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
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
                              _fieldFocusChange(
                                  context, _email555, _password555);
                            },
                            decoration: new InputDecoration(
                              icon: new Icon(Icons.alternate_email),
                              labelText: "User Name",
                              hintText: "User Name",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter User Name';
                              }
                            },
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _password,
                            textInputAction: TextInputAction.next,
                            focusNode: _password555,
                            onFieldSubmitted: (value) {
                              _password555.unfocus();
                            },
                            decoration: new InputDecoration(
                              icon: new Icon(Icons.phone),
                              labelText: "Phone Number",
                              hintText: "Phone Number",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Phone Number';
                              }
                            },
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, right: 10),
                      child: InkWell(
                        child: Text(
                          "Resend",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        onTap: () {
                          //         print("fffffffff");
                        },
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [Color(0xfffbd12d), Color(0xffef3b78)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: FlatButton(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              backgroundColor: Colors.transparent,
                              fontSize: 25),
                        ),
                        onPressed: _onclick,
                      ),
                      margin: new EdgeInsets.only(top: 40),
                      padding: new EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 100.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
