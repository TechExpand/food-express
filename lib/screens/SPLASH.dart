import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:foodtruckexpressxd/main.dart';

class SPLASH extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SPLASHSTATE();
  }
}

class SPLASHSTATE extends State<SPLASH> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3), go_to_home);
  }

  go_to_home(){
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return VENDORSIGNUP11();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: 262.0,
                height: 118.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/logotruck.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 49),
              child: Text(
                'get it at your comfort zone...',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.lightBlue),
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            )
          ],
        ),
      ),
    );
  }
}
