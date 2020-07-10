import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class vendorLocation extends StatelessWidget {
  final String currentTime;
  final String userCount;
  vendorLocation({
    Key key,
    this.currentTime = 'Current time: 9:56 AM',
    this.userCount = '10 users within 10 miles',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 311.0,
          height: 104.0,
          decoration: BoxDecoration(
            color: const Color(0xff2699fb),
          ),
        ),
        Transform.translate(
          offset: Offset(24.0, 14.0),
          child: Text(
            'Your Location',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
              height: 1.7142857142857142,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(24.0, 38.0),
          child: Text(
            currentTime,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14,
              color: const Color(0xffffffff),
              height: 1.7142857142857142,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(241.0, 31.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xffffffff),
                ),
              ),
              Transform.translate(
                offset: Offset(12.0, 12.0),
                child:
                    // Adobe XD layer: 'Wifi' (component)
                    Container(),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(24.0, 58.0),
          child: Text(
            userCount,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14,
              color: const Color(0xffffffff),
              height: 1.7142857142857142,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
