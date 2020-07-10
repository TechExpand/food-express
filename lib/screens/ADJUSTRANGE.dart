import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import './LOADING.dart';

class ADJUSTRANGE extends StatelessWidget {
  ADJUSTRANGE({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 41.0),
            child: Stack(
              children: <Widget>[
                // Adobe XD layer: 'Map' (component)
                Container(),
                // Adobe XD layer: 'Navigation Bar' (component)
                Container(),
                Transform.translate(
                  offset: Offset(-699.0, 1299.0),
                  child: Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(881.0, -1209.0),
                        child: Container(
                          width: 16.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8.0, 8.0)),
                            color: const Color(0x4dff5353),
                            border: Border.all(
                                width: 2.0, color: const Color(0x4dffffff)),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(885.0, -1205.0),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(4.0, 4.0)),
                            color: const Color(0x4dff5353),
                            border: Border.all(
                                width: 2.0, color: const Color(0x4dffffff)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(95.0, 190.0),
            child: Text(
              'Nearby ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2699fb),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(-21.0, -602.0),
            child:
                // Adobe XD layer: 'Tools' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(40.0, 611.0),
                  child: Container(),
                ),
                Transform.translate(
                  offset: Offset(180.0, 611.0),
                  child: Container(),
                ),
                Transform.translate(
                  offset: Offset(319.0, 613.0),
                  child: Container(),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, -2.0),
            child:
                // Adobe XD layer: 'Pop over' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(32.0, 200.0),
                  child: Container(
                    width: 311.0,
                    height: 268.0,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x1a2699fb),
                            offset: Offset(0, 30),
                            blurRadius: 30)
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(74.0, 275.0),
                  child: SizedBox(
                    width: 212.0,
                    child: Text(
                      'Adjust search range',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: const Color(0xff2699fb),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-77.0, -122.0),
                  child:
                      // Adobe XD layer: 'button' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(220.0, 522.0),
                        child: Container(
                          width: 88.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: const Color(0xff2699fb),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(245.0, 537.0),
                        child: SizedBox(
                          width: 38.0,
                          child: Text(
                            'FINISH',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(4.0, -572.0),
                  child:
                      // Adobe XD layer: 'Progress 3' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(48.0, 909.0),
                        child: Container(
                          width: 271.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xfff1f9ff),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(48.0, 909.0),
                        child: Container(
                          width: 122.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                            color: const Color(0xff2699fb),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(142.0, 906.0),
                        child: Container(
                          width: 16.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8.0, 8.0)),
                            color: const Color(0xff2699fb),
                            border: Border.all(
                                width: 2.0, color: const Color(0xffffffff)),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(243.0, 912.0),
                        child: Container(
                          width: 4.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(2.0, 2.0)),
                            color: const Color(0xffbce0fd),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(51.0, 363.0),
                      child: SizedBox(
                        width: 10.0,
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff2699fb),
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(99.0, 363.0),
                      child: SizedBox(
                        width: 10.0,
                        child: Text(
                          '5',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff2699fb),
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(147.0, 363.0),
                      child: SizedBox(
                        width: 16.0,
                        child: Text(
                          '10',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff2699fb),
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(202.0, 363.0),
                      child: SizedBox(
                        width: 16.0,
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff2699fb),
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(256.0, 363.0),
                      child: SizedBox(
                        width: 16.0,
                        child: Text(
                          '20',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff2699fb),
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(310.0, 363.0),
                      child: SizedBox(
                        width: 16.0,
                        child: Text(
                          '30',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff2699fb),
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(165.0, 377.0),
                  child: SizedBox(
                    width: 44.0,
                    child: Text(
                      '(MILES)',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color: const Color(0xff2699fb),
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
