import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class managesubscription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return managesubscriptionstate();
  }
}

class managesubscriptionstate extends State<managesubscription> {
  final _formkey = GlobalKey<FormState>();
  var menu_description;
  var menu_title;
  var menu_price;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
        key: scaffoldKey,
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
                          'Manage Subscription',
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
                SizedBox(
                  height: 100,
                ),
                FutureBuilder(
                    future: webservices_consumer.get_vender_subscription_id(),
                    builder: (context, subscription_id_snapshot) {
                      return subscription_id_snapshot.hasData
                          ? FutureBuilder(
                              future: webservices_consumer
                                  .get_vender_subscription_status(
                                      subscription_id_snapshot
                                          .data['subscription_id']),
                              builder: (context, subscription_status_snapshot) {
                                return subscription_status_snapshot.hasData
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          elevation: 4,
                                          child: Column(
                                            children: <Widget>[
                                              Builder(builder: (context) {
                                                if (subscription_status_snapshot
                                                        .data ==
                                                    'active' || subscription_status_snapshot
                                                    .data ==
                                                    'trialing') {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                            'Your Subscription is ${subscription_status_snapshot.data}'),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15.0),
                                                          child: Text(
                                                            'Cancel Subscription',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: webservices_consumer
                                                                      .login_state ==
                                                                  false
                                                              ? RaisedButton(
                                                                  onPressed:
                                                                      () {
                                                                    webservices_consumer
                                                                        .Login_SetState();
                                                                    webservices_consumer
                                                                        .cancel_subscription()
                                                                        .then((value) => scaffoldKey
                                                                            .currentState
                                                                            .showSnackBar(new SnackBar(content: new Text(value))));
                                                                  },
                                                                  color: Colors
                                                                      .blue,
                                                                 
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
          "cancel!",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
                                                                )
                                                              : CircularProgressIndicator(),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                } else if (subscription_status_snapshot
                                                            .data ==
                                                        'canceled' ||
                                                    subscription_status_snapshot
                                                            .data ==
                                                        'pending' ||
                                                    subscription_status_snapshot
                                                            .data ==
                                                        'incomplete') {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                            'Your Subscription is ${subscription_status_snapshot.data}'),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15.0),
                                                          child: Text(
                                                            'Renew Subscription',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: webservices_consumer
                                                                      .login_state ==
                                                                  false
                                                              ? RaisedButton(
                                                                  onPressed:
                                                                      () {
                                                                    webservices_consumer
                                                                        .Login_SetState();
                                                                    webservices_consumer
                                                                        .reactivate_subscription()
                                                                        .then((value) => scaffoldKey
                                                                            .currentState
                                                                            .showSnackBar(new SnackBar(content: new Text(value))));
                                                                  },
                                                                  color: Colors
                                                                      .blue,
                                                                  
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
          "Subscribe",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
                                                                )
                                                              : Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return  Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: CircularProgressIndicator(),
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(),
                                      );
                                ;
                              },
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            );
                    }),
              ],
            ),
          );
        })));
  }
}
