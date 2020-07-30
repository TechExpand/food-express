import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VENDORPAGE.dart';


class menuitemdetail extends StatelessWidget {
var menu_description;
var menu_price;
var menu_title;
var menu_picture1;
menuitemdetail({this.menu_description, this.menu_title, this.menu_price, this.menu_picture1});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Menu Item'),
          leading: InkWell(
              onTap: () {
                return Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white)),
        ),
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(menu_picture1.toString()),
                      fit: BoxFit.fill,
                    ),
                  ),
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
                      fontFamily: 'Georgia',
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
              RaisedButton(
                color: Colors.lightBlue,
                child: Text('Contact Vendor', style: TextStyle(color: Colors.white),),
                onPressed: (){
                return null;
              },),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'June 2, 2017',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14,
                    color: const Color(0xff2699fb),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
