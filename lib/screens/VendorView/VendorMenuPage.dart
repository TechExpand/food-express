import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/screens/VendorView/VendorAddMenu.dart';
import 'package:foodtruck/screens/VendorView/vendoreditmenu.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';

class VendorMenuPage extends StatefulWidget {
  var snapshot_profile_data;

  VendorMenuPage({this.snapshot_profile_data});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VendorMenuPageState();
  }
}

class VendorMenuPageState extends State<VendorMenuPage> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            color: Colors.white,
            child: AdmobBanner(
              adUnitId: Provider.of<AdmobService>(context, listen: false).getBannerAdUnitId(),
              adSize: AdmobBannerSize.BANNER,
              listener: (AdmobAdEvent event, Map<String, dynamic> args){

              },
            )
        ),
        backgroundColor: Colors.white,
        body: Column(
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
                          'MENU ITEMS',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add Menu Item ',
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff2699fc)),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return vendoraddmenu();
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
                    child: CircleAvatar(
                      radius: 22,
                      child: Icon(Icons.add),
                    ),
                  ),
                )
              ],
            ),
            Divider(),
            Expanded(
              child: Menu_Items_Widget(),
            )
          ],
        ));
  }

  Widget Menu_Items_Widget() {
    var webservices = Provider.of<WebServices>(context, listen: false);
    return FutureBuilder(
        future: webservices.Vendor_Profile_Menu(),
        builder: (context, snapshot) {
          return GridView.builder(
            controller: scrollController,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 1,
            ),
            itemCount: snapshot.data == null
                ? 0
                : snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data[index].menu_picture1),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 50,
                          width: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data[index].menu_title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25.0, top: 8),
                                  child: Icon(
                                    Icons.edit,
                                    color: Color(0xFF67b9fb),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return vendoreditmenu(
                                          snapshot_data: snapshot.data[index],
                                          snapshot_profile_data: widget
                                              .snapshot_profile_data,
                                        );
                                      },
                                      transitionsBuilder: (context,
                                          animation,
                                          secondaryAnimation,
                                          child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                    width: 1.5,
                                    height: 15,
                                    color: Colors.black54),
                              ),
                              InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, top: 8),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                onTap: () {
                                  return showDialog(
                                      child: AlertDialog(
                                        content: Container(
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Are You Sure You Want to Delete?',
                                                style: TextStyle(
                                                  color: Color(0xFF67b9fb),),
                                                textAlign:
                                                TextAlign.center,
                                              ),
                                              ButtonBar(
                                                alignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: <Widget>[
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons.clear,
                                                        color: Colors
                                                            .black54,
                                                        size: 30,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context);
                                                      }),
                                                  SizedBox(width:50),
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons.check,
                                                        color: Colors.red,
                                                        size: 30,
                                                      ),
                                                      onPressed: () {
                                                        webservices
                                                            .Login_SetState();
                                                        webservices.Delete_Menu(
                                                            context: context,
                                                            id: snapshot.data[
                                                            index].id);
                                                      }),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(
                                                    8.0),
                                                child: webservices
                                                    .login_state ==
                                                    false
                                                    ? Text('')
                                                    : CircularProgressIndicator(),
                                              ),
                                            ],
                                          ),
                                          height: 140,
                                        ),
                                      ),
                                      context: context);
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          width: 100,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
