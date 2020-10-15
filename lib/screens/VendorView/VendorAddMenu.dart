import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class vendoraddmenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return vendoraddmenustate();
  }
}

class vendoraddmenustate extends State<vendoraddmenu> {
  final _formkey = GlobalKey<FormState>();
  var menu_description;
  var menu_title;
  var menu_price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            color: Colors.white,
            child: AdmobBanner(
              adUnitId: Provider.of<AdmobService>(context, listen: false)
                  .getBannerAdUnitId(),
              adSize: AdmobBannerSize.BANNER,
              listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
            )),
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(child: Consumer2<WebServices, Utils>(
            builder: (context, webservices_consumer, utils_consumer, child) {
          return Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Stack(
//                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: Image.asset(
                        'assets/images/foodtruck-bg.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 8,
                              left: MediaQuery.of(context).size.width / 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black38,
                              ),
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          child: Padding(
                        padding: EdgeInsets.only(top: 90.0, left: 8, right: 8),
                        child: Text(
                          'ADD MENU',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14,
                            color: const Color(0xffffffff),
                            height: 1.7142857142857142,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: SizedBox(
                          height: 45.0,
                          child: Text(
                            'FOODTRUCK.EXPRESS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: const Color(0xffffffff),
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Menu title is Required';
                        } else {
                          menu_title = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Menu Title',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            Icons.title,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Menu Description is Required';
                        } else {
                          menu_description = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Menu Description',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            Icons.title,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Menu Price is Required';
                        } else {
                          menu_price = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Menu Price',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            Icons.title,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  width: 170,
                  height: 170,
                  child: utils_consumer.selected_menu_image1 == null
                      ? Center(
                          child: Text('No Image Selected'),
                        )
                      : Image.file(
                          utils_consumer.selected_menu_image1,
                          fit: BoxFit.contain,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        utils_consumer.selectimage1();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff67b9fb), Color(0xff8acbff)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Select First Image",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  width: 170,
                  height: 170,
                  child: utils_consumer.selected_menu_image2 == null
                      ? Center(
                          child: Text('No Image Selected'),
                        )
                      : Image.file(
                          utils_consumer.selected_menu_image2,
                          fit: BoxFit.contain,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        return utils_consumer.selectimage2();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff67b9fb), Color(0xff8acbff)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Select Second Image",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  width: 170,
                  height: 170,
                  child: utils_consumer.selected_menu_image3 == null
                      ? Center(
                          child: Text('No Image Selected'),
                        )
                      : Image.file(utils_consumer.selected_menu_image3),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        return utils_consumer.selectimage3();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff67b9fb), Color(0xff8acbff)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Select Third Image",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(),
                webservices_consumer.login_state == false
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            try{
                             if (_formkey.currentState.validate()) {
                              webservices_consumer.Login_SetState();
                              webservices_consumer.Add_Menu(
                                menu_title: menu_title,
                                menu_price: int.parse(menu_price),
                                menu_description: menu_description,
                                image1:
                                    utils_consumer.selected_menu_image1.path,
                                image2:
                                    utils_consumer.selected_menu_image2.path,
                                image3:
                                    utils_consumer.selected_menu_image3.path,
                                context: context,
                              );
                             
                            }
                            }catch(e){
                      webservices_consumer.Login_SetState();
      showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('There was a Problem Encountered', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('All Images and Fields Are Required'),
          ),
          context: context);
                            }
                          
                            
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff67b9fb),
                                    Color(0xff8acbff)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 200.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Add menu",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          color: Color(0xFF67b9fb),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          );
        })));
  }
}
