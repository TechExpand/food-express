import 'dart:async';
import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/provider_util.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/screens/Login_SignupView/login.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodtruck/screens/SPLASH.dart';
import 'package:foodtruck/screens/VendorView/VENDORSIGNUP_INFO.dart';
import 'package:provider/provider.dart';
import 'package:statusbar/statusbar.dart';

void main() {
  String getAppId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-7014950727779735~4209024008';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-7014950727779735~4209024008';
    }
    return null;
  }


  Provider.debugCheckInvalidValueType = null;
  Admob.initialize(getAppId());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocationService>(
        create: (context) => LocationService(),
      ),
      ChangeNotifierProvider<SetState>(
        create: (context) => SetState(),
      ),
      ChangeNotifierProvider<WebServices>(
        create: (context) => WebServices(),
      ),
      ChangeNotifierProvider<Utils>(
        create: (context) => Utils(),
      ),
       ChangeNotifierProvider<AdmobService>(
        create: (context) => AdmobService(),
      ),
    ],
    child: StartApp(),
  ));
  
}

class StartApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartAppState();
  }
}


class StartAppState extends State<StartApp> {
  @override
  void initState() {
       super.initState();
    StatusBar.color(Colors.blue);
    Provider.of<LocationService>(context, listen: false).getCurrentLocation();
    //Get current location every 5 minutes.
    Timer.periodic(Duration(minutes: 5), (timer) {
      Provider.of<LocationService>(context, listen: false).getCurrentLocation();
    });



     //Admob Advert Code

      Provider.of<AdmobService>(context, listen: false).instatitialAd = AdmobInterstitial(
      adUnitId: 'ca-app-pub-7014950727779735/7173204476',
      listener: (AdmobAdEvent event, Map<String, dynamic> args){
        if(event == AdmobAdEvent.closed){
          Provider.of<AdmobService>(context, listen: false).instatitialAd.load();
        }

    },
    ); 
  Provider.of<AdmobService>(context, listen: false).instatitialAd.load();
  
//Show instatitialAds every 5 minutes.
   Timer.periodic(Duration(minutes: 4), (timer) {
      Provider.of<AdmobService>(context, listen: false).instatitialAd.show();
    });
  }


@override
void dispose(){
  super.dispose();
  Provider.of<AdmobService>(context, listen: false).instatitialAd.dispose();
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SPLASH();
  }
}
