import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:foodtruck/main.dart';
import 'package:foodtruck/screens/Login_SignupView/SIGNUP.dart';

import 'Login_SignupView/login.dart';

class SPLASH extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SPLASHSTATE();
  }
}

class SPLASHSTATE extends State<SPLASH> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), go_to_home);
  }

  go_to_home() {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Login();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
               width: 150,
                        height: 100,
                        child: Image.asset('assets/images/logotruck.png')
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 49),
              child: Text(
                'get it at your comfort zone...',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.lightBlue),
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            )
          ],
        ),
      ),
    );
  }
}
