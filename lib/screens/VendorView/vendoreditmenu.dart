import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/Utils/utils.dart';
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
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Menu Title',
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          icon: Icon(
                            Icons.title,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
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
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Menu Description',
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          icon: Icon(
                            Icons.title,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
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
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Menu Price',
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          icon: Icon(
                            Icons.title,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
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
                        child: Text('Update Menu Details'))
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
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        utils_consumer.selectimage1();
                      },
                      child: Text(
                        'Select First Image',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
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
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        return utils_consumer.selectimage2();
                      },
                      child: Text(
                        'Select Second Image',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
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
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        return utils_consumer.selectimage3();
                      },
                      child: Text(
                        'Select Third Image',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
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
                        webservices_consumer.Login_SetState_Second();
                        webservices_consumer.Update_Menu_Images(
                          image1: utils_consumer.selected_menu_image1.path,
                          image2: utils_consumer.selected_menu_image2.path,
                          image3: utils_consumer.selected_menu_image3.path,
                          context: context,
                          id: widget.snapshot_data.id,
                        );
                      },
                      child: Text('Update Menu Images')),
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
