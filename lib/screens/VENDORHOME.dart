import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:foodtruckexpressxd/screens/UserView/Map_user.dart';
import './vendorLocation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './VENDOROFFLINE.dart';
import './logo.dart';

class VENDORHOME extends StatelessWidget {
  final String vendorStatus;
  final VoidCallback statusToggle;
  VENDORHOME({
    Key key,
    this.vendorStatus = 'ONLINE',
    this.statusToggle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
//          Transform.translate(
//            offset: Offset(0.0, 42.0),
//            child: Map(),
//          ),
          Transform.translate(
            offset: Offset(25.0, 293.0),
            child:
                // Adobe XD layer: 'info' (component)
                vendorLocation(
              currentTime: 'Current time: 9:56 AM',
              userCount: '10 users within 10 miles',
            ),
          ),
          Transform.translate(
            offset: Offset(298.0, 12.0),
            child:
                // Adobe XD layer: 'Tools' (group)
                SvgPicture.string(
              _shapeSVG_1f2a136ddcc940a08260d6a74d09fe9d,
              allowDrawingOutsideViewBox: true,
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
                  child: Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0.0, 0.0),
                        child: Container(
                          width: 16.0,
                          height: 16.0,
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(1.0, 0.0),
                        child: SvgPicture.string(
                          _shapeSVG_8143f24b90544734857852447626fa99,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(319.0, 613.0),
                  child: Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0.0, 0.0),
                        child: Container(
                          width: 16.0,
                          height: 16.0,
                          decoration: BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(17.0, 440.0),
            child: Container(
              width: 318.0,
              height: 56.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: const Color(0x2b71beff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(211.0, 462.0),
            child: Text(
              vendorStatus,
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff37d844),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(279.01, 456.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-0.01, 0.0),
                  child: Container(
                    width: 40.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xff37d844),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(15.99, 0.0),
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff37d844)),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-0.0078125, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 40.0,
                      height: 24.0,
                      child: GestureDetector(onTap: () => statusToggle?.call()),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(32.0, 462.0),
            child: Text(
              'STATUS',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2699fb),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(82.0, 531.0),
            child: logo(),
          ),
        ],
      ),
    );
  }
}

const String _shapeSVG_8143f24b90544734857852447626fa99 =
    '<svg viewBox="1.0 0.0 13.2 16.0" ><path transform="translate(0.98, 0.05)" d="M 6.579516887664795 9.470250129699707 C 8.174532890319824 9.470250129699707 9.370794296264648 8.174299240112305 9.370794296264648 6.678971767425537 C 9.370794296264648 5.183644771575928 8.174532890319824 3.78800630569458 6.579516887664795 3.78800630569458 C 4.984501361846924 3.78800630569458 3.7882399559021 5.083956241607666 3.7882399559021 6.579283237457275 C 3.7882399559021 8.074611663818359 5.084189891815186 9.470250129699707 6.579516887664795 9.470250129699707 Z M 1.894158840179443 1.893925189971924 C 4.486059188842773 -0.6979750394821167 8.672975540161133 -0.6979750394821167 11.2648754119873 1.893925189971924 C 13.85677623748779 4.485825538635254 13.85677623748779 8.672741889953613 11.2648754119873 11.26464176177979 L 6.579516887664795 15.95000076293945 L 1.894158959388733 11.2646427154541 C -0.598052978515625 8.672741889953613 -0.598052978515625 4.485825538635254 1.894158840179443 1.893925189971924 Z" fill="#37d844" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _shapeSVG_1f2a136ddcc940a08260d6a74d09fe9d =
    '<svg viewBox="298.0 12.0 16.0 14.0" ><g transform="translate(-21.0, -602.0)"><g transform="translate(319.0, 613.0)"><path transform="translate(6160.0, 1.0)" d="M -6160.00048828125 14.0001802444458 L -6160.00048828125 11.99971294403076 L -6149.99951171875 11.99971294403076 L -6149.99951171875 14.0001802444458 L -6160.00048828125 14.0001802444458 Z M -6160.00048828125 8.000324249267578 L -6160.00048828125 5.999856472015381 L -6144 5.999856472015381 L -6144 8.000324249267578 L -6160.00048828125 8.000324249267578 Z M -6160.00048828125 2.000467538833618 L -6160.00048828125 0 L -6144 0 L -6144 2.000467538833618 L -6160.00048828125 2.000467538833618 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></g></svg>';
