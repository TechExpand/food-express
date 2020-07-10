import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class VENDORprofileEdith extends StatefulWidget {
  var pro_pic;
  var phone;
  var unique_detail;
  var detail;
  var business_name;

  VENDORprofileEdith({
    this.pro_pic,
    this.phone,
    this.unique_detail,
    this.detail,
    this.business_name,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VENDORprofileEdithstate();
  }
}

class VENDORprofileEdithstate extends State<VENDORprofileEdith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
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
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(widget.pro_pic),
                      radius: 35,
                      child: Text(''),
                    ),
                  )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 480,
                child: TextFormField(
                  initialValue: widget.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Username is Required';
                    } else {
                      //username = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'username',
                      labelStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
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
                  initialValue: widget.business_name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Username is Required';
                    } else {
//                          username = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'username',
                      labelStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
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
                  initialValue: widget.unique_detail,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Username is Required';
                    } else {
//                          username = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'username',
                      labelStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
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
                  initialValue: widget.detail,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Username is Required';
                    } else {
//                          username = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'username',
                      labelStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                      icon: Icon(
                        Icons.title,
                        color: Colors.black87,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
          ],
        )));
  }
}
