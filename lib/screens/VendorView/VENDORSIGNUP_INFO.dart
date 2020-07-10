//import 'package:flutter/material.dart';
//import 'dart:ui' as ui;
//import 'package:adobe_xd/specific_rect_clip.dart';
//import 'package:foodtruckexpressxd/screens/UserView/Map_user.dart';
//
//
//class VENDORSIGNUP22 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      home: VENDORSIGNUP2(),
//    );
//  }
//}
//
//class VENDORSIGNUP2 extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return VENDORSIGNUP2STATE();
//  }
//}
//
//class VENDORSIGNUP2STATE extends State<VENDORSIGNUP2> {
//  final VoidCallback continueButton;
//
//  VENDORSIGNUP2STATE({
//    Key key,
//    this.continueButton,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text(
//          'FOODTRUCK.EXPRESS',
//          style: TextStyle(
//            fontFamily: 'Arial',
//            fontSize: 15,
//            color: const Color(0xffffffff),
//            fontWeight: FontWeight.bold,
//          ),
//        ),
//      ),
//      backgroundColor: const Color(0xffffffff),
//      body: SingleChildScrollView(
//        child: Flexible(
//          flex: 20,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Padding(
//                padding:  EdgeInsets.all( MediaQuery.of(context).size.height / 14),
//                child: Container(
//                  width: 150.0,
//                  height: 86.0,
//                  decoration: BoxDecoration(
//                    image: DecorationImage(
//                      image: const AssetImage('assets/images/logotruck.png'),
//                      fit: BoxFit.fill,
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(
//                    right: MediaQuery.of(context).size.width / 8, bottom: 10),
//                child: SizedBox(
//                  width: 300,
//                  child: TextFormField(
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'Username Required';
//                      } else {
////                    username = value;
//                        return null;
//                      }
//                    },
//                    decoration: InputDecoration(
//                        focusedBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(0)),
//                        labelText: 'Business Name',
//                        labelStyle: TextStyle(
//                          color: Colors.black54,
//                        ),
//                        icon: Icon(
//                          Icons.person,
//                          color: Colors.white,
//                        ),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(0))),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(
//                    right: MediaQuery.of(context).size.width / 8, bottom: 10),
//                child: SizedBox(
//                  width: 300,
//                  child: TextFormField(
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'Username Required';
//                      } else {
////                    username = value;
//                        return null;
//                      }
//                    },
//                    decoration: InputDecoration(
//                        focusedBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(0)),
//                        labelText: 'Describe what makes your truck unique',
//                        labelStyle: TextStyle(
//                          color: Colors.black54,
//                        ),
//                        icon: Icon(
//                          Icons.person,
//                          color: Colors.white,
//                        ),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(0))),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(
//                    right: MediaQuery.of(context).size.width / 8, bottom: 10),
//                child: SizedBox(
//                  width: 300,
//                  child: TextFormField(
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'Username Required';
//                      } else {
////                    username = value;
//                        return null;
//                      }
//                    },
//                    decoration: InputDecoration(
//                        focusedBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(0)),
//                        labelText: 'Details',
//                        labelStyle: TextStyle(
//                          color: Colors.black54,
//                        ),
//                        icon: Icon(
//                          Icons.person,
//                          color: Colors.white,
//                        ),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(0))),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: RaisedButton(
//                  onPressed: () {
//                    Navigator.push(context, MaterialPageRoute(builder:(context){
//                      return Map_user();
//                    }));
//                  },
//                  color: Colors.blue,
//                  child: Text(
//                    'Continue',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}