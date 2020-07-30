import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodtruckexpressxd/Services/LocationService.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VENDORPAGE.dart';

import 'package:foodtruckexpressxd/screens/VendorView/VENDORprofile.dart';
import 'package:provider/provider.dart';

class Map_user extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapUserSample();
  }
}

class MapUserSample extends StatefulWidget {
  @override
  State<MapUserSample> createState() => MapUserSampleState();
}

class MapUserSampleState extends State<MapUserSample> {
  @override
  void initState() {
    super.initState();
//    get_location();
//    getCurrentLocation();
//    callmarker();
  }

//  callmarker() {
//    Future.delayed(Duration(seconds: 5), updatemarker);
//  }

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
                      return VENDORprofile();
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
        title: Text('Current Users'),
      ),
      body: Stack(
        children: <Widget>[bodywidget(), listvendor()],
      ),
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

  @override
  Widget build(BuildContext context) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    var webservices = Provider.of<WebServices>(context, listen: false);
    // TODO: implement build
    return FutureBuilder(
        initialData: Center(child: Text('Loading...')),
        future: webservices.get_all_user_current_location(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (var index in snapshot.data) {
              marker.add(Marker(
                  markerId: MarkerId(index.user.toString()),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(double.parse(index.Lan),
                      double.parse(index.Log))));
            }
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(locationValues.location_latitude,
                        locationValues.location_longitude),
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: marker,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            print('error');
            return Text('${snapshot.error}');
          }

          return Center(child: CircularProgressIndicator(),);
        });
  }
}

class listvendor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return listvendorstate();
  }
}

class listvendorstate extends State<listvendor> {
  @override
  Widget build(BuildContext context) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    // TODO: implement build
    return FutureBuilder(
      builder:(context, snapshot)=> Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 100,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FittedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: 120,
                      width: 180,
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              child: Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage(
                                        'assets/images/logotruck.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        child: Text(
                                          'title',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              fontSize: 18),
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        child: Text(
                                          'subtitle',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15),
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        child: Text(
                                          'adrress',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15),
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
