import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/loginuser.dart';
import 'dart:ui' as ui;
import 'package:foodtruckexpressxd/main.dart';

class USERSIGNUP1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return USERSIGNUP1STATE();
  }
}

class USERSIGNUP1STATE extends State<USERSIGNUP1> {
  @override
  void initState() {
    super.initState();
//    getCurrentLocation();
//    onlocation();
  }

  var web = new WebServices();

  var username;
  var email;
  var password;
  var re_password;
  final form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SIGN UP USER',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 15,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Form(
        key: form_key,
        child: SingleChildScrollView(
          child: Flexible(
            flex: 20,
            child: Column(
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
                          return 'Email Required';
                        } else {
                          email = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          labelText: 'Email',
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
                          return 'Username Required';
                        } else {
                          username = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          labelText: 'Username',
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
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password Required';
                        } else if (value.length < 8) {
                          return 'It must contain at least 8 characters.';
                        } else {
                          password = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          labelText: 'Password',
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
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 8, bottom: 10),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Confirm typed password';
                        } else {
                          re_password = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                          labelText: 'Confirm password',
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
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Login();
                          }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Already Have an Account? Login"),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (form_key.currentState.validate()) {
                        web.Signup_VendorApi(
                            username: username,
                            password: password,
                            email: email,
                            re_password: re_password);
//                        circular();
                      }
                    },
                    color: Colors.blue,
                    child: Text(
                      'Register here',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
