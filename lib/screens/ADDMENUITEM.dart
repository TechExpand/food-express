import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import './PERMISSIONS1.dart';

class ADDMENUITEM extends StatelessWidget {
  ADDMENUITEM({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(86.0, 126.0),
            child:
                // Adobe XD layer: 'FE-LOGO' (shape)
                Container(
              width: 189.0,
              height: 86.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/logotruck.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 0.0),
            child:
                // Adobe XD layer: 'Navigation Bar' (component)
                Container(),
          ),
          Transform.translate(
            offset: Offset(-31.0, 122.0),
            child:
                // Adobe XD layer: 'itemNameInput' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(48.0, 152.0),
                  child: Container(
                    width: 327.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffbce0fd)),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(48.0, 134.0),
                  child: Text(
                    'Item Name',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff2699fb),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-31.0, 205.0),
            child:
                // Adobe XD layer: 'itemPriceInput' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(48.0, 152.0),
                  child: Container(
                    width: 327.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffbce0fd)),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(48.0, 134.0),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff2699fb),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-31.0, 288.0),
            child:
                // Adobe XD layer: 'itemDescInput' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(48.0, 152.0),
                  child: Container(
                    width: 327.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffbce0fd)),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(48.0, 134.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff2699fb),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(17.0, 574.0),
            child:
                // Adobe XD layer: 'continueButton' (group)
                Stack(
              children: <Widget>[
                Container(
                  width: 327.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: const Color(0xff2699fb),
                  ),
                ),
                Transform.translate(
                  offset: Offset(156.0, 16.0),
                  child: SvgPicture.string(
                    _shapeSVG_1cffab208bfd4a11978e1e4ce0c59c61,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(160.0, 510.0),
            child:
                // Adobe XD layer: 'addImagesButton' (group)
                Stack(
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                    color: const Color(0xff2699fb),
                  ),
                ),
                Transform.translate(
                  offset: Offset(12.0, 12.0),
                  child:
                      // Adobe XD layer: '+' (group)
                      SvgPicture.string(
                    _shapeSVG_0abeb468969f47dc8346b0b3e468dc40,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 522.0),
            child: Text(
              'Add Item Images',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2699fb),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _shapeSVG_1cffab208bfd4a11978e1e4ce0c59c61 =
    '<svg viewBox="156.0 16.0 16.0 16.0" ><g transform="translate(156.0, 16.0)"><path  d="M 8 0 L 6.545454978942871 1.454545497894287 L 12.05194854736328 6.961039066314697 L 0 6.961039066314697 L 0 9.038961410522461 L 12.05194854736328 9.038961410522461 L 6.545454978942871 14.54545497894287 L 8 16 L 16 8 L 8 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';
const String _shapeSVG_0abeb468969f47dc8346b0b3e468dc40 =
    '<svg viewBox="12.0 12.0 16.0 16.0" ><g transform="translate(12.0, 12.0)"><path transform="translate(4620.0, 0.0)" d="M -4613.00048828125 15.99948692321777 L -4613.00048828125 8.999783515930176 L -4620 8.999783515930176 L -4620 6.999702930450439 L -4613.00048828125 6.999702930450439 L -4613.00048828125 0 L -4611 0 L -4611 6.999702930450439 L -4604.00048828125 6.999702930450439 L -4604.00048828125 8.999783515930176 L -4611 8.999783515930176 L -4611 15.99948692321777 L -4613.00048828125 15.99948692321777 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';
