import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart' show Location;

class LocationService with ChangeNotifier {
  double location_latitude = 0;
  double location_longitude = 0;
  Location location_met = Location();
  var _serviceEnabled;


  Future getCurrentLocation() async {
    try{
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      location_latitude = position.latitude;
      location_longitude = position.longitude;
      notifyListeners();
      return position;
    }catch(e){
      print(e);
    }

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
