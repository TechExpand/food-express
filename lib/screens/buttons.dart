import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/specific_rect_clip.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VENDORPAGE.dart';
import './HOMEmaxradius.dart';

class gButton extends StatelessWidget {
  const gButton({
    Key key,
    @required this.gbutton,
  }) : super(key: key);

  final  gbutton;

  @override
  Widget build(BuildContext context) {
  return Stack(
  children: <Widget>[
  Transform.translate(
  offset: Offset(-0.46, 0.0),
  child: Container(
  width: 56.0,
  height: 56.0,
  decoration: BoxDecoration(
  borderRadius:
  BorderRadius.all(Radius.elliptical(28.0, 28.0)),
  border: Border.all(
  width: 1.0, color: const Color(0xffbce0fd)),
  ),
  ),
  ),
  Transform.translate(
  offset: Offset(19.54, 20.0),
  child:
  // Adobe XD layer: 'g+' (group)
  Stack(
  children: <Widget>[
  Container(
  width: 16.0,
  height: 16.0,
  decoration: BoxDecoration(),
  ),
  Transform.translate(
  offset: Offset(0.0, 3.0),
  child: SvgPicture.string(
  _shapeSVG_257d2f44ae1b4bf2ac714de7e14a6346,
  allowDrawingOutsideViewBox: true,
  ),
  ),
  ],
  ),
  ),
  Transform.translate(
  offset: Offset(-0.45714569091796875, 0),
  child: Align(
  alignment: Alignment.topLeft,
  child: Container(
  width: 56.0,
  height: 56.0,
  child:
  GestureDetector(onTap: () => gbutton?.call()),
  ),
  ),
  ),
  ],
  );
  }
}

const String _shapeSVG_257d2f44ae1b4bf2ac714de7e14a6346 =
    '<svg viewBox="0.0 3.0 16.0 10.2" ><path transform="translate(0.0, 3.0)" d="M 16 4.400000095367432 L 16 5.900000095367432 L 14.5 5.900000095367432 L 14.5 7.400000095367432 L 13 7.400000095367432 L 13 5.800000190734863 L 11.5 5.800000190734863 L 11.5 4.400000095367432 L 13 4.400000095367432 L 13 2.900000095367432 L 14.5 2.900000095367432 L 14.5 4.400000095367432 L 16 4.400000095367432 Z M 5.099999904632568 4.400000095367432 L 9.899999618530273 4.400000095367432 C 9.899999618530273 4.700000286102295 10 4.900000095367432 10 5.200000286102295 C 10 8.100000381469727 8.100000381469727 10.20000076293945 5.099999904632568 10.20000076293945 C 2.299999952316284 10.19999980926514 0 7.900000095367432 0 5.099999904632568 C 0 2.299999952316284 2.299999952316284 0 5.099999904632568 0 C 6.5 0 7.599999904632568 0.5 8.5 1.299999952316284 L 7.099999904632568 2.700000047683716 C 6.699999809265137 2.299999952316284 6.099999904632568 1.900000095367432 5.099999904632568 1.900000095367432 C 3.399999856948853 1.900000095367432 1.899999856948853 3.300000190734863 1.899999856948853 5.100000381469727 C 1.899999856948853 6.90000057220459 3.299999713897705 8.300000190734863 5.099999904632568 8.300000190734863 C 7.099999904632568 8.300000190734863 7.899999618530273 6.900000095367432 8 6.100000381469727 L 5.099999904632568 6.100000381469727 L 5.099999904632568 4.400000095367432 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _shapeSVG_bbcb9bcac30c47a1888a41d52fc7a27c =
    '<svg viewBox="0.0 2.0 16.0 13.0" ><path transform="translate(-38.0, 0.0)" d="M 43.06666564941406 14.97777557373047 C 49.11111068725586 14.97777557373047 52.39999771118164 9.999998092651367 52.39999771118164 5.644444465637207 C 52.39999771118164 5.466666698455811 52.39999771118164 5.377777576446533 52.39999771118164 5.199999809265137 C 53.02222061157227 4.755555629730225 53.5555534362793 4.133333683013916 53.99999618530273 3.51111102104187 C 53.37777328491211 3.777777910232544 52.75555038452148 3.955555438995361 52.13333129882812 4.044444561004639 C 52.84444427490234 3.599999904632568 53.28888702392578 2.977777719497681 53.5555534362793 2.266666889190674 C 52.93333053588867 2.622222185134888 52.22222137451172 2.888888597488403 51.5111083984375 3.066666603088379 C 50.88888549804688 2.355555534362793 49.99999618530273 2 49.11111068725586 2 C 47.33333206176758 2 45.82221984863281 3.511110782623291 45.82221984863281 5.288888454437256 C 45.82221984863281 5.555554866790771 45.82221984863281 5.822221279144287 45.91110610961914 5.999999523162842 C 43.15555572509766 5.822221755981445 40.75555419921875 4.57777738571167 39.15555572509766 2.53333306312561 C 38.88888931274414 2.977777481079102 38.71110916137695 3.599999666213989 38.71110916137695 4.222221851348877 C 38.71110916137695 5.377777576446533 39.33333206176758 6.355555057525635 40.13333129882812 6.977777004241943 C 39.59999847412109 6.977777004241943 39.06666564941406 6.799999237060547 38.62221908569336 6.533332824707031 C 38.62221908569336 6.533332824707031 38.62221908569336 6.533332824707031 38.62221908569336 6.533332824707031 C 38.62221908569336 8.133332252502441 39.77777481079102 9.46666431427002 41.28888702392578 9.733331680297852 C 41.02222061157227 9.822220802307129 40.75555419921875 9.822220802307129 40.39999771118164 9.822220802307129 C 40.22221755981445 9.822220802307129 39.95555114746094 9.822220802307129 39.77777481079102 9.733331680297852 C 40.22221755981445 11.06666469573975 41.37777328491211 11.95555305480957 42.88888549804688 12.04444122314453 C 41.73332977294922 12.93333053588867 40.31110763549805 13.46666431427002 38.79999923706055 13.46666431427002 C 38.53333282470703 13.46666431427002 38.26666641235352 13.46666431427002 37.99999618530273 13.37777423858643 C 39.42222213745117 14.44444179534912 41.19999694824219 14.97777557373047 43.06666564941406 14.97777557373047" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _shapeSVG_03c18046281a44f3a7092bcedf3d7281 =
    '<svg viewBox="4.0 0.0 8.4 16.0" ><path transform="translate(-76.0, 0.0)" d="M 85.42222595214844 16 L 85.42222595214844 8.711111068725586 L 87.91111755371094 8.711111068725586 L 88.26667785644531 5.8666672706604 L 85.42222595214844 5.8666672706604 L 85.42222595214844 4.088889122009277 C 85.42222595214844 3.288889169692993 85.68890380859375 2.666667222976685 86.84445190429688 2.666667222976685 L 88.35556030273438 2.666667222976685 L 88.35556030273438 0.08888889104127884 C 88 0.08888889104127884 87.11111450195312 0 86.13333129882812 0 C 84 0 82.4888916015625 1.333333373069763 82.4888916015625 3.733333110809326 L 82.4888916015625 5.866666793823242 L 80 5.866666793823242 L 80 8.711111068725586 L 82.4888916015625 8.711111068725586 L 82.4888916015625 16 L 85.42222595214844 16 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

