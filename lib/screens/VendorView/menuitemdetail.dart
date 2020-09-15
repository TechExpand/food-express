import 'package:admob_flutter/admob_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:provider/provider.dart';


class menuitemdetail extends StatelessWidget {
var menu_description;
var vendor_phone;
var menu_price;
var menu_title;
var menu_picture1;
var menu_picture2;
var menu_picture3;
menuitemdetail({this.menu_description, this.menu_title, this.menu_price, this.menu_picture1,  this.menu_picture2, this.menu_picture3, this.vendor_phone});
  @override
  Widget build(BuildContext context) {
    var utils = Provider.of<Utils>(context, listen: false);
    return Scaffold(
      bottomNavigationBar:  Container(
                    color: Colors.white,
                    child: AdmobBanner(
                      adUnitId: Provider.of<AdmobService>(context, listen: false).getBannerAdUnitId(),
                      adSize: AdmobBannerSize.BANNER,
                      listener: (AdmobAdEvent event, Map<String, dynamic> args){

                      },
                    )
                  ),
        appBar: AppBar(
          actions: <Widget>[
         Image.asset('assets/images/truckIcon.png', width: 100,),
         SizedBox(width: 8,)
        ],
        backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Menu Item', style: TextStyle(color: Colors.black), overflow: TextOverflow.visible,),
          leading: InkWell(
              onTap: () {
                return Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.black)),
        ),
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Carousel(
                  dotSize: 5,
                  images: [
                    NetworkImage(menu_picture1.toString()),
                    NetworkImage(menu_picture2.toString()),
                    NetworkImage(menu_picture3.toString()),
                  ],
                ),
                  height: 200.0,
                ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${menu_title.toString()}',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      color: const Color(0xff2699fb),
                      fontWeight: FontWeight.w700,
                      height: 1.7142857142857142,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Menu Details',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: const Color(0xff2699fb),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '${menu_price.toString()}\$',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: const Color(0xff2699fb),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                  child: Text(
                    '${menu_description.toString()}',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      color: const Color(0xff2699fb),
                      height: 1.7142857142857142,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: (){
                  return utils.makePhoneCall('tel:$vendor_phone');
                },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff67b9fb), Color(0xff8acbff)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          "Contact Vendor",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
