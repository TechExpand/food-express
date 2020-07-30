import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:adobe_xd/specific_rect_clip.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/Utils/utils.dart';
import 'package:foodtruckexpressxd/screens/UserView/Map_user.dart';
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
  var phone;
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FOODTRUCK.EXPRESS',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 15,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.bold,
          ),
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
                      width: 150.0,
                      height: 86.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/logotruck.png'),
                          fit: BoxFit.fill,
                        ),
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
                            return 'Business Name Required';
                          } else {
                            business_name = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            labelText: 'Business Name',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
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
                                borderRadius: BorderRadius.circular(0)),
                            labelText: 'Describe what makes your truck unique',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
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
                                borderRadius: BorderRadius.circular(0)),
                            labelText: 'Details',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
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
                            return 'Phone Required';
                          } else {
                            phone = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0)),
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          return utils_consumer.selectimage();
                        },
                        child: Text(
                          'business image',
                          style: TextStyle(
                              color: Colors.black87, fontWeight: FontWeight.bold),
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
                        );
                      }},

                      color: Colors.blue,
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
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
