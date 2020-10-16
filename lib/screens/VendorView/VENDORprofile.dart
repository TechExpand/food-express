import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/screens/VendorView/ManageVendorSubScription.dart';
import 'package:foodtruck/screens/VendorView/SetNewDefaultCard.dart';
import 'package:foodtruck/screens/VendorView/VendorProfileedit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtruck/screens/VendorView/VendorMenuPage.dart';
import 'package:foodtruck/Services/admob.dart';
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
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
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
      key: scaffoldKey,
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
                              fontFamily: 'Arial',
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
                                    
                                      if (snapshot.data[0].online == true) {
                                        webservices
                                            .Update_Vendor_to_Online_Offline(
                                          scaffoldKey: scaffoldKey,
                                          context: context,
                                          lan: snapshot.data[0].Lan,
                                          log: snapshot.data[0].Log,
                                          online_offline: false,
                                          id: snapshot.data[0].id,
                                          online_offline_value: 'offline',
                                          color_value: Colors.red,
                                        ).then((value) => setState((){}));
                                        webservices.Login_SetState();
                                      } else {
                                        webservices
                                            .Update_Vendor_to_Online_Offline(
                                          scaffoldKey: scaffoldKey,
                                          context: context,
                                          lan: snapshot.data[0].Lan,
                                          log: snapshot.data[0].Log,
                                          online_offline: true,
                                          id: snapshot.data[0].id,
                                          online_offline_value: 'online',
                                          color_value: Colors.lightGreen,
                                        ).then((value) => setState((){}));
                                        webservices.Login_SetState();
                                      }
                                   
                                  },
                                );
                              }
                              return Text('Loading');
                            }),
                            Text('ONLINE/OFFLINE',  style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                               color: Colors.black54,
                              height: 1,
                            ),
                           )
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
                          Padding(
                            padding: const EdgeInsets.only(top:8.0, bottom: 8.0,right: 8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  NetworkImage(snapshot.data[0].pro_pic),
                              radius: 35,
                              child: Text(''),
                            ),
                          ),
                          Center(
      child: RaisedButton(
          color: Color(0xff67b9fb),
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
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Change Picture",
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
                      Container(
                        child: VerticalDivider(),
                        height: 50,
                      ),
                      Flexible(
                        child: Text(
                          'Tel:' + snapshot.data[0].phone,
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1,
                          ),
                          
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
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        trailing: Icon(Icons.description, color: Colors.black87),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        trailing:
                            Icon(Icons.fastfood, color: Colors.orangeAccent),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        trailing: Icon(
                          FontAwesomeIcons.cloudversify,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          'Manage Subscription Plan',
                          style: TextStyle(color: Colors.black54),
                        ),
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return managesubscription();
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        trailing: Icon(
                          FontAwesomeIcons.ccVisa,
                         color: Color(0xFF67b9fb),
                        ),
                        title: Text(
                          'Set New Payment Card',
                          style: TextStyle(color: Colors.black54),
                        ),
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return vendoraddcard();
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
