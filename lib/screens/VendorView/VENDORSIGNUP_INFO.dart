import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:adobe_xd/specific_rect_clip.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/screens/UserView/Map_user.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:provider/provider.dart';

class VENDORSIGNUP22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: VENDORSIGNUP2(),
    );
  }
}

class VENDORSIGNUP2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VENDORSIGNUP2STATE();
  }
}

class VENDORSIGNUP2STATE extends State<VENDORSIGNUP2> {
  var business_name;
  var unique_detail;
  var exp_month;
  var card_number;
  var phone;
  var exp_year;
  var cvc;
  var detail;
  var pro_pic;
  final form_key = GlobalKey<FormState>();
  final VoidCallback continueButton;

  VENDORSIGNUP2STATE({
    Key key,
    this.continueButton,
  });

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
      appBar: AppBar(
        actions: <Widget>[
         Image.asset('assets/images/truckIcon.png', width: 100,),
         SizedBox(width: 8,)
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'FOODTRUCK.EXPRESS',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.visible,
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Form(
        key: form_key,
        child: SingleChildScrollView(
          child: Flexible(
            flex: 20,
            child: Consumer2<Utils, WebServices>(
              builder: (context, utils_consumer, webservices_consumer, child) =>
                  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 14),
                    child: Container(
                      width: 150,
                        height: 100,
                        child: Image.asset('assets/images/logotruck.png')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 8, bottom: 10),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Business Name Required';
                          } else {
                            business_name = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: 'Business Name',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 8, bottom: 10),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Unique Detail Required';
                          } else {
                            unique_detail = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: 'Why Are you Unique',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 8, bottom: 10),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Details Required';
                          } else {
                            detail = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: 'Details',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 8, bottom: 10),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        keyboardType:TextInputType.phone ,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Phone Required';
                          } else {
                            phone = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      
                      child: RaisedButton(
                        onPressed: () {
                          return utils_consumer.selectimage();
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
          "Business Image",
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
                  Container(
                    width: 170,
                    height: 170,
                    child: utils_consumer.selected_image == null
                        ? Center(child: Text('No Image Selected'))
                        : Image.file(utils_consumer.selected_image),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Card Details', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Divider(),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: webservices_consumer.login_state == false
                        ?RaisedButton(
                      onPressed: () {
                if (form_key.currentState.validate()) {
                  webservices_consumer.Login_SetState();
                        webservices_consumer.Vendor_InfoApi(
                          context:context,
                          business_name: business_name,
                          unique_detail: unique_detail,
                          detail:detail,
                          phone:phone,
                          path: utils_consumer.selected_image.path,
                          exp_month: exp_month,
                          exp_year: exp_year,
                          cvc: cvc,
                          number: card_number,
                        );
                      }},

                    color: Color(0xFF67b9fb),
                     
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
          "Continue",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
                    ):CircularProgressIndicator()
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
