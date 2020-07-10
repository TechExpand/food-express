import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart' show Location;

class LocationService with ChangeNotifier {
  var location_latitude;
  var location_longitude;
  Location location_met = Location();
  var _serviceEnabled;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Future getCurrentLocation() async {
    var position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    location_latitude = position.latitude;
    location_longitude = position.longitude;
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
