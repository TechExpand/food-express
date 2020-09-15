//import 'package:flutter/material.dart';
//import 'package:foodtruckexpressxd/Services/Network.dart';
//import 'package:foodtruckexpressxd/screens/VendorView/VendorProfileedit.dart';
//import 'dart:ui' as ui;
//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert';
//import 'package:foodtruckexpressxd/Model/vendorprofile.dart';
//import 'package:foodtruckexpressxd/screens/VendorView/VendorMenuPage.dart';
//import 'package:provider/provider.dart';
//
//
//
//class USERprofile extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return USERprofilestate();
//  }
//}
//
//class USERprofilestate extends State<USERprofile> {
//  @override
//  Widget build(BuildContext context) {
//    var webservices = Provider.of<WebServices>(context, listen: false);
//    return Scaffold(
//      backgroundColor: const Color(0xffffffff),
//      body: FutureBuilder(
//        initialData: Center(child: CircularProgressIndicator()),
//        future: webservices.User_Profile_Api(),
//        builder: (context, snapshot){
//          if(snapshot.hasData){
//            print(snapshot.data[0].id);
//            return SingleChildScrollView(
//                child: Column(
//                  children: <Widget>[
//                    Stack(
////                  alignment: Alignment.center,
//                      children: <Widget>[
//                        // Adobe XD layer: 'background' (shape)
//                        Container(
//                          height: 191.0,
//                          decoration: BoxDecoration(
//                            color: Color(0xff2699fb),
//                          ),
//                        ),
//                        InkWell(
//                            onTap: () {
//                              Navigator.pop(context);
//                            },
//                            child: Padding(
//                                padding: EdgeInsets.only(
//                                    top: MediaQuery.of(context).size.width / 8,
//                                    left: MediaQuery.of(context).size.width / 20),
//                                child: Icon(
//                                  Icons.arrow_back,
//                                  color: Colors.white,
//                                ))),
//                        Align(
//                          alignment: Alignment.center,
//                          child: SizedBox(
//                              child: Padding(
//                                padding:
//                                EdgeInsets.only(top: 90.0, left: 8, right: 8),
//                                child: Text(
//                                  snapshot.data[0].last_name,
//                                  style: TextStyle(
//                                    fontFamily: 'Arial',
//                                    fontSize: 14,
//                                    color: const Color(0xffffffff),
//                                    height: 1.7142857142857142,
//                                  ),
//                                  textAlign: TextAlign.center,
//                                ),
//                              )),
//                        ),
//                        Align(
//                          alignment: Alignment.bottomCenter,
//                          child: Padding(
//                            padding: const EdgeInsets.only(top: 60.0),
//                            child: SizedBox(
//                              height: 45.0,
//                              child: Text(
//                               snapshot.data[0].first_name,
//                                style: TextStyle(
//                                   fontFamily: 'Arial',
//                                  fontSize: 30,
//                                  color: const Color(0xffffffff),
//                                  height: 1,
//                                ),
//                                textAlign: TextAlign.center,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(15.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Column(
//                            children: <Widget>[
//                              CircleAvatar(
//                                backgroundColor: Colors.white,
//                                backgroundImage:
//                                NetworkImage(snapshot.data[0].pro_pic),
//                                radius: 35,
//                                child: Text(''),
//                              ),
//                              RaisedButton(
//                                color: Color(0xff2699fb),
//                                child: Text(
//                                  'Change Picture',
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                                onPressed: () {
//                                  return null;
//                                },
//                              )
//                            ],
//                          ),
//                          Container(
//                            child: VerticalDivider(),
//                            height: 50,
//                          ),
//                        ],
//                      ),
//                    ),
//
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Card(
//                        elevation: 2,
//                        child: ListTile(
//                          trailing: Icon(Icons.description),
//                          title: Text(
//                            'Edit Your Profile Details',
//                            style: TextStyle(color: Colors.black54),
//                          ),
//                          onTap: () {
//                            return Navigator.push(
//                              context,
//                              PageRouteBuilder(
//                                pageBuilder: (context, animation, secondaryAnimation) {
//                                  return VENDORprofileEdith(
//                                    snapshot_profile_data: snapshot.data[0],
//                                  );
//                                },
//                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                                  return FadeTransition(
//                                    opacity: animation,
//                                    child: child,
//                                  );
//                                },
//                              ),
//                            );
//                          },
//                        ),
//                      ),
//                    ),
//                  ],
//                ));
//          }else if(snapshot.hasError){
//            print('error');
//            return Text('${snapshot.error}');
//          }
//          return Center(child: CircularProgressIndicator());
//        },
//      ),
//
//
//    );
//  }
//}
