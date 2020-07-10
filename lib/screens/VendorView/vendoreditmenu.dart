//import 'package:flutter/material.dart';
//import 'dart:ui' as ui;
//import 'package:flutter_svg/flutter_svg.dart';
//
//class vendoreditmenu extends StatelessWidget {
//  vendoreditmenu({
//    Key key,
//  }) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: const Color(0xffffffff),
//      body: Stack(
//        children: <Widget>[
//          Transform.translate(
//            offset: Offset(0.0, 42.0),
//            child:
//                // Adobe XD layer: 'Header' (group)
//                Stack(
//              children: <Widget>[
//                Container(
//                  width: 360.0,
//                  height: 191.0,
//                  decoration: BoxDecoration(
//                    color: const Color(0xff2699fb),
//                  ),
//                ),
//                Transform.translate(
//                  offset: Offset(50.0, 55.41),
//                  child:
//                      // Adobe XD layer: 'Title' (group)
//                      Stack(
//                    children: <Widget>[
//                      Transform.translate(
//                        offset: Offset(14.0, 45.59),
//                        child:
//                            // Adobe XD layer: 'vendorDesc' (text)
//                            SizedBox(
//                          width: 260.0,
//                          height: 43.0,
//                          child: SingleChildScrollView(
//                              child: Text(
//                            'Ut labore et dolore roipi mana aliqua. Enim adeop minim veeniam nostruklad',
//                            style: TextStyle(
//                              fontFamily: 'Arial',
//                              fontSize: 14,
//                              color: const Color(0xffffffff),
//                              height: 1.7142857142857142,
//                            ),
//                            textAlign: TextAlign.left,
//                          )),
//                        ),
//                      ),
//                      Transform.translate(
//                        offset: Offset(0.0, 6.26),
//                        child:
//                            // Adobe XD layer: 'vendorName' (text)
//                            SizedBox(
//                          width: 260.0,
//                          height: 45.0,
//                          child: SingleChildScrollView(
//                              child: Text(
//                            'Vendor Name',
//                            style: TextStyle(
//                              fontFamily: 'Georgia',
//                              fontSize: 40,
//                              color: const Color(0xffffffff),
//                              height: 1,
//                            ),
//                            textAlign: TextAlign.center,
//                          )),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Transform.translate(
//            offset: Offset(38.0, 264.0),
//            child: Text(
//              'Menu Items',
//              style: TextStyle(
//                fontFamily: 'Arial',
//                fontSize: 14,
//                color: const Color(0xff2699fb),
//              ),
//              textAlign: TextAlign.left,
//            ),
//          ),
//          // Adobe XD layer: 'menuListItem' (group)
//          Stack(
//            children: <Widget>[
//              Transform.translate(
//                offset: Offset(25.0, 311.0),
//                child:
//                    // Adobe XD layer: 'itemImage' (shape)
//                    Container(
//                  width: 112.0,
//                  height: 112.0,
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(10.0),
//                    color: const Color(0xffbce0fd),
//                  ),
//                ),
//              ),
//              Transform.translate(
//                offset: Offset(153.0, 305.0),
//                child:
//                    // Adobe XD layer: 'itemDesc' (text)
//                    SizedBox(
//                  width: 183.0,
//                  height: 71.0,
//                  child: SingleChildScrollView(
//                      child: Text(
//                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia.',
//                    style: TextStyle(
//                      fontFamily: 'Arial',
//                      fontSize: 14,
//                      color: const Color(0xff2699fb),
//                      height: 1.7142857142857142,
//                    ),
//                    textAlign: TextAlign.left,
//                  )),
//                ),
//              ),
//              Transform.translate(
//                offset: Offset(153.0, 407.0),
//                child:
//                    // Adobe XD layer: 'itemPrice' (text)
//                    Text(
//                  '21\$',
//                  style: TextStyle(
//                    fontFamily: 'Arial',
//                    fontSize: 14,
//                    color: const Color(0xff2699fb),
//                    fontWeight: FontWeight.w700,
//                  ),
//                  textAlign: TextAlign.left,
//                ),
//              ),
//              Transform.translate(
//                offset: Offset(307.0, 396.0),
//                child: Text(
//                  '…',
//                  style: TextStyle(
//                    fontFamily: 'Arial',
//                    fontSize: 20,
//                    color: const Color(0xff2699fb),
//                    fontWeight: FontWeight.w700,
//                  ),
//                  textAlign: TextAlign.left,
//                ),
//              ),
//            ],
//          ),
//          Transform.translate(
//            offset: Offset(160.0, 506.0),
//            child:
//                // Adobe XD layer: 'addMenuItemButton' (group)
//                Stack(
//              children: <Widget>[
//                Container(
//                  width: 40.0,
//                  height: 40.0,
//                  decoration: BoxDecoration(
//                    borderRadius:
//                        BorderRadius.all(Radius.elliptical(20.0, 20.0)),
//                    color: const Color(0xff2699fb),
//                  ),
//                ),
//                Transform.translate(
//                  offset: Offset(12.0, 12.0),
//                  child:
//                      // Adobe XD layer: '+' (group)
//                      SvgPicture.string(
//                    _shapeSVG_b85ebc0781344ffc82794494ac23e443,
//                    allowDrawingOutsideViewBox: true,
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Transform.translate(
//            offset: Offset(131.0, 481.0),
//            child: Text(
//              'Add Menu Item ',
//              style: TextStyle(
//                fontFamily: 'Arial',
//                fontSize: 14,
//                color: const Color(0xff2699fb),
//              ),
//              textAlign: TextAlign.left,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//const String _shapeSVG_b85ebc0781344ffc82794494ac23e443 =
//    '<svg viewBox="12.0 12.0 16.0 16.0" ><g transform="translate(12.0, 12.0)"><path transform="translate(4620.0, 0.0)" d="M -4613.00048828125 15.99948692321777 L -4613.00048828125 8.999783515930176 L -4620 8.999783515930176 L -4620 6.999702930450439 L -4613.00048828125 6.999702930450439 L -4613.00048828125 0 L -4611 0 L -4611 6.999702930450439 L -4604.00048828125 6.999702930450439 L -4604.00048828125 8.999783515930176 L -4611 8.999783515930176 L -4611 15.99948692321777 L -4613.00048828125 15.99948692321777 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';
