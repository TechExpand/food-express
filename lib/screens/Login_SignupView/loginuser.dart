import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

//import '../PERMISSIONS.dart';
//import '../vendorPrompt.dart';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/VENDORSIGNUP.dart';
import 'package:foodtruckexpressxd/screens/VendorView/MAp_vendor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:provider/provider.dart';

import 'loginvendor.dart';



class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Login1();
  }
}

class Login1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Login1State();
  }
}

class Login1State extends State<Login1> {
  final VoidCallback continueButton;
  var email;
  var password;

  final form_key = GlobalKey<FormState>();

  Login1State({
    Key key,
    this.continueButton,
  });

  var web = new WebServices();

    @override
    Widget build(BuildContext context) {

        return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'LOGIN',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        body: Form(
          key: form_key,
          child: SingleChildScrollView(
            child: Flexible(
              flex: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                    EdgeInsets.all(MediaQuery
                        .of(context)
                        .size
                        .height / 14),
                    child: Container(
                      width: 150.0,
                      height: 86.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/logotruck.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery
                            .of(context)
                            .size
                            .width / 8, bottom: 10),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Username Required';
                          } else {
                            email = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery
                            .of(context)
                            .size
                            .width / 8, bottom: 10),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password Required';
                          } else {
                            password = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
//                        return VENDORSIGNUP1();
                            }));
                      },
                      child: Text("Don't Have an Account? Register")),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 10,
                            height: 1,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          'or',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 10,
                            height: 1,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
//                          return LoginVendor();
                              }));
                        },
                        child: Text(
                          "Login as a Vendor",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (form_key.currentState.validate()) {
                          web.Login_UserApi(email:email,password:password);
//                        circular();
                        }
                      },
                      color: Colors.blue,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }