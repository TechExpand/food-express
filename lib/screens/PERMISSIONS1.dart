//import 'package:flutter/material.dart';
//import 'dart:ui' as ui;
//import 'package:flutter_svg/flutter_svg.dart';
//import './LOADING1.dart';
//
//class PERMISSIONS1 extends StatelessWidget {
//  PERMISSIONS1({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: const Color(0xffffffff),
//      body: Stack(
//        children: <Widget>[
//          Transform.translate(
//            offset: Offset(-7.0, -19.0),
//            child:
//                // Adobe XD layer: 'Pop over' (group)
//                Stack(
//              children: <Widget>[
//                Transform.translate(
//                  offset: Offset(32.0, 116.0),
//                  child: Container(
//                    width: 311.0,
//                    height: 435.0,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(6.0),
//                      color: const Color(0xfff1f9ff),
//                      boxShadow: [
//                        BoxShadow(
//                            color: const Color(0x1a000000),
//                            offset: Offset(0, 30),
//                            blurRadius: 30)
//                      ],
//                    ),
//                  ),
//                ),
//                // Adobe XD layer: 'hero' (group)
//                Stack(
//                  children: <Widget>[
//                    Transform.translate(
//                      offset: Offset(-14.0, 72.0),
//                      child: Container(
//                        width: 403.0,
//                        height: 403.0,
//                        decoration: BoxDecoration(
//                          borderRadius:
//                              BorderRadius.all(Radius.elliptical(201.5, 201.5)),
//                          color: const Color(0x33ffffff),
//                        ),
//                      ),
//                    ),
//                    Transform.translate(
//                      offset: Offset(66.0, 152.0),
//                      child: Container(
//                        width: 243.0,
//                        height: 243.0,
//                        decoration: BoxDecoration(
//                          borderRadius:
//                              BorderRadius.all(Radius.elliptical(121.5, 121.5)),
//                          color: const Color(0x33ffffff),
//                        ),
//                      ),
//                    ),
//                    Transform.translate(
//                      offset: Offset(86.0, 172.0),
//                      child: Container(
//                        width: 203.0,
//                        height: 203.0,
//                        decoration: BoxDecoration(
//                          borderRadius:
//                              BorderRadius.all(Radius.elliptical(101.5, 101.5)),
//                          color: const Color(0x80ffffff),
//                        ),
//                      ),
//                    ),
//                    Transform.translate(
//                      offset: Offset(136.0, 222.0),
//                      child: Container(
//                        width: 103.0,
//                        height: 103.0,
//                        decoration: BoxDecoration(
//                          borderRadius:
//                              BorderRadius.all(Radius.elliptical(51.5, 51.5)),
//                          color: const Color(0xffffffff),
//                        ),
//                      ),
//                    ),
//                    Transform.translate(
//                      offset: Offset(77.0, 172.0),
//                      child: SvgPicture.string(
//                        _shapeSVG_eedf1c01b0804e41b521b35faa05b155,
//                        allowDrawingOutsideViewBox: true,
//                      ),
//                    ),
//                  ],
//                ),
//                Transform.translate(
//                  offset: Offset(-7.0, -105.0),
//                  child:
//                      // Adobe XD layer: 'info' (group)
//                      Stack(
//                    children: <Widget>[
//                      Transform.translate(
//                        offset: Offset(125.0, 344.0),
//                        child: SizedBox(
//                          width: 126.0,
//                          child: Text(
//                            'VENDOR NAME',
//                            style: TextStyle(
//                              fontFamily: 'Arial',
//                              fontSize: 14,
//                              color: const Color(0xff2699fb),
//                              fontWeight: FontWeight.w700,
//                              height: 1.7142857142857142,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      ),
//                      Transform.translate(
//                        offset: Offset(64.0, 368.0),
//                        child: SizedBox(
//                          width: 247.0,
//                          height: 40.0,
//                          child: SingleChildScrollView(
//                              child: Text(
//                            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.',
//                            style: TextStyle(
//                              fontFamily: 'Arial',
//                              fontSize: 14,
//                              color: const Color(0xff2699fb),
//                              height: 1.7142857142857142,
//                            ),
//                            textAlign: TextAlign.center,
//                          )),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Transform.translate(
//                  offset: Offset(56.0, 341.67),
//                  child: SizedBox(
//                    width: 246.0,
//                    child: Text(
//                      'PERMISSION TO ACCESS GPS LOCATION?',
//                      style: TextStyle(
//                        fontFamily: 'Arial',
//                        fontSize: 10,
//                        color: const Color(0xff2699fb),
//                        height: 2.2,
//                      ),
//                      textAlign: TextAlign.center,
//                    ),
//                  ),
//                ),
//                Transform.translate(
//                  offset: Offset(68.0, 380.0),
//                  child:
//                      // Adobe XD layer: 'Continue' (component)
//                      Container(),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//const String _shapeSVG_eedf1c01b0804e41b521b35faa05b155 =
//    '<svg viewBox="77.0 172.0 161.7 58.3" ><path transform="translate(-798.66, -104.44)" d="M 1000.5048828125 284.2537536621094 C 999.81591796875 284.1079711914062 999.13037109375 283.8545837402344 998.4373779296875 283.8335266113281 C 990.769775390625 283.5994873046875 983.098876953125 283.2225646972656 975.43408203125 283.3187866210938 C 973.51123046875 283.3426818847656 971.0269775390625 284.4461975097656 969.849365234375 285.9010314941406 C 968.522705078125 287.5408935546875 967.31787109375 287.7709350585938 965.58056640625 287.6803894042969 C 946.282958984375 286.6759643554688 926.9842529296875 285.6886291503906 907.6861572265625 284.7012939453125 C 904.406982421875 284.5333251953125 901.1265869140625 284.3887023925781 897.819580078125 283.8409118652344 C 900.3414306640625 283.6581420898438 902.861572265625 283.4309387207031 905.3863525390625 283.3028259277344 C 910.3048095703125 283.0528564453125 915.2244873046875 282.7471008300781 920.1463623046875 282.6867370605469 C 922.6676025390625 282.6554260253906 923.202392578125 281.3036804199219 922.5606689453125 279.441162109375 C 921.7196044921875 277.0012817382812 922.53955078125 276.4341430664062 924.8416748046875 276.43701171875 C 955.25732421875 276.4728698730469 985.673095703125 276.4694519042969 1016.0888671875 276.4438171386719 C 1018.137573242188 276.442138671875 1018.206420898438 277.3383483886719 1018.751342773438 279.2207946777344 C 1020.861572265625 286.5097045898438 1023.07763671875 293.8937072753906 1026.4775390625 300.6246032714844 C 1027.917602539062 303.4761657714844 1032.345825195312 304.8620910644531 1035.489990234375 306.7929382324219 C 1036.928344726562 307.6760559082031 1037.589965820312 308.48291015625 1037.220458984375 310.3858337402344 C 1036.538208007812 313.9007568359375 1036.09130859375 317.4965515136719 1035.970581054688 321.0729370117188 C 1035.88232421875 323.677978515625 1036.474487304688 326.3057556152344 1036.783081054688 329.1009521484375 C 1035.48828125 329.2370300292969 1034.844848632812 329.4084167480469 1034.221923828125 329.35205078125 C 1032.205688476562 329.168701171875 1030.988891601562 329.9624633789062 1029.495971679688 331.4827270507812 C 1027.871948242188 333.1368713378906 1025.142333984375 334.6156005859375 1022.901733398438 334.6059265136719 C 1010.40625 334.5512390136719 997.9129638671875 334.0228576660156 985.406005859375 333.3253479003906 C 995.7127685546875 332.9711608886719 1006.020141601562 332.6170043945312 1016.292724609375 332.2645263671875 C 1015.6298828125 328.2229309082031 1013.345947265625 327.3739624023438 1009.564575195312 327.4303283691406 C 993.271240234375 327.6734619140625 976.9715576171875 327.5356750488281 960.674072265625 327.5368041992188 C 959.635498046875 327.5368041992188 958.596923828125 327.5368041992188 957.4359130859375 327.5368041992188 C 957.0914306640625 328.3499145507812 956.802734375 329.1180114746094 956.4490966796875 329.854248046875 C 954.1920166015625 334.552978515625 948.647216796875 336.0271606445312 944.1357421875 333.3999328613281 C 942.5244140625 332.4615478515625 940.5252685546875 331.7998962402344 938.6746826171875 331.7270202636719 C 929.399169921875 331.3626098632812 920.114501953125 331.2316589355469 910.8326416015625 331.0278015136719 C 909.5247802734375 330.9993286132812 908.2156982421875 331.0243835449219 906.9027099609375 330.5176086425781 C 918.0606689453125 330.2078552246094 929.2186279296875 329.8981018066406 940.377197265625 329.5889282226562 L 940.8253173828125 328.8583679199219 C 940.127197265625 328.4171142578125 939.42626953125 327.5908813476562 938.7310791015625 327.5960083007812 C 933.1571044921875 327.6341857910156 927.5850830078125 327.8420104980469 922.01171875 327.9706726074219 C 920.14404296875 328.0139465332031 918.2747802734375 327.9775085449219 916.4810791015625 327.9775085449219 C 917.427978515625 321.6019287109375 918.3316650390625 315.5173034667969 919.2899169921875 309.0653991699219 C 910.8343505859375 308.5068359375 902.7921142578125 307.9755554199219 894.75048828125 307.4443359375 L 894.76123046875 306.9039611816406 C 898.258544921875 306.6591186523438 901.75634765625 306.4256591796875 905.2525634765625 306.1671447753906 C 920.265380859375 305.057373046875 935.2833251953125 304.015380859375 950.2847900390625 302.7706604003906 C 953.8599853515625 302.4740295410156 956.619873046875 303.33837890625 959.299560546875 305.7617492675781 C 960.7789306640625 307.0998229980469 963.0946044921875 308.1742858886719 965.054443359375 308.2107543945312 C 975.4620361328125 308.4037780761719 985.525634765625 306.2759094238281 995.324462890625 302.8555297851562 C 996.080078125 302.59130859375 996.730224609375 302.0264587402344 997.4295654296875 301.6016845703125 L 997.5001220703125 300.6348571777344 C 995.8984375 300.2840881347656 994.303466796875 299.6771240234375 992.692626953125 299.6327209472656 C 988.3385009765625 299.5125732421875 983.97509765625 299.7334899902344 979.6192626953125 299.6395263671875 C 953.0093994140625 299.06787109375 926.3995361328125 298.4779663085938 899.7919921875 297.8231506347656 C 891.7491455078125 297.625 883.712646484375 297.2008056640625 875.6589965820312 296.3967895507812 L 920.9417724609375 294.3890686035156 L 920.95654296875 293.4626770019531 L 910.5531005859375 292.6495666503906 L 910.559326171875 292.1991577148438 C 911.2510986328125 292.1353759765625 911.94189453125 292.0437316894531 912.6353759765625 292.0123901367188 C 930.2384033203125 291.2146911621094 947.8426513671875 290.4454040527344 965.443359375 289.596435546875 C 967.1885986328125 289.5127258300781 968.3154296875 289.5679626464844 969.1798095703125 291.5119018554688 C 969.67578125 292.6279296875 971.514892578125 293.8447265625 972.734619140625 293.8299255371094 C 981.6241455078125 293.7217407226562 990.5096435546875 293.3140563964844 999.3956298828125 292.9820861816406 C 999.5050048828125 292.9781188964844 999.605224609375 292.7321166992188 1000.098876953125 292.103515625 L 978.76513671875 292.103515625 C 978.75146484375 291.6759033203125 978.73828125 291.2476806640625 978.7247314453125 290.8195190429688 L 999.8779296875 290.3036193847656 L 999.868896484375 289.3424682617188 L 978.95068359375 289.3424682617188 L 978.9222412109375 288.1114196777344 L 999.951416015625 288.1114196777344 C 999.9525146484375 287.6485290527344 999.9542236328125 287.1855773925781 999.9554443359375 286.72265625 L 979.469482421875 286.72265625 L 979.4580078125 285.4147644042969 L 1000.500366210938 285.4147644042969 L 1000.5048828125 284.2537536621094 Z M 1027.219482421875 323.3272094726562 C 1027.086181640625 323.266845703125 1026.959838867188 323.1917114257812 1026.839721679688 323.102294921875 L 1025.99462890625 323.1148376464844 C 1025.703125 322.4634094238281 1025.588134765625 321.4931640625 1025.088745117188 321.2164306640625 C 1023.100341796875 320.1146545410156 1020.12353515625 320.8816223144531 1018.729614257812 322.7931213378906 C 1017.176391601562 324.923828125 1017.132568359375 327.19970703125 1018.636840820312 329.3685607910156 C 1020.108154296875 331.489013671875 1022.83056640625 332.2001953125 1025.185546875 331.146240234375 C 1027.510986328125 330.1053771972656 1028.659545898438 328.24853515625 1028.341796875 325.7209777832031 C 1028.269409179688 325.1453247070312 1027.38232421875 324.6715698242188 1026.869873046875 324.1511535644531 C 1026.986572265625 323.8766784667969 1027.102783203125 323.6016845703125 1027.219482421875 323.3272094726562 Z M 1021.923461914062 297.4319763183594 C 1020.655395507812 293.501953125 1019.493774414062 289.6499633789062 1018.115844726562 285.8771057128906 C 1017.877807617188 285.2239990234375 1016.643920898438 284.451904296875 1016.013671875 284.5612182617188 C 1015.39697265625 284.6682739257812 1014.698852539062 285.7649230957031 1014.504150390625 286.5433044433594 C 1014.119262695312 288.0852355957031 1014.031005859375 289.7052001953125 1013.865234375 291.2972412109375 C 1013.109619140625 298.5485534667969 1013.554321289062 298.9585266113281 1020.991943359375 297.9159545898438 C 1021.164428710938 297.8914794921875 1021.321044921875 297.7502746582031 1021.923461914062 297.4319763183594 Z M 948.692138671875 331.3677368164062 C 951.9326171875 331.3409729003906 954.186279296875 329.0941162109375 954.12939453125 325.9476013183594 C 954.072998046875 322.8608703613281 951.81591796875 320.7142333984375 948.678466796875 320.7643432617188 C 945.641357421875 320.8132934570312 943.314208984375 323.1546936035156 943.3323974609375 326.1429138183594 C 943.3511962890625 329.2051391601562 945.5963134765625 331.3939208984375 948.692138671875 331.3677368164062 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
