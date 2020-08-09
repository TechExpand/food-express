import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Services/LocationService.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/Utils/provider_util.dart';
import 'package:foodtruckexpressxd/Utils/utils.dart';
import 'package:foodtruckexpressxd/Widget/Local_Widget/Local_Widget.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/login.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


void main() {
  LocationService locationservice = LocationService();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocationService>(
        create: (context) => LocationService(),
      ),
      ChangeNotifierProvider<SetState>(
        create: (context) => SetState(),
      ),
      ChangeNotifierProvider<WebServices>(
        create: (context) => WebServices(),
      ),
      ChangeNotifierProvider<Utils>(
        create: (context) => Utils(),
      ),
    ],
    child: StartApp(),
  ));
  locationservice.onlocation();
}

class StartApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartAppState();
  }
}

class StartAppState extends State<StartApp> {
  @override
  void initState() {
    Provider.of<LocationService>(context, listen: false).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Login();
  }
}
