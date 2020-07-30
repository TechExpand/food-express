import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Model/currentuserlocation.dart';
import 'package:foodtruckexpressxd/Model/currentvendorlocation.dart';
import 'package:foodtruckexpressxd/Model/locationprofilemenudetails.dart';
import 'package:foodtruckexpressxd/Model/userprofile.dart';
import 'package:foodtruckexpressxd/Model/vendorprofile.dart';
import 'package:foodtruckexpressxd/Services/LocationService.dart';
import 'package:foodtruckexpressxd/Utils/provider_util.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/SIGNUP.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/login.dart';
import 'package:foodtruckexpressxd/screens/UserView/Map_user.dart';
import 'package:foodtruckexpressxd/screens/VendorView/MAp_vendor.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VENDORSIGNUP_INFO.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VENDORprofile.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VendorMenuPage.dart';
import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class WebServices extends ChangeNotifier {
  var vendor_signup_res;
  var token;
  var location_token_vendor;
  var location_token_user;
  var user_signup_res;
  var vendor_profile_res;
  var user_profile_res;
  var vendor_login_res;
  var vendor_info_res;
  var user_login_res;
  var login_state = false;
  var login_state_second = false;
  var value;
  List distance_list = [];
  List locality = [];
  List address_line = [];

  void Login_SetState() {
    if (login_state == false) {
      login_state = true;
    } else {
      login_state = false;
    }
    notifyListeners();
  }

  void Login_SetState_Second() {
    if (login_state_second = false) {
      login_state_second = true;
    } else {
      login_state_second = false;
    }
    notifyListeners();
  }

//"""GET REQUEST ""

  Future location_profile(id) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/foodtruck-vendor/locationprofile/${id.toString()}'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
          });
      if (res.statusCode == 200) {
        print(res.body);
        var body = jsonDecode(res.body) as List;
        List<LocationProfileDetail> location_profile_objects = body
            .map((location_profile_json) =>
                LocationProfileDetail.fromJson(location_profile_json))
            .toList();
        print(location_profile_objects);
        return location_profile_objects;
      } else {
        throw 'Cant get profile details';
      }
    } catch (e) {
      print('Cant get profile details');
      print(e);
    }
  }

  Future location_menu(id) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/foodtruck-vendor/locationmenu/${id.toString()}'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
          });
      if (res.statusCode == 200) {
        print(res.body);
        var body = jsonDecode(res.body) as List;
        List<LocationMenuDetail> location_menu_objects = body
            .map((location_menu_json) =>
                LocationMenuDetail.fromJson(location_menu_json))
            .toList();
        print(location_menu_objects);
        return location_menu_objects;
      }
    } catch (e) {
      print(e);
    }
  }

  Future Vendor_Profile_Menu() async {
    try {
      var res = await http.get(
          Uri.encodeFull('http://192.168.43.231:8000/foodtruck-vendor/menu/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
          });
      if (res.statusCode == 200) {
        print(res.body);
        var body = jsonDecode(res.body) as List;
        List<LocationMenuDetail> vendor_menu_objects = body
            .map((vendor_menu_json) =>
                LocationMenuDetail.fromJson(vendor_menu_json))
            .toList();
        print(vendor_menu_objects);
        return vendor_menu_objects;
      }
    } catch (e) {
      print(e);
    }
  }

  Future Vendor_InfoApi(
      {business_name, unique_detail, detail, phone, path, context}) async {
    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://192.168.43.231:8000/foodtruck-vendor/profile/'));
      var file = await http.MultipartFile.fromPath('pro_pic', path);
      upload.files.add(file);
      upload.fields['business_name'] = business_name.toString();
      upload.fields['unique_detail'] = unique_detail.toString();
      upload.fields['detail'] = detail.toString();
      upload.fields['phone'] = phone.toString();
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
          'Token ${location_token_vendor['auth_token']}';

      final stream = await upload.send();
      vendor_info_res = await http.Response.fromStream(stream);
      print(vendor_info_res);
      var body = jsonDecode(vendor_info_res.body);
      if (vendor_info_res.statusCode == 200 ||
          vendor_info_res.statusCode == 201) {
        Login_SetState();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Map_user();
        }));
      } else if (vendor_info_res.statusCode == 400) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Credentials',
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            context: context);
      }
      return vendor_info_res;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }

  Future Vendor_Profile_Api() async {
    var vendor_profile_res = await http.get(
        Uri.encodeFull('http://192.168.43.231:8000/foodtruck-vendor/profile/'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
        });
    if (vendor_profile_res.statusCode == 200) {
      print(vendor_profile_res.body);
      var body = jsonDecode(vendor_profile_res.body) as List;
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
    user_profile_res = await http.get(
        Uri.encodeFull('http://192.168.43.231:8000/foodtruck/profile/'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
        });
    if (user_profile_res.statusCode == 200) {
      print(user_profile_res.body);
      var body = jsonDecode(user_profile_res.body) as List;
      List<UserProfile> user_profile_objects = body
          .map((user_profile_json) => UserProfile.fromJson(user_profile_json))
          .toList();
      print(user_profile_objects);
      return user_profile_objects;
    } else {
      throw 'Cant get user profile';
    }
  }

  Future get_all_vendor_current_location(context) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/foodtruck-vendor/currentvendorlanlog/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<CurrentVendorlocation> vendor_current_location_objects = body
            .map((vendor_current_location_json) =>
                CurrentVendorlocation.fromJson(vendor_current_location_json))
            .toList();

        for (value in vendor_current_location_objects) {
          locationValues.getaddress(
              value: value, address_line: address_line, locality: locality);
          locationValues.getdistance(
              lat1: double.parse(value.Lan),
              lon1: double.parse(value.Log),
              lat2: locationValues.location_latitude,
              lon2: locationValues.location_longitude,
              distance_list: distance_list);
        }

        notifyListeners();
        return vendor_current_location_objects;
      } else {
        throw 'failed';
      }
    } catch (e) {
      print(e);
      print('failed to get locations');
    }
  }

  Future get_all_user_current_location() async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/foodtruck/currentuserlanlog/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<CurrentUserlocation> user_current_location_objects = body
            .map((user_current_location_json) =>
                CurrentUserlocation.fromJson(user_current_location_json))
            .toList();
        return user_current_location_objects;
      } else {
        throw 'failed';
      }
    } catch (e) {
      print(e);
      print('failed to get location');
    }
  }

