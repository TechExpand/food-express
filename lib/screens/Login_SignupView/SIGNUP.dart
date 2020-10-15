import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/screens/Login_SignupView/login.dart';
import 'dart:ui' as ui;
import 'package:foodtruck/main.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:provider/provider.dart';

class SIGNUP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SIGNUPSTATE();
  }
}

class SIGNUPSTATE extends State<SIGNUP> {
  var username;
  var email;
  var password;
  var re_password;
  final form_key = GlobalKey<FormState>();
  final form_key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
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
                          child: Text('Register as User'),
                        ),
                        Tab(
                          icon: Icon(Icons.directions_car),
                          child: Text('Register as Vendor'),
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
            'SIGN UP',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15,
              color:Colors.black,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        body: TabBarView(
          children: <Widget>[
            UserSignUp(
                email, username, password, re_password, context, form_key),
            VendorSignUp(
                email, username, password, re_password, context, form_key1)
          ],
        ),
      ),
    );
  }
}

Widget UserSignUp(email, username, password, re_password, context, form_key) {
  return Form(
    key: form_key,
    child: SingleChildScrollView(
      child: Flexible(
        flex: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                      return 'Email Required';
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
                      return 'Username Required';
                    } else {
                      username = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Username',
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
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password Required';
                    } else if (value.length < 8) {
                      return 'It must contain at least 8 characters.';
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
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, bottom: 10),
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Confirm password';
                    } else {
                      re_password = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Confirm password',
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
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Container(
                    decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.black54,
                   ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Already Have an Account? Login"),
                    )),
                    ),
                ),
            Consumer<WebServices>(
              builder: (context, webservice_consumer, child) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: webservice_consumer.login_state == false
                    ? RaisedButton(
                        onPressed: () {
                          if (form_key.currentState.validate()) {
                            webservice_consumer.Login_SetState();
                            webservice_consumer.Signup_UserApi(
                              username: username,
                              password: password,
                              email: email,
                              re_password: re_password,
                              context: context,
                            ).then((value) => webservice_consumer
                                .login_before_submit_location_user(
                                  password: password,
                                  email: email,
                                  context: context,
                                )
                                .then((value) => webservice_consumer
                                    .send_user_location(context))
                                .then((value) => webservice_consumer
                                    .get_current_user_location()
                                    .then((value) => Timer.periodic(
                                            Duration(minutes: 12), (timer) {
                                          webservice_consumer
                                              .Update_User_Location(
                                            id: value[0].id,
                                            context: context,
                                          );
                                        }))));
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
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
                      )
                    : CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget VendorSignUp(email, username, password, re_password, context, form_key) {
  return Form(
    key: form_key,
    child: SingleChildScrollView(
      child: Flexible(
        flex: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                      return 'Email Required';
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
                      return 'Username Required';
                    } else {
                      username = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Username',
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
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password Required';
                    } else if (value.length < 8) {
                      return 'It must contain at least 8 characters.';
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
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8, bottom: 10),
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Confirm typed password';
                    } else {
                      re_password = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Confirm password',
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
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                   border: Border.all(
                    color: Colors.black54,
                   ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Already Have an Account? Login"),
                    )),
                )),
            Consumer<WebServices>(
              builder: (context, webservice_consumer, child) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: webservice_consumer.login_state == false
                    ? RaisedButton(
                        onPressed: () {
                          if (form_key.currentState.validate()) {
                            webservice_consumer.Login_SetState();
                            webservice_consumer.Signup_VendorApi(
                              username: username,
                              password: password,
                              email: email,
                              re_password: re_password,
                              context: context,
                            ).then((value) => webservice_consumer
                                .login_before_submit_location_vendor(
                                  password: password,
                                  email: email,
                                  context: context,
                                )
                                .then((value) => webservice_consumer
                                    .send_vendor_location(context)
                                    .then((value) => Timer.periodic(
                                            Duration(minutes: 12), (Timer t) {
                                          webservice_consumer
                                              .get_current_vendor_location()
                                              .then((value) =>
                                                  webservice_consumer
                                                      .Update_Vendor_Location(
                                                    id: value[0].id,
                                                    context: context,
                                                  ));
                                        }))));
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
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
                      )
                    : CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
