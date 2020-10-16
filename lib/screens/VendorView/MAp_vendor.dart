import 'package:flutter/material.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:foodtruck/screens/VendorView/VENDORPAGE.dart';
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
GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
    return Scaffold(
      key: scaffold_key,
      drawer: SafeArea(
        child: SizedBox(
          width: 250,
          child: Drawer(
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 100,
                        child: Image.asset('assets/images/logotruck.png')
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                    future: webservices.User_Profile_Api(),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? ListTile(
                              title: Text('${snapshot.data['username']}'),
                              subtitle: Text('${snapshot.data['email']}'),
                              leading: Icon(Icons.person_pin_circle),
                            )
                          : ListTile(
                              title: Text('MY USERNAME'),
                              subtitle: Text('MY EMAIL'),
                              leading: Icon(Icons.person_pin_circle),
                            );
                    }),
                Divider(),
                ListTile(
                  title: Text('ABOUT APP'),
                  leading: Icon(Icons.info_outline),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[
         Image.asset('assets/images/truckIcon.png', width: 100,),
         SizedBox(width: 8,)
        ],
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
             scaffold_key.currentState.openDrawer();
          },
          child: Image.asset('assets/images/menuIcon.png', scale: 1.2,),
          ),
        centerTitle: true,
        title: Text('Current Vendors', style: TextStyle(color: Colors.black), overflow: TextOverflow.visible,),
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
        BitmapDescriptor custom_marker;
    BitmapDescriptor custom_user_marker;
@override
void initState(){
  super.initState();
BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(0.5, 0.5),),
 'assets/images/truckmarkerBlue.png').then((v){
   custom_marker = v;
 });

BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(0.5, 0.5)),
 'assets/images/homemarkerBlue.png').then((v){
   custom_user_marker = v;
 });
}

  
  Completer<GoogleMapController> _controller = Completer();
  var marker = Set<Marker>();
  var zoom_value = 12.0;
  var index_value;
  var range_value = 50.0;

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
            return MapDetails(snapshots, locationValues, context);
          } else if (snapshots.hasError) {
            print('error');
            return Text('${snapshots.error}');
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget MapDetails(snapshots, locationValues, context) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        marker.clear();
        for (index_value in snapshots.data) {
          marker.add(
            Marker(
              infoWindow: InfoWindow(
                title: '${index_value.distance} Meters'
              ),
              markerId: MarkerId(index_value.user.toString()),
              icon: custom_marker,
              position: LatLng(double.parse(index_value.Lan),
                  double.parse(index_value.Log))));
        }

         marker.add(
            Marker(
              markerId: MarkerId('current location'),
              icon: custom_user_marker,
              position: LatLng(locationValues.location_latitude,
                      locationValues.location_longitude))
                      );

        return Stack(
          children: <Widget>[
            Container(
              child: GoogleMap(
                mapType: MapType.normal,
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
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4),
                  width: 250,
                  height: 100,
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    onPageChanged: (index) async {
                      print(snapshots.data[index].Lan.toString());
                      GoogleMapController controller = await _controller.future;
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
                      return Builder(builder: (context) {
                        if (snapshots.connectionState == ConnectionState.done) {
                          return FittedBox(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                height: 140,
                                child: Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return VENDORPAGE(
                                                id: snapshots.data[index].id,
                                                lan: double.parse(
                                                    snapshots.data[index].Lan),
                                                log: double.parse(
                                                    snapshots.data[index].Log));
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
                                      color: Color(0xFF67b9fb).withOpacity(0.2),
                                      child: Container(
                                        width: 250,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8),
                                              child: InkWell(
                                                onTap: ()async{
                                                   GoogleMapController
                                                      controller =
                                                      await _controller.future;
                                                  return controller
                                                      .animateCamera(CameraUpdate
                                                          .newCameraPosition(
                                                              CameraPosition(
                                                                  bearing: 45,
                                                                  tilt: 50,
                                                                  zoom: 15,
                                                                  target:
                                                                      LatLng(
                                                                    double.parse(
                                                                        snapshots
                                                                            .data[index]
                                                                            .Lan),
                                                                    double.parse(
                                                                        snapshots
                                                                            .data[index]
                                                                            .Log),
                                                                  ))));
                                                },
                                                child: Container(
                                                  height: 80,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(colors: [Color(0xff8acbff), Color(0xff67b9fb)],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    ),
                                                    shape: BoxShape.circle,
                                                     color: Colors.lightBlue,
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      top: 5.0, bottom: 5),
                                                  child: Center(
                                                    child: Text(
                                                      'Focus\n View',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Futura',
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold ,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: Divider(
                                                color: Colors.black,
                                                indent: 5,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8,
                                              ),
                                              child: Text(
                                                '${snapshots.data[index].distance} '+' MILES AWAY',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20),
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
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      });
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
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      thumbColor: Colors.lightBlueAccent,
                      overlayColor: Colors.blue.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.blue[700],
                      inactiveTickMarkColor: Colors.blue[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.lightBlueAccent,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Slider(
                      value: range_value,
                      min: 0.0,
                      max: 100,
                      divisions: 20,
                      label: '$range_value',
                      onChanged: (value) {
                        setState(
                          () {
                            range_value = value;
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
  }
}
