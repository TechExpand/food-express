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
  var zoom_value = 2.0;
  var index_value;
  var range_value = 5000.0;

  @override
  Widget build(BuildContext context) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    var webservices = Provider.of<WebServices>(context, listen: false);
    // TODO: implement build
    return FutureBuilder(
        future: webservices.get_all_vendor_current_location(
          context: context,
          location_latitude: locationValues.location_latitude,
          location_longtitude: locationValues.location_longitude,
          range_value: range_value,
        ),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                marker.clear();
                for (index_value in snapshots.data) {
                  marker.add(Marker(
                      markerId: MarkerId(index_value.user.toString()),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(double.parse(index_value.Lan),
                          double.parse(index_value.Log))));
                }

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
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 100,
                          child: PageView.builder(
                            onPageChanged: (index) async {
                              print(snapshots.data[index].Lan.toString());
                              GoogleMapController controller =
                                  await _controller.future;
                              return controller.animateCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      bearing: 45,
                                      tilt: 50,
                                      zoom: 15,
                                      target: LatLng(
                                        double.parse(snapshots.data[index].Lan),
                                        double.parse(snapshots.data[index].Log),
                                      ))));
                            },
                            itemCount: snapshots.data.length,
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
                                              pageBuilder: (context, animation,
                                                  secondaryAnimation) {
                                                return VENDORPAGE(
                                                    id: snapshots
                                                        .data[index].id,
                                                    lan: double.parse(snapshots
                                                        .data[index].Lan),
                                                    log: double.parse(snapshots
                                                        .data[index].Log));
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
                                        child: Card(
                                          child: Container(
                                            width: 250,
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, right: 8),
                                                  child: ActionChip(
                                                    backgroundColor:
                                                        Colors.lightBlue,
                                                    label: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 5.0,
                                                              bottom: 5),
                                                      child: Text(
                                                        'Focus View',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      print(snapshots
                                                          .data[index].Lan
                                                          .toString());
                                                      GoogleMapController
                                                          controller =
                                                          await _controller
                                                              .future;
                                                      return controller
                                                          .animateCamera(CameraUpdate
                                                              .newCameraPosition(
                                                                  CameraPosition(
                                                                      bearing:
                                                                          45,
                                                                      tilt: 50,
                                                                      zoom: 15,
                                                                      target:
                                                                          LatLng(
                                                                        double.parse(snapshots
                                                                            .data[index]
                                                                            .Lan),
                                                                        double.parse(snapshots
                                                                            .data[index]
                                                                            .Log),
                                                                      ))));
                                                    },
                                                  ),
                                                ),
                                                Divider(color: Colors.blue, indent: 5, ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8,
                                                  ),
                                                  child: Text(
                                                    '${snapshots.data[index].distance}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54,
                                                        fontSize: 20),
                                                    softWrap: false,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Text(
                                                    'MILES AWAY',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                        fontSize: 14),
                                                    softWrap: false,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                              ],
                                            ),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 40,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.blue[700],
                              inactiveTrackColor: Colors.blue[100],
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: 5.0,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              thumbColor: Colors.lightBlueAccent,
                              overlayColor: Colors.blue.withAlpha(32),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 28.0),
                              tickMarkShape: RoundSliderTickMarkShape(),
                              activeTickMarkColor: Colors.blue[700],
                              inactiveTickMarkColor: Colors.blue[100],
                              valueIndicatorShape:
                                  PaddleSliderValueIndicatorShape(),
                              valueIndicatorColor: Colors.lightBlueAccent,
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Slider(
                              value: range_value,
                              min: 0,
                              max: 10000,
                              divisions: 10,
                              label: '$range_value',
                              onChanged: (value) {
                                setState(
                                  () {
                                    range_value = value;
                                    print(range_value);
                                    bodywidget();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshots.hasError) {
            print('error');
            return Text('${snapshots.error}');
          }
          return Center(child: Text('Loading...'));
        });
  }
}
