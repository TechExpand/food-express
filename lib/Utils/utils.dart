import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Utils with ChangeNotifier{

  File selected_image;
  File selected_menu_image1;
  File selected_menu_image2;
  File selected_menu_image3;

  Future selectimage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    selected_image = image;
      notifyListeners();
  }




  Future selectimage1() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    selected_menu_image1 = image;
    notifyListeners();
  }



  Future selectimage2() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    selected_menu_image2 = image;
    notifyListeners();
  }



  Future selectimage3() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    selected_menu_image3 = image;
    notifyListeners();
  }


  Future makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}