import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/Utils/provider_util.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/SIGNUP.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Local_Widget with ChangeNotifier {




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
}
