//import 'package:flutter/material.dart';
//import 'dart:ui' as ui;
//import './VENDORSIGNUP.dart';
//
//class vendorPrompt extends StatelessWidget {
//  final VoidCallback vendormessage;
//  vendorPrompt({
//    Key key,
//    this.vendormessage,
//  }) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        Transform.translate(
//          offset: Offset(-10.0, 0.0),
//          child: SizedBox(
//            width: 126.0,
//            child: Text(
//              'LIST MY FOODTRUCK',
//              style: TextStyle(
//                fontFamily: 'Arial',
//                fontSize: 10,
//                color: const Color(0xff2699fb),
//                fontWeight: FontWeight.w700,
//                height: 1.2,
//              ),
//              textAlign: TextAlign.center,
//            ),
//          ),
//        ),
//        Align(
//          alignment: Alignment.topLeft,
//          child: Container(
//            width: 106.0,
//            height: 11.0,
//            child: GestureDetector(onTap: () => vendormessage?.call()),
//          ),
//        ),
//      ],
//    );
//  }
//}
