import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Model/currentuserlocation.dart';
import 'package:foodtruckexpressxd/Model/currentvendorlocation.dart';
import 'package:foodtruckexpressxd/Model/locationprofilemenudetails.dart';
import 'package:foodtruckexpressxd/Model/userprofile.dart';
import 'package:foodtruckexpressxd/Model/vendorprofile.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/loginuser.dart';
import 'package:foodtruckexpressxd/screens/UserView/Map_user.dart';
import 'package:foodtruckexpressxd/screens/VendorView/MAp_vendor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class WebServices extends ChangeNotifier {
  var signup_response;
  var token;

//"""GET REQUEST ""

//
//  Future<LocationProfileDetail> location_profile(id) async {
//    var res = await http.get(
//        Uri.encodeFull(
//            'http://192.168.43.231:8000/foodtruck/locationprofile/${id.toString()}'),
//        headers: {
//          "Accept": "application/json",
//          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
//        });
//    if (res.statusCode == 200) {
//      LocationProfileDetail.fromJson(json.decode(res.body));
//    } else {
//      throw 'Cant get profile details';
//    }
//  }
//
//  Future<LocationMenuDetail> location_menu(id) async {
//    var res = await http.get(
//        Uri.encodeFull(
//            'http://192.168.43.231:8000/foodtruck/locationmenu/${id.toString()}'),
//        headers: {
//          "Accept": "application/json",
//          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
//        });
//    if (res.statusCode == 200) {
//      LocationMenuDetail.fromJson(json.decode(res.body));
//    } else {
//      throw 'Cant get menu details';
//    }
//  }

  Future Vendor_Profile_Api() async {
    var res = await http.get(
        Uri.encodeFull('http://192.168.43.231:8000/foodtruck-vendor/profile/'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
        });
    if (res.statusCode == 200) {
      print(res.body);
      var body = jsonDecode(res.body) as List;
      List<VendorProfile> vendor_profile_objects = body
          .map((vendor_profile_json) =>
              VendorProfile.fromJson(vendor_profile_json))
          .toList();
      print(vendor_profile_objects);
      return vendor_profile_objects;
    } else {
      throw 'Cant get vendor profile';
    }
  }



  Future User_Profile_Api() async {
    var res = await http.get(
        Uri.encodeFull('http://192.168.43.231:8000/foodtruck/profile/'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
        });
    if (res.statusCode == 200) {
      print(res.body);
      var body = jsonDecode(res.body) as List;
      List<UserProfile> user_profile_objects = body
          .map((user_profile_json) =>
          UserProfile.fromJson(user_profile_json))
          .toList();
      print(user_profile_objects);
      return user_profile_objects;
    } else {
      throw 'Cant get user profile';
    }
  }

//
//
//  Future<CurrentVendorlocation> get_vendor_location() async {
//    var res = await http.get(
//        Uri.encodeFull(
//            'http://192.168.43.231:8000/foodtruck/currentvendorlanlog/'),
//        headers: {
//          "Accept": "application/json",
//          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
//        });
//    if (res.statusCode == 200) {
//      CurrentVendorlocation.fromJson(json.decode(res.body));
//    } else {
//      throw 'Cant get vendor location';
//    }
//  }
//
//  Future get_user_location() async {
//    var res = await http.get(
//        Uri.encodeFull(
//            'http://192.168.43.231:8000/foodtruck/currentuserlanlog/'),
//        headers: {
//          "Accept": "application/json",
//          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
//        });
//    if (res.statusCode == 200) {
//      CurrentUserlocation.fromJson(json.decode(res.body));
//    } else {
//      throw 'Cant get user location';
//    }
//  }
//
////"""POST REQUEST ""
//
//
//
//// sign up request




//
//
//
//
//  Future submit_location() async {
//    try {
//      var upload = http.MultipartRequest('POST',
//          Uri.parse('http://192.168.43.231:8000/foodtruck/token/login/'));
//      upload.fields['password'] = password.toString();
//      upload.fields['email'] = email.toString();
//      upload.headers['authorization'] = 'Token ${token['auth_token']}';
//      final stream = await upload.send();
//      var response = await http.Response.fromStream(stream);
//      token = json.decode(response.body);
//
//      Future.delayed(Duration(seconds: 5), send_location);
//    } catch (e) {
//      print(e);
//    }
//  }
//
//  Future send_location() async {
//    var upload_loc = http.MultipartRequest(
//        'POST', Uri.parse('http://192.168.43.231:8000/foodtruck/userlanlog/'));
//    upload_loc.fields['Lan'] = location_latitude.toString();
//    upload_loc.fields['Log'] = location_longitude.toString();
//    upload_loc.fields['online'] = 'True';
//    upload_loc.fields['user'] = '';
//    upload_loc.headers['authorization'] = 'Token ${token['auth_token']}';
//    final stream_loc = await upload_loc.send();
//    var response_loc = await http.Response.fromStream(stream_loc);
//    return response_loc;
//  }
//
//
//



  Future Signup_VendorApi({username,password,email,re_password}) async {
    var upload = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.43.231:8000/foodtruck-vendor/users/'));
    upload.fields['username'] = username.toString();
    upload.fields['password'] = password.toString();
    upload.fields['email'] = email.toString();
    upload.fields['re_password'] = re_password.toString();
    final stream = await upload.send();
    signup_response = await http.Response.fromStream(stream);
    return print(signup_response.body);
  }




  Future Signup_UserApi({username,password,email,re_password}) async {
    var upload = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.43.231:8000/foodtruck/users/'));
    upload.fields['username'] = username.toString();
    upload.fields['password'] = password.toString();
    upload.fields['email'] = email.toString();
    upload.fields['re_password'] = re_password.toString();
    final stream = await upload.send();
    signup_response = await http.Response.fromStream(stream);
    return print(signup_response.body);
  }




  Future Login_VendorApi({password, email}) async {
    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://192.168.43.231:8000/foodtruck-vendor/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      var response = await http.Response.fromStream(stream);
      var token = json.decode(response.body);
      print(token["auth_token"]);
      return token;
    } catch (e) {
      print(e);
    }
  }



  Future Login_UserApi({password, email}) async {
    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://192.168.43.231:8000/foodtruck/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      var response = await http.Response.fromStream(stream);
      var token = json.decode(response.body);
      print(token["auth_token"]);
      return token;
    } catch (e) {
      print(e);
    }
  }
}
