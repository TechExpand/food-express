import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtruckexpressxd/Services/LocationService.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/screens/UserView/Userprofile.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VENDORPAGE.dart';

import 'package:foodtruckexpressxd/screens/VendorView/VENDORprofile.dart';
import 'package:provider/provider.dart';

class Map_vendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Map_vendorSample();
  }
}

class Map_vendorSample extends StatefulWidget {
  @override
  State<Map_vendorSample> createState() => Map_vendorSampleState();
}

class Map_vendorSampleState extends State<Map_vendorSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: SizedBox(
          width: 250,
          child: Drawer(
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              const AssetImage('assets/images/logotruck.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return USERprofile();
                    }));
                  },
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                ),
                Divider(),
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person_pin_circle),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Current Vendors'),
      ),
      body: bodywidget(),
    );
  }
}

class bodywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bodywidgetstate();
  }
}

class bodywidgetstate extends State<bodywidget> {
  Completer<GoogleMapController> _controller = Completer();
  var marker = Set<Marker>();
  List<Widget> listitem = [];
  var zoom_value = 2.0;
  var index_value;
  var miles_value;

  @override
  Widget build(BuildContext context) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    var webservices = Provider.of<WebServices>(context, listen: false);
    // TODO: implement build
    return FutureBuilder(
        future: webservices.get_all_vendor_current_location(context),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var distance_list = Provider
                    .of<WebServices>(context, listen: false)
                    .distance_list;
//                for (var v in distance_list) {
//                  print(v);
//                  if (v >= 1000000) {
                    for (index_value in snapshots.data) {
                      marker.add(Marker(
                          markerId: MarkerId(index_value.user.toString()),
                          icon: BitmapDescriptor.defaultMarker,
                          position: LatLng(double.parse(index_value.Lan),
                              double.parse(index_value.Log))));
                    }
//                  }
//                }
                return Stack(
                children: <Widget>[
                  Container(
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: CameraPosition(
                        zoom: zoom_value,
                        target: LatLng(locationValues.location_latitude,
                            locationValues.location_longitude),
                      ),
                      onMapCreated: (GoogleMapController controller) async {
                        _controller.complete(controller);
                      },
                      markers: marker,
                    ),
                  ),
                  FutureBuilder(
                      future:
                          webservices.get_all_vendor_current_location(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 100,
                                child: PageView.builder(
                                  onPageChanged: (index) async {
                                    print(snapshot.data[index].Lan.toString());
                                    GoogleMapController controller =
                                        await _controller.future;
                                    return controller.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                bearing: 45,
                                                tilt: 50,
                                                zoom: 15,
                                                target: LatLng(
                                                  double.parse(
                                                      snapshot.data[index].Lan),
                                                  double.parse(
                                                      snapshot.data[index].Log),
                                                ))));
                                  },
                                  itemCount: snapshot.data.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return FittedBox(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Container(
                                          height: 120,
                                          child: Flexible(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) {
                                                      return VENDORPAGE(
                                                          id: snapshot
                                                              .data[index].id,
                                                          lan: double.parse(
                                                              snapshot
                                                                  .data[index]
                                                                  .Lan),
                                                          log: double.parse(
                                                              snapshot
                                                                  .data[index]
                                                                  .Log));
                                                    },
                                                    transitionsBuilder:
                                                        (context,
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
                                              child: Card(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0,
                                                                    right: 8,
                                                                    top: 8),
                                                            child: Text(
                                                              '${Provider.of<WebServices>(context, listen: false).distance_list[index].toString()}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize: 20),
                                                              softWrap: false,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: Text(
                                                              'meters away',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .blue,
                                                                  fontSize: 14),
                                                              softWrap: false,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0,
                                                                    right: 8),
                                                            child: ActionChip(
                                                              backgroundColor:
                                                                  Colors
                                                                      .lightBlue,
                                                              label: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            5.0,
                                                                        bottom:
                                                                            5),
                                                                child: Text(
                                                                  'Focus View',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                print(snapshot
                                                                    .data[index]
                                                                    .Lan
                                                                    .toString());
                                                                GoogleMapController
                                                                    controller =
                                                                    await _controller
                                                                        .future;
                                                                return controller.animateCamera(CameraUpdate.newCameraPosition(
                                                                    CameraPosition(
                                                                        bearing:
                                                                            45,
                                                                        tilt:
                                                                            50,
                                                                        zoom:
                                                                            15,
                                                                        target:
                                                                            LatLng(
                                                                          double.parse(snapshot
                                                                              .data[index]
                                                                              .Lan),
                                                                          double.parse(snapshot
                                                                              .data[index]
                                                                              .Log),
                                                                        ))));
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      color: Colors.black54,
                                                      height: 80,
                                                      width: 1,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        child: Column(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(3.0),
                                                              child: Container(
                                                                child: Text(
                                                                  "${Provider.of<WebServices>(context, listen: false).locality[index].toString()}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          18),
                                                                  softWrap:
                                                                      false,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .fade,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(3.0),
                                                              child: Container(
                                                                  width: 150,
                                                                  child: Text(
                                                                    '${Provider.of<WebServices>(context, listen: false).address_line[index].toString()}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            15),
                                                                    softWrap:
                                                                        true,
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                        return Center(child: Text('Loading...'));
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: PopupMenuButton(
                        itemBuilder: (context) => <PopupMenuEntry>[
                          PopupMenuItem(
                            value: 1,
                            child: Text('Below 10miles'),
                          ),
                          PopupMenuDivider(
                            height: 2,
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text('Below 100miles'),
                          ),
                          PopupMenuDivider(
                            height: 2,
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Text('Below 200miles'),
                          ),
                          PopupMenuDivider(
                            height: 2,
                          ),
                          PopupMenuItem(
                            value: 4,
                            child: Text('Below 500miles'),
                          ),
                          PopupMenuDivider(
                            height: 2,
                          ),
                          PopupMenuItem(
                            value: 5,
                            child: Text('Below 1000miles'),
                          ),
                          PopupMenuDivider(
                            height: 2,
                          ),
                          PopupMenuItem(
                            value: 6,
                            child: Text('Below 1500miles'),
                          ),
                        ],
                        elevation: 3,
                        icon: Icon(Icons.more_vert,
                            size: 30, color: Colors.white),
                        onSelected: (value) {
                          miles_value = value;
                          return print('value: $value');
                        },
                      ),
                    ),
                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(top: 8.0, right: 23),
//                    child: Align(
//                      alignment: Alignment.topRight,
//                      child: IconButton(
//                        onPressed: () async {
//                          zoom_value++;
//                          GoogleMapController controller =
//                              await _controller.future;
//                          return controller.animateCamera(
//                              CameraUpdate.newCameraPosition(CameraPosition(
//                                  zoom: zoom_value,
//                                  target: LatLng(
//                                    double.parse(locationValues
//                                        .location_latitude
//                                        .toString()),
//                                    double.parse(locationValues
//                                        .location_longitude
//                                        .toString()),
//                                  ))));
//                        },
//                        icon: Padding(
//                          padding: const EdgeInsets.only(right: 8.0),
//                          child: Icon(
//                            Icons.add,
//                            size: 40,
//                            color: Colors.white,
//                          ),
//                        ),
//                      ),
//                    ),
//                  )
                ],
              );},
            );
          } else if (snapshots.hasError) {
            print('error');
            return Text('${snapshots.error}');
          }
          return Center(child: Text('Loading...'));
        });
  }
}
