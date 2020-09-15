import 'dart:convert';
import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/screens/Login_SignupView/SIGNUP.dart';
import 'package:foodtruck/screens/VendorView/MAp_vendor.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:provider/provider.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login>{
  var email;
  var password;
  final form_key = GlobalKey<FormState>();
  final form_key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Container(
              color: Colors.white,
              height: 105,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 55,
                    color: Color(0xFF67b9fb),
                    child: TabBar(
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(Icons.person_pin),
                          child: Text('Login as User'),
                        ),
                        Tab(
                          icon: Icon(Icons.directions_car),
                          child: Text('Login as Vendor'),
                        )
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child: AdmobBanner(
                      adUnitId: Provider.of<AdmobService>(context, listen: false).getBannerAdUnitId(),
                      adSize: AdmobBannerSize.BANNER,
                      listener: (AdmobAdEvent event, Map<String, dynamic> args){
                      },
                    )
                  )
                ],
              ),
            )),
        appBar: AppBar(
          actions: <Widget>[
         Image.asset('assets/images/truckIcon.png', width: 100,),
         SizedBox(width: 8,)
        ],
        backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'LOGIN',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        body: TabBarView(
          children: [
            UserLogin(email, password, context, form_key1),
            VendorLogin(email, password, context, form_key)
          ],
        ),
      ),
    );
  }
}

Widget UserLogin(email, password, context, form_key) {
  return Form(
    key: form_key,
    child: SingleChildScrollView(
      child: Flexible(
        flex: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 14),
              child: Container(
               width: 150,
                        height: 100,
                        child: Image.asset('assets/images/logotruck.png')
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, bottom: 10),
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
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, bottom: 10),
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
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SIGNUP();
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.black54,
                   ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Don't Have an Account? Register"),
                    ))),
            ),
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
            Consumer<WebServices>(
              builder: (context, webservices_consumer, child) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: webservices_consumer.login_state == false
                      ? RaisedButton(
                          onPressed: () {
                            if (form_key.currentState.validate()) {
                              webservices_consumer.Login_SetState();
                              webservices_consumer.Login_UserApi(
                                      email: email,
                                      password: password,
                                      context: context)
                                  .then((value) => webservices_consumer
                                      .get_current_user_location()
                                      .then((value) => Timer.periodic(
                                              Duration(minutes: 12), (timer) {
                                            webservices_consumer
                                                .Update_User_Location(
                                              id: value[0].id,
                                              context: context,
                                            );
                                          })));
                            }
                          },
                          color: Color(0xFF67b9fb),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff67b9fb), Color(0xff8acbff)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
                        
                        )
                      : CircularProgressIndicator()),
            )
          ],
        ),
      ),
    ),
  );
}

Widget VendorLogin(email, password, context, form_key) {
  return Form(
      key: form_key,
      child: SingleChildScrollView(
          child: Flexible(
              flex: 20,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 14),
                      child: Container(
                        width: 150,
                        height: 100,
                        child: Image.asset('assets/images/logotruck.png')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 8,
                          bottom: 10),
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
                                  borderRadius: BorderRadius.circular(8)),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 8,
                          bottom: 10),
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
                                  borderRadius: BorderRadius.circular(8)),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SIGNUP();
                            }));
                          },
                          child: Container(
                    decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.black54,
                   ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Don't Have an Account? Register"),
                    ))
                    )),
                    
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[],
                      ),
                    ),
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
                    Consumer<WebServices>(
                      builder: (context, webservices_consumer, child) =>
                          Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            webservices_consumer.login_state == false
                                ? RaisedButton(
                                    onPressed: () {
                                      if (form_key.currentState.validate()) {
                                        webservices_consumer.Login_SetState();
                                        webservices_consumer.Login_VendorApi(
                                                email: email,
                                                password: password,
                                                context: context)
                                            .then((value) => webservices_consumer
                                                .get_current_vendor_location()
                                                .then((value) => Timer.periodic(
                                                        Duration(seconds: 12),
                                                        (timer) {
                                                      webservices_consumer
                                                          .Update_Vendor_Location(
                                                        id: value[0].id,
                                                        context: context,
                                                      );
                                                    })));
                                        ;
                                      }
                                    },
                                     color: Color(0xFF67b9fb),
                                   
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff67b9fb), Color(0xff8acbff)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),)
        : CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    )
                  ]))));
}
