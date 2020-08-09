import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VendorProfileedit.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:foodtruckexpressxd/Model/vendorprofile.dart';
import 'package:foodtruckexpressxd/screens/VendorView/VendorMenuPage.dart';
import 'package:provider/provider.dart';

class VENDORprofile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VENDORprofilestate();
  }
}

class VENDORprofilestate extends State<VENDORprofile> {
  var online_offline_value = true;

  @override
  Widget build(BuildContext context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: FutureBuilder(
        future: webservices.Vendor_Profile_Api(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data[0].id);
            return SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Stack(
//                  alignment: Alignment.center,
                  children: <Widget>[
                    // Adobe XD layer: 'background' (shape)
                    Container(
                      height: 191.0,
                      decoration: BoxDecoration(
                        color: Color(0xff2699fb),
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
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ))),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          child: Padding(
                        padding: EdgeInsets.only(top: 90.0, left: 8, right: 8),
                        child: Text(
                          snapshot.data[0].unique_detail,
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
                            snapshot.data[0].business_name,
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: 30,
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
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        FutureBuilder(
                            future: webservices.get_current_vendor_location(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Switch(
                                  value: snapshot.data[0].online,
                                  onChanged: (value) {
                                    setState(() {
                                      if (snapshot.data[0].online == true) {
                                        webservices
                                            .Update_Vendor_to_Online_Offline(
                                          context: context,
                                          lan: snapshot.data[0].Lan,
                                          log: snapshot.data[0].Log,
                                          online_offline: false,
                                          id: snapshot.data[0].id,
                                          online_offline_value: 'offline',
                                          color_value: Colors.red,
                                        );
                                        webservices.Login_SetState();
                                      } else {
                                        webservices
                                            .Update_Vendor_to_Online_Offline(
                                          context: context,
                                          lan: snapshot.data[0].Lan,
                                          log: snapshot.data[0].Log,
                                          online_offline: true,
                                          id: snapshot.data[0].id,
                                          online_offline_value: 'online',
                                          color_value: Colors.lightGreen,
                                        );
                                        webservices.Login_SetState();
                                      }
                                    });
                                  },
                                );
                              }
                              return Text('Loading');
                            }),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(snapshot.data[0].pro_pic),
                            radius: 35,
                            child: Text(''),
                          ),
                          RaisedButton(
                            color: Color(0xff2699fb),
                            child: Text(
                              'Change Picture',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              return Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return VENDORprofileEdith(
                                      snapshot_profile_data: snapshot.data[0],
                                    );
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      Container(
                        child: VerticalDivider(),
                        height: 50,
                      ),
                      Flexible(
                        child: Text(
                          'Phone Num:' + snapshot.data[0].phone,
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Flexible(
                    child: Text(
                      snapshot.data[0].detail,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      trailing: Icon(Icons.description),
                      title: Text(
                        'Edit Your Profile Details',
                        style: TextStyle(color: Colors.black54),
                      ),
                      onTap: () {
                        return Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return VENDORprofileEdith(
                                snapshot_profile_data: snapshot.data[0],
                              );
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    trailing: Icon(Icons.fastfood),
                    title: Text(
                      'My Menus',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onTap: () {
                      return Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return VendorMenuPage(
                              snapshot_profile_data: snapshot.data[0],
                            );
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ));
          } else if (snapshot.hasError) {
            print('error');
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
