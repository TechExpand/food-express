import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class VendorMenuPage extends StatefulWidget {
  var business_name;
  var unique_detail;

  VendorMenuPage({this.business_name, this.unique_detail});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VendorMenuPageState();
  }
}
var menu_data;
class VendorMenuPageState extends State<VendorMenuPage> {
  Future profile_menu() async {
    var res = await http.get(
        Uri.encodeFull(
            'http://192.168.43.231:8000/foodtruck/menu/'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token 41b835636ae90a02fb7079d95cf72f9b70e4735c"
        });
    this.setState(() {
      menu_data = json.decode(res.body);
    });


    return menu_data;
  }

  @override
  void initState() {
    super.initState();
    profile_menu();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                          widget.unique_detail,
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
                            widget.business_name,
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
                 Container(
                   height: MediaQuery.of(context).size.height-191,
                    child: menu_data==null?Center(child:Text('Loading...')):GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 1,
                      ),
                      itemCount: menu_data.length,
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
                                            image:  NetworkImage(menu_data[index]['menu_picture1']),
                                            fit: BoxFit.fill,
                                          ),),
                                      height: 50,
                                      width: 60,
                                    ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(menu_data[index]['menu_title'], maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(right:25.0, top:8),
                                          child: Icon(Icons.edit, color: Colors.blue,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only( top:8),
                                          child: Container(
                                            width: 1.5,
                                            height: 15,
                                            color:Colors.black54
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:25.0, top:8),
                                          child: Icon(Icons.delete,color: Colors.red,),
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
                    ),
                  ),
              ],
            ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
