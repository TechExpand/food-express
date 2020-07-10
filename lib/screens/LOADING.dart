import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import './HOME.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LOADING extends StatelessWidget {
  LOADING({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'Shadow' (shape)
          Container(
            width: 360.0,
            height: 640.0,
            decoration: BoxDecoration(
              color: const Color(0xcc2699fb),
            ),
          ),
          Transform.translate(
            offset: Offset(143.02, 283.0),
            child:
                // Adobe XD layer: 'Loader' (group)
                SvgPicture.string(
              _shapeSVG_a25c8961fef34a96b222b21773d0366d,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(143.02, 283.0),
            child:
                // Adobe XD layer: 'Loader' (group)
                Stack(
              children: <Widget>[],
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 206.67),
            child: SizedBox(
              width: 280.0,
              child: Text(
                'LOCATING NEARBY VENDORS',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16,
                  color: const Color(0xfffcfcfc),
                  height: 1.375,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _shapeSVG_a25c8961fef34a96b222b21773d0366d =
    '<svg viewBox="143.0 283.0 73.5 73.5" ><g transform="translate(143.02, 283.0)"><g transform=""><path  d="M 36.7734375 73.546875 C 16.50718879699707 73.546875 0 57.03969573974609 0 36.7734375 C 0 16.5071849822998 16.50718879699707 0 36.7734375 0 C 57.03969573974609 0 73.546875 16.50718879699707 73.546875 36.7734375 C 73.546875 57.03969573974609 57.03969573974609 73.546875 36.7734375 73.546875 Z M 36.7734375 8.171875 C 21.00171852111816 8.171875 8.171875 21.00171852111816 8.171875 36.7734375 C 8.171875 52.54515838623047 21.00171852111816 65.375 36.7734375 65.375 C 52.54515838623047 65.375 65.375 52.54515838623047 65.375 36.7734375 C 65.375 21.00171661376953 52.54515838623047 8.171875 36.7734375 8.171875 Z" fill="#ffffff" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g><g transform=""><path  d="M 36.7734375 73.546875 C 16.50718879699707 73.546875 0 57.03969573974609 0 36.7734375 C 0 34.48531341552734 1.797812342643738 32.6875 4.0859375 32.6875 C 6.374062061309814 32.6875 8.171875 34.48531341552734 8.171875 36.7734375 C 8.171875 52.54515838623047 21.00171852111816 65.375 36.7734375 65.375 C 52.54515838623047 65.375 65.375 52.54515838623047 65.375 36.7734375 C 65.375 21.00171661376953 52.54515838623047 8.171875 36.7734375 8.171875 C 34.48531341552734 8.171875 32.6875 6.374062061309814 32.6875 4.0859375 C 32.6875 1.797812342643738 34.48531341552734 0 36.7734375 0 C 57.03969573974609 0 73.546875 16.50718879699707 73.546875 36.7734375 C 73.546875 57.03969573974609 57.03969573974609 73.546875 36.7734375 73.546875 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></g></svg>';
