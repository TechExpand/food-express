//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//class Local_Widget{
//  circular(context) {
//    return showDialog(
//      context: context,
//      child: Dialog(
//        elevation: 0,
//        backgroundColor: Colors.transparent,
//        child: Container(
//          decoration: BoxDecoration(
//              borderRadius: BorderRadius.all(Radius.circular(10))),
//          height: 70,
//          child: Center(
//            child: CircularProgressIndicator(
//              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//
//
//  Widget listvendor() {
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Align(
//        alignment: Alignment.bottomLeft,
//        child: Container(
//          height: 100,
//          child: ListView.builder(
//            itemCount: 5,
//            scrollDirection: Axis.horizontal,
//            itemBuilder: (context, index) {
//              return FittedBox(
//                child: ClipRRect(
//                  borderRadius: BorderRadius.circular(6),
//                  child: Container(
//                    height: 120,
//                    width: 180,
//                    child: Card(
//                      child: Row(
//                        children: <Widget>[
//                          ClipRRect(
//                            child: Container(
//                              width: 60.0,
//                              height: 60.0,
//                              decoration: BoxDecoration(
//                                image: DecorationImage(
//                                  image: const AssetImage(
//                                      'assets/images/logotruck.png'),
//                                  fit: BoxFit.fill,
//                                ),
//                              ),
//                            ),
//                            borderRadius: BorderRadius.circular(4),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(10.0),
//                            child: Container(
//                              child: Column(
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(3.0),
//                                    child: Container(
//                                      child: Text(
//                                        'title',
//                                        style: TextStyle(
//                                            fontWeight: FontWeight.bold,
//                                            color: Colors.black54,
//                                            fontSize: 18),
//                                        softWrap: false,
//                                        maxLines: 1,
//                                        overflow: TextOverflow.fade,
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.all(3.0),
//                                    child: Container(
//                                      child: Text(
//                                        'subtitle',
//                                        style: TextStyle(
//                                            color: Colors.black54,
//                                            fontSize: 15),
//                                        softWrap: false,
//                                        maxLines: 1,
//                                        overflow: TextOverflow.fade,
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.all(3.0),
//                                    child: Container(
//                                      child: Text(
//                                        'adrress',
//                                        style: TextStyle(
//                                            color: Colors.black54,
//                                            fontSize: 15),
//                                        softWrap: false,
//                                        maxLines: 1,
//                                        overflow: TextOverflow.fade,
//                                      ),
//                                    ),
//                                  )
//                                ],
//                              ),
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              );
//            },
//          ),
//        ),
//      ),
//    );
//  }
//
//
//
//  Completer<GoogleMapController> _controller = Completer();
//  var marker = Set<Marker>();
//
//  Widget bodywidget() {
//    return GoogleMap(
//      mapType: MapType.hybrid,
//      initialCameraPosition: CameraPosition(
//        target: location == null
//            ? LatLng(20, 20)
//            : LatLng(location.latitude, location.longitude),
//      ),
//      onMapCreated: (GoogleMapController controller) {
//        _controller.complete(controller);
//      },
//      markers: marker,
//    );
//  }
//}