////"""POST REQUEST ""
//
//
//
//// sign up request

//
//
//
//
  Future<dynamic> login_before_submit_location_vendor(
      {email, password, context}) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    try {
      var upload = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://192.168.43.231:8000/foodtruck-vendor/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      var response = await http.Response.fromStream(stream);
      print(response.body.toString());
      print(password.toString());
      print(email.toString());
      location_token_vendor = json.decode(response.body);
      print(locationValues.location_latitude.toString());
      print(locationValues.location_longitude.toString());
    } catch (e) {
      print(e);
    }
  }

  Future send_vendor_location(context) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    try {
      var upload_loc = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://192.168.43.231:8000/foodtruck-vendor/vendorlanlog/'));
      upload_loc.fields['Lan'] = locationValues.location_latitude.toString();
      upload_loc.fields['Log'] = locationValues.location_longitude.toString();
      upload_loc.fields['online'] = 'True';
      upload_loc.fields['user'] = '';
      upload_loc.headers['authorization'] =
          'Token ${location_token_vendor['auth_token']}';
      final stream_loc = await upload_loc.send();
      var response_loc = await http.Response.fromStream(stream_loc);
      print(locationValues.location_latitude.toString());
      print(locationValues.location_longitude.toString());
      return print(response_loc.body);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> login_before_submit_location_user(
      {email, password, context}) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);

    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://192.168.43.231:8000/foodtruck/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      var response = await http.Response.fromStream(stream);
      print(response.body.toString());
      print(password.toString());
      print(email.toString());
      location_token_user = json.decode(response.body);
      print(locationValues.location_latitude.toString());
      print(locationValues.location_longitude.toString());
    } catch (e) {
      print(e);
    }
  }

  Future send_user_location(context) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    try {
      var upload_loc = http.MultipartRequest('POST',
          Uri.parse('http://192.168.43.231:8000/foodtruck/userlanlog/'));
      upload_loc.fields['Lan'] = locationValues.location_latitude.toString();
      upload_loc.fields['Log'] = locationValues.location_longitude.toString();
      upload_loc.fields['online'] = 'True';
      upload_loc.fields['user'] = '';
      upload_loc.headers['authorization'] =
          'Token ${location_token_user['auth_token']}';
      final stream_loc = await upload_loc.send();
      var response_loc = await http.Response.fromStream(stream_loc);
      print(locationValues.location_latitude.toString());
      print(locationValues.location_longitude.toString());
      return print(response_loc.body);
    } catch (e) {
      print(e);
    }
  }

  Future Signup_VendorApi(
      {username, password, email, re_password, context}) async {
    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://192.168.43.231:8000/foodtruck-vendor/users/'));
      upload.fields['username'] = username.toString();
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      upload.fields['re_password'] = re_password.toString();
      final stream = await upload.send();
      vendor_signup_res = await http.Response.fromStream(stream);
      print(vendor_signup_res);
      var body = jsonDecode(vendor_signup_res.body);
      if (vendor_signup_res.statusCode == 200 ||
          vendor_signup_res.statusCode == 201) {
        Login_SetState();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return VENDORSIGNUP22();
        }));
      } else if (vendor_signup_res.statusCode == 400) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Credentials',
                    style: TextStyle(color: Colors.blue)),
              ),
              content: Container(
                  width: 280,
                  height: 180,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['username'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['username'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['email'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['email'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['password'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['password'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['non_field_errors'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['non_field_errors'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  )),
            ),
            context: context);
      }
      return vendor_signup_res;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }

  Future Signup_UserApi(
      {username, password, email, re_password, context}) async {
    try {
      var upload = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.43.231:8000/foodtruck/users/'));
      upload.fields['username'] = username.toString();
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      upload.fields['re_password'] = re_password.toString();
      final stream = await upload.send();
      user_signup_res = await http.Response.fromStream(stream);
      print(user_signup_res);
      var body = jsonDecode(user_signup_res.body);
      if (user_signup_res.statusCode == 200 ||
          user_signup_res.statusCode == 201) {
        Login_SetState();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Map_vendor();
        }));
      } else if (user_signup_res.statusCode == 400) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Credentials',
                    style: TextStyle(color: Colors.blue)),
              ),
              content: Container(
                  width: 280,
                  height: 180,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['username'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['username'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['email'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['email'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['password'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['password'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['non_field_errors'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['non_field_errors'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  )),
            ),
            context: context);
      }
      return user_signup_res;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }

  Future Login_VendorApi({password, email, context}) async {
    try {
      var upload = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://192.168.43.231:8000/foodtruck-vendor/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      vendor_login_res = await http.Response.fromStream(stream);
      var token = json.decode(vendor_login_res.body);
      print(token["auth_token"]);
      if (vendor_login_res.statusCode == 200 ||
          vendor_login_res.statusCode == 201) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Map_user();
        }));
        Login_SetState();
      } else if (vendor_login_res.statusCode == 400 ||
          vendor_login_res.statusCode == 500) {
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Credentials',
                    style: TextStyle(color: Colors.blue)),
              ),
              content: Text('unable to login with provided credentials',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      } else if (vendor_login_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        print(vendor_login_res.toString());
        print(vendor_login_res.toString());
        Login_SetState();
      }

      return token;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }

  Future Login_UserApi({password, email, context}) async {
    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://192.168.43.231:8000/foodtruck/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      user_login_res = await http.Response.fromStream(stream);
      var token = json.decode(user_login_res.body);
      print(token["auth_token"]);
      print(user_login_res.statusCode.toString());
      if (user_login_res.statusCode == 200 ||
          user_login_res.statusCode == 201) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SIGNUP();
        }));
        Login_SetState();
      } else if (user_login_res.statusCode == 400 ||
          user_login_res.statusCode == 500) {
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Credentials',
                    style: TextStyle(color: Colors.blue)),
              ),
              content: Text('unable to login with provided credentials',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      } else if (user_login_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      }

      return token;
    } catch (e) {
      print(e);
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
    }
  }

  Future Update_Menu_Details(
      {id, context, menu_description, menu_title, menu_price}) async {
    try {
      var upload = http.MultipartRequest('PUT',
          Uri.parse('http://192.168.43.231:8000/foodtruck-vendor/menu/${id}/'));
      upload.fields['menu_description'] = menu_description.toString();
      upload.fields['menu_title'] = menu_title.toString();
      upload.fields['menu_price'] = menu_price;
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
          "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c";
      final stream = await upload.send();
      var update_menu_res = await http.Response.fromStream(stream);
      var body = json.decode(update_menu_res.body);
      print(update_menu_res.statusCode.toString());
      if (update_menu_res.statusCode == 200 ||
          update_menu_res.statusCode == 201) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return VendorMenuPage();
        }));
        print('doneeeeeeeeeee...');
        Login_SetState();
      } else if (update_menu_res.statusCode == 400 ||
          update_menu_res.statusCode == 500 ||
          update_menu_res.statusCode == 405) {
        print(body.toString());
        showDialog(
            child: AlertDialog(
              content: Text('process unable to finish',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      } else if (update_menu_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      }

      return update_menu_res;
    } catch (e) {
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
      print(e);
    }
  }

  Future Update_Profile_Details({
    id,
    context,
    phone,
    business_name,
    unique_detail,
    detail,
  }) async {
    try {
      var upload = http.MultipartRequest(
          'PUT',
          Uri.parse(
              'http://192.168.43.231:8000/foodtruck-vendor/profile/${id}/'));
      upload.fields['phone'] = phone.toString();
      upload.fields['business_name'] = business_name.toString();
      upload.fields['unique_detail'] = unique_detail;
      upload.fields['detail'] = detail;
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
          "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c";
      final stream = await upload.send();
      var update_profile_res = await http.Response.fromStream(stream);
      var body = json.decode(update_profile_res.body);
      print(update_profile_res.body.toString());
      if (update_profile_res.statusCode == 200 ||
          update_profile_res.statusCode == 201) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return VENDORprofile();
        }));
        Login_SetState();
      } else if (update_profile_res.statusCode == 400 ||
          update_profile_res.statusCode == 500 ||
          update_profile_res.statusCode == 405) {
        print(body.toString());
        showDialog(
            child: AlertDialog(
              content: Text('process unable to finish',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      } else if (update_profile_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      }

      return update_profile_res;
    } catch (e) {
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
      print(e);
    }
  }

  Future Add_Menu(
      {context,
      image1,
      image2,
      image3,
      menu_title,
      menu_description,
      menu_price}) async {
    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://192.168.43.231:8000/foodtruck-vendor/menu/'));
      var file = await http.MultipartFile.fromPath('menu_picture1', image1);
      var file2 = await http.MultipartFile.fromPath('menu_picture2', image2);
      var file3 = await http.MultipartFile.fromPath('menu_picture3', image3);
      upload.files.add(file);
      upload.files.add(file2);
      upload.files.add(file3);
      upload.fields['menu_title'] = menu_title.toString();
      upload.fields['menu_description'] = menu_description.toString();
      upload.fields['menu_price'] = menu_price.toString();
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] = "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c";
      final stream = await upload.send();
      var upload_menu_res = await http.Response.fromStream(stream);
      var body = json.decode(upload_menu_res.body);
      print(upload_menu_res.body.toString());
      if (upload_menu_res.statusCode == 200 ||
          upload_menu_res.statusCode == 201) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return VendorMenuPage();
        }));
        Login_SetState();
      } else if (upload_menu_res.statusCode == 400 ||
          upload_menu_res.statusCode == 500 ||
          upload_menu_res.statusCode == 405) {
        print(body.toString());
        showDialog(
            child: AlertDialog(
              content: Text('process unable to finish',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      } else if (upload_menu_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      }

      return upload_menu_res;
    } catch (e) {
      Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
      print(e);
    }
  }

  Future Delete_Menu({id, context}) async {
    try {
      var upload = http.MultipartRequest('DELETE',
          Uri.parse('http://192.168.43.231:8000/foodtruck-vendor/menu/${id}/'));
      upload.headers['authorization'] =
          "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c";
      final stream = await upload.send();
      var update_menu_res = await http.Response.fromStream(stream);
      var body = json.decode(update_menu_res.body);
      print(body.toString());
      if (update_menu_res.statusCode == 200 ||
          update_menu_res.statusCode == 201 ||
          update_menu_res.statusCode == 204) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return VendorMenuPage();
        }));
        print('doneeeeeeeeeee...');
        Login_SetState();
      } else if (update_menu_res.statusCode == 400 ||
          update_menu_res.statusCode == 500 ||
          update_menu_res.statusCode == 405) {
        print(body.toString());
        Navigator.pop(context);
        showDialog(
            child: AlertDialog(
              content: Text('process unable to finish',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      } else if (update_menu_res.statusCode == 404) {
        Navigator.pop(context);
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      }

      return update_menu_res;
    } catch (e) {
      Login_SetState();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return VendorMenuPage();
      }));
      print('doneeeeeeeeeee...');
      print(e);
    }
  }

  Future Update_Profile_Pic({id, context, pro_pic = ''}) async {
    try {
      var upload = http.MultipartRequest(
          'PUT',
          Uri.parse(
              'http://192.168.43.231:8000/foodtruck-vendor/profile/${id}/'));
      var file = await http.MultipartFile.fromPath('pro_pic', pro_pic);
      upload.files.add(file);
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
          "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c";
      final stream = await upload.send();
      var update_menu_res = await http.Response.fromStream(stream);
      var body = json.decode(update_menu_res.body);
      print(update_menu_res.statusCode.toString());
      if (update_menu_res.statusCode == 200 ||
          update_menu_res.statusCode == 201) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return VENDORprofile();
        }));
        print('doneeeeeeeeeee...');
        Login_SetState_Second();
      } else if (update_menu_res.statusCode == 400 ||
          update_menu_res.statusCode == 500 ||
          update_menu_res.statusCode == 405) {
        print(body.toString());
        showDialog(
            child: AlertDialog(
              content: Text('process unable to finish',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState_Second();
      } else if (update_menu_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState_Second();
      }

      return update_menu_res;
    } catch (e) {
      Login_SetState_Second();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
      print(e);
    }
  }

  Future Update_Menu_Images(
      {id, context, image1 = '', image2 = '', image3 = ''}) async {
    try {
      var upload = http.MultipartRequest('PUT',
          Uri.parse('http://192.168.43.231:8000/foodtruck-vendor/menu/${id}/'));
      var file = await http.MultipartFile.fromPath('menu_picture1', image1);
      var file2 = await http.MultipartFile.fromPath('menu_picture2', image2);
      var file3 = await http.MultipartFile.fromPath('menu_picture3', image3);
      upload.files.add(file);
      upload.files.add(file2);
      upload.files.add(file3);
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
          "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c";
      final stream = await upload.send();
      var update_menu_res = await http.Response.fromStream(stream);
      var body = json.decode(update_menu_res.body);
      print(update_menu_res.statusCode.toString());
      if (update_menu_res.statusCode == 200 ||
          update_menu_res.statusCode == 201) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return VendorMenuPage();
        }));
        print('doneeeeeeeeeee...');
        Login_SetState_Second();
      } else if (update_menu_res.statusCode == 400 ||
          update_menu_res.statusCode == 500 ||
          update_menu_res.statusCode == 405) {
        print(body.toString());
        showDialog(
            child: AlertDialog(
              content: Text('process unable to finish',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState_Second();
      } else if (update_menu_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState_Second();
      }

      return update_menu_res;
    } catch (e) {
      Login_SetState_Second();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('Working on it', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('There was a Problem Encountered'),
          ),
          context: context);
      print(e);
    }
  }
}