import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodtruck/Model/currentuserlocation.dart';
import 'package:foodtruck/Model/currentvendorlocation.dart';
import 'package:foodtruck/Model/locationprofilemenudetails.dart';
import 'package:foodtruck/Model/rating.dart';
import 'package:foodtruck/Model/vendorprofile.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/screens/UserView/Map_user.dart';
import 'package:foodtruck/screens/VendorView/MAp_vendor.dart';
import 'package:foodtruck/screens/VendorView/VENDORSIGNUP_INFO.dart';
import 'package:foodtruck/screens/VendorView/VENDORprofile.dart';
import 'package:foodtruck/screens/VendorView/VendorMenuPage.dart';
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
  var vendor_menu_data = List();
  var location_menu_data = List();
  var vendor_info_res;
  var user_login_res;
  var update_online_offline_res;
  var login_state = false;
  var login_state_second = false;
    var login_state_third = false;
  var value;
  var isLoading = false;
  String nextpage_menu = 'http://wingu1000.pythonanywhere.com/foodtruck-vendor/menu/';

  void Login_SetState() {
    if (login_state == false) {
      login_state = true;
    } else {
      login_state = false;
    }
    notifyListeners();
  }

  void Login_SetState_Second(){
    if (login_state_second = false) {
      login_state_second = true;
    } else {
      login_state_second = false;
    }
    notifyListeners();
  }


  void Login_SetState_third() {
    if (login_state == false) {
      login_state = true;
    } else {
      login_state = false;
    }
    notifyListeners();
  }
//"""GET REQUEST ""

  Future location_profile(id) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/locationprofile/${id.toString()}'),
          headers: {
            "Accept": "application/json",
            "Authorization": 'Token ${token['auth_token']}'
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

  Future location_menu(id, subscription_id) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/locationmenu/id=${id.toString()}/sub_id=${subscription_id.toString()}'),
          headers: {
            "Accept": "application/json",
            "Authorization":  'Token ${token['auth_token']}'
          });
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        if (body == 'VENDOR MENU IS UNAVAILABLE') {
          return body;
        } else if (body == 'Connection Error') {
          var body = jsonDecode(res.body);
          return body;
        } else {
          var body = jsonDecode(res.body) as List;
          List<LocationMenuDetail> location_menu_objects = body
              .map((location_menu_json) =>
                  LocationMenuDetail.fromJson(location_menu_json))
              .toList();
          return location_menu_objects;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future Vendor_Profile_Menu() async {
    try {
      var res = await http.get(Uri.encodeFull('${nextpage_menu}'), headers: {
        "Accept": "application/json",
        "Authorization":  'Token ${token['auth_token']}'
      });
      isLoading = true;
      if (res.statusCode == 200) {
        var body = res.body;
        var data = jsonDecode(body);
        nextpage_menu = data['next'];
        var result = data['results'] as List;
        List<LocationMenuDetail> vendor_menu_objects = result
            .map((vendor_menu_json) =>
                LocationMenuDetail.fromJson(vendor_menu_json))
            .toList();

        vendor_menu_data.addAll(vendor_menu_objects);
        print(vendor_menu_data);
        isLoading = false;
        return vendor_menu_data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future Vendor_InfoApi(
      {business_name,
      unique_detail,
      detail,
      phone,
      path,
      number,
      exp_month,
      exp_year,
      cvc,
      context}) async {
    try {
      var upload = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/profile/number=${number}&exp_month=${exp_month}&exp_year=${exp_year}&cvc=${cvc}/'));
      var file = await http.MultipartFile.fromPath('pro_pic', path);
      upload.files.add(file);
      upload.fields['business_name'] = business_name.toString();
      upload.fields['unique_detail'] = unique_detail.toString();
      upload.fields['detail'] = detail.toString();
      upload.fields['phone'] = phone.toString();
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';

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

  Future Update_Vendor_to_Online_Offline({
    bool online_offline,
    lan,
    log,
    id,
    online_offline_value,
    color_value,
    scaffoldKey,
    context,
  }) async {
    try {
      var upload = http.MultipartRequest(
          'PUT',
          Uri.parse(
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/vendorlanlog/${id}/'));
      upload.fields['online'] = online_offline.toString();
      upload.fields['Lan'] = lan.toString();
      upload.fields['Log'] = log.toString();
      upload.fields['user'] = '';
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';

      final stream = await upload.send();
      update_online_offline_res = await http.Response.fromStream(stream);
      print(update_online_offline_res);
      var body = jsonDecode(update_online_offline_res.body);
      if (update_online_offline_res.statusCode == 200 ||
          update_online_offline_res.statusCode == 201) {
        Login_SetState();
        scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: new Text(
          'You are now ${online_offline_value}',
          textAlign: TextAlign.center,
        )));
      } else if (update_online_offline_res.statusCode == 400 ||
          update_online_offline_res.statusCode == 500 ||
          update_online_offline_res.statusCode == 401) {
        Login_SetState();
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Icon(
                  Icons.signal_cellular_connected_no_internet_4_bar,
                  color: Colors.red,
                ),
              ),
              content: Text('failed'),
            ),
            context: context);
      }
      return update_online_offline_res;
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
        Uri.encodeFull('http://wingu1000.pythonanywhere.com/foodtruck-vendor/profile/'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
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
        Uri.encodeFull('http://app.foodtruck.express/foodtruck/users/me/'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
        });
    if (user_profile_res.statusCode == 200) {
      var body = jsonDecode(user_profile_res.body);
      return body;
    } else {
      throw 'Cant get user profile';
    }
  }

  Future get_all_vendor_current_location(
      {context, location_latitude, location_longtitude, range_value}) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/currentvendorslanlog/lan=${location_latitude}&log=${location_longtitude}&range_value=${range_value}/'),
          headers: {
            "Accept": "application/json",
            "Authorization":  'Token ${token['auth_token']}'
          });

      if (res.statusCode == 200) {
        var body = jsonDecode(res.body) as List;
        List<CurrentVendorlocation> vendor_current_location_objects = body
            .map((vendor_current_location_json) =>
                CurrentVendorlocation.fromJson(vendor_current_location_json))
            .toList();
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

  Future get_current_vendor_location() async {
    var current_vendor_location = await http.get(
        Uri.encodeFull(
            'http://wingu1000.pythonanywhere.com/foodtruck-vendor/vendorlanlog/'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
        });
    if (current_vendor_location.statusCode == 200) {
      print(current_vendor_location.body);
      var body = jsonDecode(current_vendor_location.body) as List;
      List<CurrentVendorlocation> current_vendor_location_objects = body
          .map((current_vendor_location_json) =>
              CurrentVendorlocation.fromJson(current_vendor_location_json))
          .toList();
      print(current_vendor_location_objects);
      return current_vendor_location_objects;
    } else {
      throw 'Cant get vendor location';
    }
  }

  Future get_all_user_current_location(
      {context,
      location_latitude,
      location_longtitude,
      range_value,
      subscription_id}) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://app.foodtruck.express/foodtruck/currentuserlanlog/lan=${location_latitude}&log=${location_longtitude}&range_value=${range_value}&sub_id=${subscription_id}/'),
          headers: {
            "Accept": "application/json",
            "Authorization":  'Token ${token['auth_token']}'
          });

      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        if (body == 'Subscribe to get online Users and Display your Menu') {
          return body;
        } else if (body == 'Connection Error') {
        } else {
          var body = jsonDecode(res.body) as List;
          List<CurrentUserlocation> user_current_location_objects = body
              .map((user_current_location_json) =>
                  CurrentUserlocation.fromJson(user_current_location_json))
              .toList();
          notifyListeners();
          return user_current_location_objects;
        }
      } else {
        throw 'failed';
      }
    } catch (e) {
      print(e);
      print('failed to get locations');
    }
  }



