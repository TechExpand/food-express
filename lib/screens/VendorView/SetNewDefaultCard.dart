import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtruck/screens/VendorView/VENDORprofile.dart';
import 'package:foodtruck/Services/admob.dart';

import 'package:provider/provider.dart';

class vendoraddcard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return vendoraddmenustate();
  }
}

class vendoraddmenustate extends State<vendoraddcard> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  var exp_month;
  var card_number;
  var exp_year;
  var cvc;

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
                          'SET NEW DAFAULT CARD',
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
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Card Number Required';
                        } else {
                          card_number = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Card Number',
                          hintText: 'e.g 12345678910',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            Icons.credit_card,
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
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'expiring month is Required';
                        } else {
                          exp_month = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Expiring Month',
                          hintText: 'e.g 3',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            Icons.date_range,
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
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'expiring year is Required';
                        } else {
                          exp_year = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Expiring Year',
                          hintText: 'e.g 2021',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            Icons.date_range,
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
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'cvc is Required';
                        } else {
                          cvc = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'CVC',
                          hintText: 'e.g 000',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          icon: Icon(
                            FontAwesomeIcons.creditCard,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ),
                Divider(),
                webservices_consumer.login_state == false
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              webservices_consumer.Login_SetState();
                              webservices_consumer.Set_Default_Payment_Card(
                                card_number: card_number,
                                exp_year: exp_year,
                                exp_month: exp_month,
                                context: context,
                                cvc: cvc,
                              ).then((value) => showDialog(
                                  child: AlertDialog(
                                    title: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Text(value,
                                              style: TextStyle(
                                                  fontSize: 14)),
                                          InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return VENDORprofile();
                                                }));
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('GO TO PROFILE',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors
                                                            .lightBlueAccent)),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  context: context));
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
          "Set Card As Default",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
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
