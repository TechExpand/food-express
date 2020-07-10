//import 'package:flutter/material.dart';
//import 'dart:ui' as ui;
//import 'package:flutter_svg/flutter_svg.dart';
//import './ADDMENUITEM.dart';
//
//class vendoreditmenuempty extends StatelessWidget {
//  final String vendorDesc;
//  final String vendorName;
//  final VoidCallback addMenuItem;
//  vendoreditmenuempty({
//    Key key,
//    this.vendorDesc =
//        'Ut labore et dolore roipi mana aliqua. Enim adeop minim veeniam nostruklad',
//    this.vendorName = 'Vendor Name',
//    this.addMenuItem,
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
//                // Adobe XD layer: 'Image-1-Marriott-On…' (shape)
//                Container(
//                  width: 360.0,
//                  height: 191.0,
//                  decoration: BoxDecoration(
//                    image: DecorationImage(
//                      image:
//                          const AssetImage('assets/images/vendorMainImage.jpg'),
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                ),
//                Transform.translate(
//                  offset: Offset(50.0, 96.41),
//                  child:
//                      // Adobe XD layer: 'Title' (group)
//                      Stack(
//                    children: <Widget>[
//                      Transform.translate(
//                        offset: Offset(14.0, 45.59),
//                        child: SizedBox(
//                          width: 260.0,
//                          height: 43.0,
//                          child: SingleChildScrollView(
//                              child: Text(
//                            vendorDesc,
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
//                        child: SizedBox(
//                          width: 260.0,
//                          height: 45.0,
//                          child: SingleChildScrollView(
//                              child: Text(
//                            vendorName,
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
//            offset: Offset(163.0, 336.0),
//            child:
//                // Adobe XD layer: 'Add' (group)
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
//                    _shapeSVG_7698f24e2e21400e9ce9cf30f178b7c1,
//                    allowDrawingOutsideViewBox: true,
//                  ),
//                ),
//                Transform.translate(
//                  offset: Offset(0, 0),
//                  child: Align(
//                    alignment: Alignment.topLeft,
//                    child: Container(
//                      width: 40.0,
//                      height: 40.0,
//                      child: GestureDetector(onTap: () => addMenuItem?.call()),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Transform.translate(
//            offset: Offset(134.0, 311.0),
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
//        ],
//      ),
//    );
//  }
//}
//
//const String _shapeSVG_7698f24e2e21400e9ce9cf30f178b7c1 =
//    '<svg viewBox="12.0 12.0 16.0 16.0" ><g transform="translate(12.0, 12.0)"><path transform="translate(4620.0, 0.0)" d="M -4613.00048828125 15.99948692321777 L -4613.00048828125 8.999783515930176 L -4620 8.999783515930176 L -4620 6.999702930450439 L -4613.00048828125 6.999702930450439 L -4613.00048828125 0 L -4611 0 L -4611 6.999702930450439 L -4604.00048828125 6.999702930450439 L -4604.00048828125 8.999783515930176 L -4611 8.999783515930176 L -4611 15.99948692321777 L -4613.00048828125 15.99948692321777 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';
