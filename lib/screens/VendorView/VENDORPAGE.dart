import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:foodtruckexpressxd/screens/VendorView/menuitemdetail.dart';
import 'package:provider/provider.dart';

class VENDORPAGE extends StatefulWidget {
  int id;
  double lan;
  double log;

  VENDORPAGE({
    this.id,
    this.lan,
    this.log,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VENDORPAGESTATE();
  }
}

class VENDORPAGESTATE extends State<VENDORPAGE> {
  var profile;
  var menu;

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    var webservices = Provider.of<WebServices>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: FutureBuilder(
          future: webservices.location_profile(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                  itemCount: snapshot.data.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue,
                              child: GoogleMap(
                                mapType: MapType.hybrid,
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(widget.lan, widget.log),
                                    zoom: 15),
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                                markers: {
                                  Marker(
                                      markerId: MarkerId('1'),
                                      position: LatLng(widget.lan, widget.log))
                                },
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.width /
                                            7,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                13),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )))
                          ],
                        ),
                        Container(
                          height: 88.0,
                          child: Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 65.0,
                                height: 62.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(snapshot
                                        .data[index].pro_pic
                                        .toString()),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff707070)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${snapshot.data[index].business_name.toString()}",
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      color: const Color(0xff2699fb),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'San Francisco, CA',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 10,
                                      color: const Color(0xff2699fb),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SvgPicture.string(
                                  _shapeSVG_a6ccafc648a842968ecdf970cc182d43,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ]),
                            )
                          ]),
                          decoration: BoxDecoration(
                            color: const Color(0xfff1f9ff),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${snapshot.data[index].detail.toString()}",
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14,
                                color: const Color(0xff2699fb),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'What make my Business Unique',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff2699fb),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${snapshot.data[index].unique_detail.toString()}",
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14,
                                color: const Color(0xff2699fb),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 60, left: 30, right: 30),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '24k',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 20,
                                        color: const Color(0xff2699fb),
                                        height: 1.2,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'FOLLOWERS',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 10,
                                        color: const Color(0xff2699fb),
                                        fontWeight: FontWeight.w700,
                                        height: 2.4,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '980',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 20,
                                        color: const Color(0xff2699fb),
                                        height: 1.2,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'FOLLOWING',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 10,
                                        color: const Color(0xff2699fb),
                                        fontWeight: FontWeight.w700,
                                        height: 2.4,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.brightness_auto,
                                        color: Colors.lightBlue,
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        ),
                        Divider(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'OUR MENU',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16,
                                color: const Color(0xff2699fb),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        FutureBuilder(
                            future: webservices.location_menu(widget.id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return menuitemdetail(
                                                menu_description: snapshot
                                                    .data[index]
                                                    .menu_description,
                                                menu_picture1: snapshot
                                                    .data[index].menu_picture1,
                                                menu_price: snapshot
                                                    .data[index].menu_price,
                                                menu_title: snapshot
                                                    .data[index].menu_title,
                                              );
                                            },
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Container(
                                          width: 60.0,
                                          height: 55.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data[index].menu_picture1
                                                  .toString()),
                                              fit: BoxFit.fitHeight,
                                            ),
                                            border: Border.all(
                                                width: 1.0,
                                                color: const Color(0xff707070)),
                                          ),
                                        ),
                                        title: Text(
                                          '${snapshot.data[index].menu_title}',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14,
                                            color: const Color(0xff2699fb),
                                            height: 1.3571428571428572,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        subtitle: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  '${snapshot.data[index].menu_description}',
                                                  style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff2699fb),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  '${snapshot.data[index].menu_price}\$',
                                                  style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 17,
                                                    color:
                                                        const Color(0xff2699fb),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
                      ],
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

const String _shapeSVG_a6ccafc648a842968ecdf970cc182d43 =
    '<svg viewBox="109.0 127.0 76.0 11.4" ><g transform="translate(-123.0, -339.0)"><path transform="translate(232.0, 466.0)" d="M 6 0 L 7.875 3.75 L 12 4.350000381469727 L 9 7.274999618530273 L 9.674999237060547 11.39999961853027 L 6 9.450000762939453 L 2.324999809265137 11.39999961853027 L 3 7.274999618530273 L 0 4.350000381469727 L 4.125 3.75 L 6 0 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(248.0, 466.0)" d="M 6 0 L 7.875 3.75 L 12 4.350000381469727 L 9 7.274999618530273 L 9.674999237060547 11.39999961853027 L 6 9.450000762939453 L 2.324999809265137 11.39999961853027 L 3 7.274999618530273 L 0 4.350000381469727 L 4.125 3.75 L 6 0 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(264.0, 466.0)" d="M 6 0 L 7.875 3.75 L 12 4.350000381469727 L 9 7.274999618530273 L 9.674999237060547 11.39999961853027 L 6 9.450000762939453 L 2.324999809265137 11.39999961853027 L 3 7.274999618530273 L 0 4.350000381469727 L 4.125 3.75 L 6 0 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(280.0, 466.0)" d="M 6 0 L 7.875 3.75 L 12 4.350000381469727 L 9 7.274999618530273 L 9.674999237060547 11.39999961853027 L 6 9.450000762939453 L 2.324999809265137 11.39999961853027 L 3 7.274999618530273 L 0 4.350000381469727 L 4.125 3.75 L 6 0 Z" fill="#2699fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(296.0, 466.0)" d="M 6 0 L 7.875 3.75 L 12 4.350000381469727 L 9 7.274999618530273 L 9.674999237060547 11.39999961853027 L 6 9.450000762939453 L 2.324999809265137 11.39999961853027 L 3 7.274999618530273 L 0 4.350000381469727 L 4.125 3.75 L 6 0 Z" fill="#7f7f7f" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';
