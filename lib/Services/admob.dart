
import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';


class AdmobService with ChangeNotifier{
 AdmobBannerSize bannerSize;
 AdmobInterstitial instatitialAd;

 String getBannerAdUnitId(){
    if (Platform.isIOS) {
      return 'ca-app-pub-7014950727779735/1895164932';
    } else if (Platform.isAndroid){
      return 'ca-app-pub-7014950727779735/1895164932';
    }
    return null;
  }



   String getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-7014950727779735/7173204476';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-7014950727779735/7173204476';
    }
    return null;
  }
}

