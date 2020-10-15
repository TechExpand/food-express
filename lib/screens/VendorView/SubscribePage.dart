import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:provider/provider.dart';



class SubscribePage extends StatefulWidget {
  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  final form_key = GlobalKey<FormState>();
  var cvc;
  var card_number;
  var expiry_month;
  var expiry_year;

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
                            right: MediaQuery.of(context).size.width / 8, bottom: 15),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            keyboardType:TextInputType.phone ,
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
                                hintText: '12345678910',
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
                            right: MediaQuery.of(context).size.width / 8, bottom: 15),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            keyboardType:TextInputType.phone ,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Expiry Month Required';
                              } else {
                                expiry_month = value;
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: '10',
                                labelText: 'Expiry Month',
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
                            right: MediaQuery.of(context).size.width / 8,  bottom: 15),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            keyboardType:TextInputType.phone ,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Expiry Year Required';
                              } else {
                                expiry_year = value;
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                labelText: 'Expire Year',
                                hintText: '2030',
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
                            right: MediaQuery.of(context).size.width / 8,  bottom: 15),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            keyboardType:TextInputType.phone ,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'CVC Required';
                              } else {
                                cvc = value;
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                labelText: 'CVC',
                                hintText: '345',
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
                          padding: const EdgeInsets.all(8.0),
                          child: webservices_consumer.login_state == false
                              ?RaisedButton(
                            onPressed: () {
                              if (form_key.currentState.validate()) {
                                webservices_consumer.Login_SetState();
                                webservices_consumer.Vendor_Subscribe(
                                  context:context,
                                  card_number: card_number,
                                  expiry_month: expiry_month,
                                  expiry_year:expiry_year,
                                  cvc:cvc,
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
                                  "Subscribe",
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
