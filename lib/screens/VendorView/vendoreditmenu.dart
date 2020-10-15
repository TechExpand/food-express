import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class vendoreditmenu extends StatefulWidget {
  var snapshot_data;
  var snapshot_profile_data;

  vendoreditmenu({
    this.snapshot_data,
    this.snapshot_profile_data,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return vendoreditmenustate();
  }
}

class vendoreditmenustate extends State<vendoreditmenu> {
  final _formkey = GlobalKey<FormState>();
  var menu_description;
  var menu_title;
  var menu_price;

  @override
  Widget build(BuildContext context) {
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
                        // Adobe XD layer: 'background' (shape)
                        Container(
                          height: 191.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/foodtruck-bg.jpg')
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:  Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width / 8,
                                  left: MediaQuery.of(context).size.width / 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
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
                                  'EDIT ITEMS',
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
                          initialValue: widget.snapshot_data.menu_title,
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
                                  fontWeight: FontWeight.bold),
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
                          initialValue: widget.snapshot_data.menu_description,
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
                                  fontWeight: FontWeight.bold),
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
                          initialValue: widget.snapshot_data.menu_price.toString(),
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
                                  fontWeight: FontWeight.bold),
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
                    webservices_consumer.login_state == false
                        ? RaisedButton(
                      onPressed: () {
                        if(_formkey.currentState.validate())
                          webservices_consumer.Login_SetState();
                        webservices_consumer.Update_Menu_Details(
                          menu_description: menu_description,
                          menu_price: menu_price,
                          menu_title: menu_title,
                          context: context,
                          id: widget.snapshot_data.id,
                        );
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
                            "Update Menu Details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    )
                        : CircularProgressIndicator(),
                    Divider(),
                    Text('Change Product Images'),
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
                                "Select First Image",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                ),
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
                                "Select Second Image",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                ),
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
                          ?Center(
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
                                "Select Third Image",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    webservices_consumer.login_state_second == false
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () {
                          try{
                          webservices_consumer.Login_SetState_Second();
                          webservices_consumer.Update_Menu_Images(
                            image1: utils_consumer.selected_menu_image1.path,
                            image2: utils_consumer.selected_menu_image2.path,
                            image3: utils_consumer.selected_menu_image3.path,
                            context: context,
                            id: widget.snapshot_data.id,
                          );
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
                              "Update menu Images",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
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
