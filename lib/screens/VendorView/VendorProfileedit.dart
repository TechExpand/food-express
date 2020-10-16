import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class VENDORprofileEdith extends StatefulWidget {
  var snapshot_profile_data;

  VENDORprofileEdith({
    this.snapshot_profile_data,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VENDORprofileEdithstate();
  }
}

class VENDORprofileEdithstate extends State<VENDORprofileEdith> {
  var phone;
  var business_name;
  var unique_detail;
  var detail;

  final _formkey = GlobalKey<FormState>();

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
        body: SingleChildScrollView(
            child: Consumer2<WebServices, Utils>(
                builder: (context, webservices_consumer, utils_consumer,
                        child) =>
                    Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          Stack(
//                  alignment: Alignment.center,
                            children: <Widget>[
                              // Adobe XD layer: 'background' (shape)
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200.0,
                                child: Image.asset('assets/images/foodtruck-bg.jpg', fit: BoxFit.fill,),
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
                                  padding: EdgeInsets.only(
                                      top: 90.0, left: 8, right: 8),
                                  child: Text(
                                    'EDIT PROFILE',
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
                          Divider(),
                          Container(
                            width: 150,
                            height: 150,
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
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    utils_consumer.selectimage1();
                                  },
                                  child: Text(
                                    'Select Profile Picture',
                                    style: TextStyle(
                                       color: Color(0xFF67b9fb),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                          webservices_consumer.login_state_second == false
                              ? RaisedButton(
                              onPressed: () {
                                try{
                                    webservices_consumer.Login_SetState_Second();
                                webservices_consumer.Update_Profile_Pic(
                                  pro_pic: utils_consumer.selected_menu_image1.path,
                                  context: context,
                                  id: widget.snapshot_profile_data.id,
                                ).then((value) => setState((){}));
                                }
                                catch(e){
                           webservices_consumer.Login_SetState_Second();
                          showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('There was a Problem Encountered', style: TextStyle(color: Colors.blue)),
            ),
            content: Container(
              margin:EdgeInsets.only(left:20),
              child: Text('An Image is Required')),
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
          "Update Profile Profile",
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
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 480,
                              child: TextFormField(
                                initialValue:
                                    widget.snapshot_profile_data.phone,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Phone is Required';
                                  } else {
                                    phone = value;
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    labelText: 'Phone',
                                    labelStyle: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                    icon: Icon(
                                      Icons.title,
                                      color: Colors.black87,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 480,
                              child: TextFormField(
                                initialValue:
                                    widget.snapshot_profile_data.business_name,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Business Name is Required';
                                  } else {
                                    business_name = value;
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    labelText: 'Business Name',
                                    labelStyle: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                    icon: Icon(
                                      Icons.title,
                                      color: Colors.black87,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 480,
                              child: TextFormField(
                                initialValue:
                                    widget.snapshot_profile_data.unique_detail,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Unique Detail is Required';
                                  } else {
                                    unique_detail = value;
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    labelText: 'Unique Detail',
                                    labelStyle: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                    icon: Icon(
                                      Icons.title,
                                      color: Colors.black87,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 480,
                              child: TextFormField(
                                initialValue:
                                    widget.snapshot_profile_data.detail,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Detail is Required';
                                  } else {
                                    detail = value;
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    labelText: 'Detail',
                                    labelStyle: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                    icon: Icon(
                                      Icons.title,
                                      color: Colors.black87,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                          ),
                          Divider(),
                          webservices_consumer.login_state_second == false
                              ? RaisedButton(
                                  onPressed: () {
                                    try{
                        if (_formkey.currentState.validate())
                                      webservices_consumer.Login_SetState_Second();
                                    webservices_consumer.Update_Profile_Details(
                                      phone: phone,
                                      business_name: business_name,
                                      unique_detail: unique_detail,
                                      detail: detail,
                                      context: context,
                                      id: widget.snapshot_profile_data.id,
                                    );
                                    }
                                    catch(e){
                           webservices_consumer.Login_SetState_Second();
                          showDialog(
          child: AlertDialog(
            title: Center(
              child:
                  Text('There was a Problem Encountered', style: TextStyle(color: Colors.blue)),
            ),
            content: Container(
              margin:EdgeInsets.only(left:20),
              child: Text('All Images and Fields Are Required')),
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
                        ],
                      ),
                    ))));
  }
}
