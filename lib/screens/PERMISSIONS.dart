//import 'package:flutter/material.dart';
//import 'dart:ui' as ui;
//import 'package:flutter_svg/flutter_svg.dart';
//import './LOADING.dart';
//import 'dart:convert';
//
//
//
//class PERMISSIONS extends StatelessWidget {
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        backgroundColor: const Color(0xffffffff),
//        body: Column(
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 14),
//              child: Container(
//                width: 150.0,
//                height: 86.0,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: const AssetImage('assets/images/logotruck.png'),
//                    fit: BoxFit.fill,
//                  ),
//                ),
//              ),
//            ),
//            Center(
//              child: Container(
//                width: 150.0,
//                height: 86.0,
//                child: RaisedButton(
//                  onPressed: (){
//                    onlocation();
//                  },
//                  child: Text('On Location Service'),
//                ),
//              ),
//            ),
//          ],
//        ));
//  }
//}