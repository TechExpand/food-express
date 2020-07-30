import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart' show Location;
import 'package:geocoder/geocoder.dart';

class LocationService with ChangeNotifier{

  double location_latitude = 0;
  double location_longitude = 0;
  Location location_met = Location();
  var _serviceEnabled;
  var name = 'john';
  var first;


//  double set loc_latitude => location_latitude;


  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Future getCurrentLocation() async {
    var position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    location_latitude = position.latitude;
    location_longitude = position.longitude;
    name = 'frank';
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


   Future getaddress({value,locality,address_line})async{
     var addresses = await Geocoder.local.findAddressesFromCoordinates(Coordinates(double.parse(value.Lan), double.parse(value.Log)));
     first = addresses.first;
     locality.add(first.locality);
     address_line.add(first.addressLine);
     notifyListeners();
   }


  void getdistance({lat1,lat2,lon1,lon2,distance_list}){
    const R = 6371e3; // metres
    final rlat1 = lat1 * pi/180; // φ in radians
    final rlat2 = lat2 * pi/180; //φ in radians
    final rlong1 = (lat2-lat1) * pi/180; //λ in radians
    final rlong2 = (lon2-lon1) * pi/180;  //λ in radians
    final a = sin(rlong1/2) * sin(rlong1/2) + cos(rlat1) * cos(rlat2) * sin(rlong2/2) * sin(rlong2/2);
    final c = 2 * atan2(sqrt(a), sqrt(1-a));
    final distance = R * c; // in metres
    distance_list.add(distance.ceil());
    notifyListeners();
  }


}