Future get_vendor_rating(
      {context,
      vendor_id,
     }) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/rating/$vendor_id/'),
          headers: {
            "Accept": "application/json",
            "Authorization":  'Token ${token['auth_token']}'
          });
      if (res.statusCode == 200) {
                 var body = jsonDecode(res.body) as List;
          List<Rating> vendor_rating_objects = body
              .map((vendor_rating_json) =>
                  Rating.fromJson(vendor_rating_json))
              .toList();
          notifyListeners();
          return vendor_rating_objects;
      } else {
        throw 'failed';
      }
    } catch (e) {
      return 'failed to get rating';
    }
  }


  Future get_current_user_location() async {
    var current_user_location = await http.get(
        Uri.encodeFull('http://app.foodtruck.express/foodtruck/userlanlog/'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
        });
    if (current_user_location.statusCode == 200) {
      print(current_user_location.body);
      var body = jsonDecode(current_user_location.body) as List;
      List<CurrentUserlocation> current_user_location_objects = body
          .map((current_user_location_json) =>
              CurrentUserlocation.fromJson(current_user_location_json))
          .toList();
      print(current_user_location_objects);
      return current_user_location_objects;
    } else {
      throw 'Cant get user location';
    }
  }

  Future get_vender_subscription_id() async {
    var vender_subscription = await http.get(
        Uri.encodeFull(
            'http://wingu1000.pythonanywhere.com/foodtruck-vendor/user/subscription/'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
        });
    if (vender_subscription.statusCode == 200) {
      print(vender_subscription.body);
      var body = jsonDecode(vender_subscription.body);

      return body;
    } else {
      throw 'Cant get user subscription';
    }
  }

  Future get_vender_subscription_status(sub_id) async {
    var vender_subscription = await http.get(
        Uri.encodeFull(
            'http://wingu1000.pythonanywhere.com/foodtruck-vendor/subscription/status/sub_id=${sub_id.toString()}'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
        });
    if (vender_subscription.statusCode == 200) {
      var body = jsonDecode(vender_subscription.body);
      return body;
    } else {
      throw 'Cant get user subscription status';
    }
  }

  Future reactivate_subscription() async {
    var vender_subscription = await http.get(
        Uri.encodeFull(
            'http://wingu1000.pythonanywhere.com/foodtruck-vendor/createsubscription/'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
        });
    if (vender_subscription.statusCode == 200) {
      Login_SetState();
      var body = jsonDecode(vender_subscription.body);
      return body;
    } else {
      throw 'subscription failed';
    }
  }

  Future cancel_subscription() async {
    var vender_subscription = await http.get(
        Uri.encodeFull(
            'http://wingu1000.pythonanywhere.com/foodtruck-vendor/cancelsubscription/'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
        });
    if (vender_subscription.statusCode == 200) {
      Login_SetState();
      var body = jsonDecode(vender_subscription.body);
      return body;
    } else {
      throw 'subscription failed';
    }
  }

  Future Set_Default_Payment_Card(
      {card_number, exp_month, exp_year, cvc, context}) async {
    var vender_subscription = await http.get(
        Uri.encodeFull(
            'http://wingu1000.pythonanywhere.com/foodtruck-vendor/addnewcard/card_number=${card_number}&exp_month=${exp_month}&exp_year=${exp_year}&cvc=${cvc}/'),
        headers: {
          "Accept": "application/json",
          "Authorization":  'Token ${token['auth_token']}'
        });
    if (vender_subscription.statusCode == 200) {
      Login_SetState();
      var body = jsonDecode(vender_subscription.body);
      return body;
    } else {
      throw 'failed to add default card';
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
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      var response = await http.Response.fromStream(stream);
      location_token_vendor = json.decode(response.body);
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
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/vendorlanlog/'));
      upload_loc.fields['Lan'] = locationValues.location_latitude.toString();
      upload_loc.fields['Log'] = locationValues.location_longitude.toString();
      upload_loc.fields['online'] = 'True';
      upload_loc.fields['user'] = '';
      upload_loc.headers['authorization'] =
          'Token ${location_token_vendor['auth_token']}';
      final stream_loc = await upload_loc.send();
      var response_loc = await http.Response.fromStream(stream_loc);
      return print(response_loc.body);
    } catch (e) {
      print(e);
    }
  }

  Future Update_User_Location({id, context}) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    try {
      var upload = http.MultipartRequest('PUT',
          Uri.parse('http://app.foodtruck.express/foodtruck/userlanlog/${id}/'));
      upload.fields['online'] = 'true';
      upload.fields['Lan'] = locationValues.location_latitude.toString();
      upload.fields['Log'] = locationValues.location_longitude.toString();
      upload.fields['user'] = '';
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';

      final stream = await upload.send();
      var update_user_location_res = await http.Response.fromStream(stream);
      var body = jsonDecode(update_user_location_res.body);
      if (update_user_location_res.statusCode == 200 ||
          update_user_location_res.statusCode == 201) {
        return print('Location Updated');
      } else {
        print('Location not updated');
      }
      return update_user_location_res;
    } catch (e) {
      print(e);
    }
  }

  Future Update_Vendor_Location({id, context}) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    try {
      var upload = http.MultipartRequest(
          'PUT',
          Uri.parse(
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/vendorlanlog/${id}/'));
      upload.fields['online'] = 'true';
      upload.fields['Lan'] = locationValues.location_latitude.toString();
      upload.fields['Log'] = locationValues.location_longitude.toString();
      upload.fields['user'] = '';
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';

      final stream = await upload.send();
      var update_vendor_location_res = await http.Response.fromStream(stream);
      var body = jsonDecode(update_vendor_location_res.body);
      if (update_vendor_location_res.statusCode == 200 ||
          update_vendor_location_res.statusCode == 201) {
        return print('Location Updated');
      } else {
        print(update_vendor_location_res.body);
      }
      return update_vendor_location_res;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> login_before_submit_location_user(
      {email, password, context}) async {
    var locationValues = Provider.of<LocationService>(context, listen: false);

    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://app.foodtruck.express/foodtruck/token/login/'));
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
          Uri.parse('http://app.foodtruck.express/foodtruck/userlanlog/'));
      upload_loc.fields['Lan'] = locationValues.location_latitude.toString();
      upload_loc.fields['Log'] = locationValues.location_longitude.toString();
      upload_loc.fields['online'] = 'True';
      upload_loc.fields['user'] = '';
      upload_loc.headers['authorization'] =
          'Token ${location_token_user['auth_token']}';
      final stream_loc = await upload_loc.send();
      var response_loc = await http.Response.fromStream(stream_loc);
      return print(response_loc.body);
    } catch (e) {
      print(e);
    }
  }

  Future Signup_VendorApi(
      {username, password, email, re_password, context}) async {
    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://wingu1000.pythonanywhere.com/foodtruck-vendor/users/'));
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
          'POST', Uri.parse('http://app.foodtruck.express/foodtruck/users/'));
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
                        padding: const EdgeInsets.all(5.0) ,
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
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      vendor_login_res = await http.Response.fromStream(stream);
       token = json.decode(vendor_login_res.body);
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
          Uri.parse('http://app.foodtruck.express/foodtruck/token/login/'));
      upload.fields['password'] = password.toString();
      upload.fields['email'] = email.toString();
      final stream = await upload.send();
      user_login_res = await http.Response.fromStream(stream);
       token = json.decode(user_login_res.body);
      print(token["auth_token"]);
      print(user_login_res.statusCode.toString());
      if (user_login_res.statusCode == 200 ||
          user_login_res.statusCode == 201) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Map_vendor();
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
          Uri.parse('http://wingu1000.pythonanywhere.com/foodtruck-vendor/menu/${id}/'));
      upload.fields['menu_description'] = menu_description.toString();
      upload.fields['menu_title'] = menu_title.toString();
      upload.fields['menu_price'] = menu_price;
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';
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
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/profile/${id}/'));
      upload.fields['phone'] = phone.toString();
      upload.fields['business_name'] = business_name.toString();
      upload.fields['unique_detail'] = unique_detail;
      upload.fields['detail'] = detail;
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';
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
        Login_SetState_third();
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
        Login_SetState_third();
      } else if (update_profile_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState_third();
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
          Uri.parse('http://wingu1000.pythonanywhere.com/foodtruck-vendor/menu/'));
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
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';
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
          Uri.parse('http://wingu1000.pythonanywhere.com/foodtruck-vendor/menu/${id}/'));
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';
      final stream = await upload.send();
      var update_menu_res = await http.Response.fromStream(stream);
      var body = json.decode(update_menu_res.body);
      if (update_menu_res.statusCode == 200 ||
          update_menu_res.statusCode == 201 ||
          update_menu_res.statusCode == 204) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return VendorMenuPage();
        }));
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
      print(e);
    }
  }

  Future Update_Profile_Pic({id, context, pro_pic = ''}) async {
    try {
      var upload = http.MultipartRequest(
          'PUT',
          Uri.parse(
              'http://wingu1000.pythonanywhere.com/foodtruck-vendor/profile/${id}/'));
      var file = await http.MultipartFile.fromPath('pro_pic', pro_pic);
      upload.files.add(file);
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';
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
          Uri.parse('http://wingu1000.pythonanywhere.com/foodtruck-vendor/menu/${id}/'));
      var file = await http.MultipartFile.fromPath('menu_picture1', image1);
      var file2 = await http.MultipartFile.fromPath('menu_picture2', image2);
      var file3 = await http.MultipartFile.fromPath('menu_picture3', image3);
      upload.files.add(file);
      upload.files.add(file2);
      upload.files.add(file3);
      upload.fields['lanlog'] = '';
      upload.fields['user'] = '';
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';
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


Future PostRating(
      {context,
      rate,
      lanlog,
      scaffoldKey
      }) async {
    try {
      var upload = http.MultipartRequest('POST',
          Uri.parse('http://http://wingu1000.pythonanywhere.com/foodtruck-vendor/rating/'));
      upload.fields['rate'] = rate.toString();
      upload.fields['lanlog'] = lanlog.toString();
      upload.headers['authorization'] =
           'Token ${token['auth_token']}';
      final stream = await upload.send();
      var upload_rate_res = await http.Response.fromStream(stream);
      var body = json.decode(upload_rate_res.body);
      print(upload_rate_res.body.toString());
      if (upload_rate_res.statusCode == 200 ||
          upload_rate_res.statusCode == 201) {
                  Login_SetState_third();
        scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: new Text(
          'You Have Rated this Vendor',
          textAlign: TextAlign.center,
        )));
 
      } else if (upload_rate_res.statusCode == 400 ||
          upload_rate_res.statusCode == 500 ||
          upload_rate_res.statusCode == 405) {
        showDialog(
            child: AlertDialog(
              content: Text('process unable to finish',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState();
      } else if (upload_rate_res.statusCode == 404) {
        showDialog(
            child: AlertDialog(
              content: Text('no response! try again',
                  style: TextStyle(color: Colors.blue)),
            ),
            context: context);
        Login_SetState_third();
      }}catch(e){
         Login_SetState_third();
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
      }}}