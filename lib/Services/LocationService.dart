import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart' show Location;
import 'package:geocoder/geocoder.dart';

class LocationService with ChangeNotifier {
  double location_latitude = 0;
  double location_longitude = 0;
  Location location_met = Location();
  var _serviceEnabled;
  var first;

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Future getCurrentLocation() async {
    var position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    location_latitude = position.latitude;
    location_longitude = position.longitude;
    print(location_latitude.toString());
    print(location_longitude.toString());
    notifyListeners();
    return position;
  }

  Future onlocation() async {
    try {
      _serviceEnabled = await location_met.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location_met.requestService();
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

}
