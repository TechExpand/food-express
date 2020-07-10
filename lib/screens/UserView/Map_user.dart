//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'dart:async';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:geolocator/geolocator.dart';
//import 'package:foodtruckexpressxd/screens/VendorView/VENDORPAGE.dart';
//
//import 'package:foodtruckexpressxd/screens/VendorView/VENDORprofile.dart';
//
//class Map_user extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MapUserSample();
//  }
//}
//
//class MapUserSample extends StatefulWidget {
//  @override
//  State<MapUserSample> createState() => MapUserSampleState();
//}
//
//class MapUserSampleState extends State<MapUserSample> {
//  @override
//  void initState() {
//    super.initState();
//    get_location();
//    getCurrentLocation();
//    callmarker();
//  }
//
//  callmarker() {
//    Future.delayed(Duration(seconds: 5), updatemarker);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      drawer: SafeArea(
//        child: SizedBox(
//          width: 250,
//          child: Drawer(
//            child: Column(
//              children: <Widget>[
//                DrawerHeader(
//                  child: Padding(
//                    padding: EdgeInsets.all(8),
//                    child: Container(
//                      decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image:
//                              const AssetImage('assets/images/logotruck.png'),
//                          fit: BoxFit.fill,
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                ListTile(
//                  onTap: () {
//                    Navigator.of(context)
//                        .push(MaterialPageRoute(builder: (context) {
//                      return VENDORprofile();
//                    }));
//                  },
//                  title: Text('Profile'),
//                  leading: Icon(Icons.person),
//                ),
//                Divider(),
//                ListTile(
//                  title: Text('Profile'),
//                  leading: Icon(Icons.person_pin_circle),
//                )
//              ],
//            ),
//          ),
//        ),
//      ),
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text('Current Users'),
//      ),
//      body: Stack(
//        children: <Widget>[bodywidget(), listvendor()],
//      ),
//    );
//  }
//}
