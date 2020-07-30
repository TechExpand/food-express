import 'package:flutter/material.dart';
import 'package:foodtruckexpressxd/Services/LocationService.dart';
import 'package:foodtruckexpressxd/Services/Network.dart';
import 'package:foodtruckexpressxd/screens/Login_SignupView/login.dart';
import 'dart:ui' as ui;
import 'package:foodtruckexpressxd/main.dart';
import 'package:provider/provider.dart';

class SIGNUP extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SIGNUPSTATE();
  }
}


class SIGNUPSTATE extends State<SIGNUP> {
  var username;
  var email;
  var password;
  var re_password;
  final form_key = GlobalKey<FormState>();
  final form_key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          bottomNavigationBar:  ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Container(
                color: Colors.blue,
                child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.person_pin),
                      child: Text('Register as User'),
                    ),

                    Tab(
                      icon: Icon(Icons.directions_car),
                      child: Text('Register as Vendor'),
                    )
                  ],
                ),
              )),
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
        body: TabBarView(
          children: <Widget>[
            UserSignUp(email,username,password,re_password,context,form_key),
            VendorSignUp(email,username,password,re_password,context,form_key1)
          ],
        ),
      ),
    );
  }
}



Widget UserSignUp(email,username,password,re_password,context,form_key){
  return Form(
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
            Consumer<WebServices>(
              builder: (context, webservice_consumer, child) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: webservice_consumer.login_state == false
                    ? RaisedButton(
                  onPressed: () {
                    if (form_key.currentState.validate()) {
                      webservice_consumer.Login_SetState();
                      webservice_consumer.Signup_UserApi(
                        username: username,
                        password: password,
                        email: email,
                        re_password: re_password,
                        context: context,
                      ).then((value) =>  webservice_consumer.login_before_submit_location_user(
                        password: password,
                        email: email,
                        context: context,
                      ).then((value) => webservice_consumer.send_user_location(context)));


                    }
                  },
                  color: Colors.blue,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ):CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget VendorSignUp(email,username,password,re_password,context,form_key){
  return Form(
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
            Consumer<WebServices>(
              builder: (context, webservice_consumer, child) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: webservice_consumer.login_state == false
                    ? RaisedButton(
                  onPressed: () {
                    if (form_key.currentState.validate()) {
                      webservice_consumer.Login_SetState();
                      webservice_consumer.Signup_VendorApi(
                        username: username,
                        password: password,
                        email: email,
                        re_password: re_password,
                        context: context,
                      ).then((value) => webservice_consumer.login_before_submit_location_vendor(
                        password: password,
                        email: email,
                        context: context,
                      ).then((value) => webservice_consumer.send_vendor_location(context)));
                    }
                  },
                  color: Colors.blue,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ):CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

