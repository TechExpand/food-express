import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/VENDORSIGNUP.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/loginuser.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/loginvendor.dart';
import 'package:foodtruckexpressxd/screens/UserView/Userprofile.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VENDORprofile.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'Model/currentuserlocation.dart';

//VENDORSIGNUP11
void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(VENDORSIGNUP11());
}

class VENDORSIGNUP11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: VENDORSIGNUP1(),
    );
  }
}
