//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter/foundation.dart';
//
//class Utils with ChangeNotifier{
//  updatemarker() {
//    for (var latlog in data) {
//      marker.add(Marker(
//        markerId: MarkerId(latlog['user'].toString()),
//        position: LatLng(double.parse(latlog['Lan'].toString()),
//            double.parse(latlog['Log'].toString())),
//        infoWindow: InfoWindow(
//          title: "User Current Adress",
//        ),
//      ));
//        bodywidget();
//      print(latlog['user']);
//      notifyListeners();
//    }
//  }
//







//if (token["auth_token"].toString().length == 40) {
//print('login');
//Navigator.push(
//context,
//PageRouteBuilder(
//pageBuilder: (context, animation, secondaryAnimation) {
//return Map_vendor();
//},
//transitionsBuilder:
//(context, animation, secondaryAnimation, child) {
//return FadeTransition(
//opacity: animation,
//child: child,
//);
//},
//),
//);
//} else {
//Navigator.pop(context);
//return showDialog(
//context: context,
//child: Dialog(
//backgroundColor: Colors.black12,
//child: Container(
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(10))),
//height: 70,
//child: Center(
//child: Text(
//'Unable to log in with provided credentials',
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//),
//),
//),
//),
//),
//);
//}






//if (token["auth_token"].toString().length == 40) {
//Navigator.push(
//context,
//PageRouteBuilder(
//pageBuilder: (context, animation, secondaryAnimation) {
//return Map_user();
//},
//transitionsBuilder:
//(context, animation, secondaryAnimation, child) {
//return FadeTransition(
//opacity: animation,
//child: child,
//);
//},
//),
//);
//}
//
//else {
//Navigator.pop(context);
//return showDialog(
//context: context,
//child: Dialog(
//backgroundColor: Colors.black12,
//child: Container(
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(10))),
//height: 70,
//child: Center(
//child: Text(
//'Unable to log in with provided credentials',
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//),
//),
//),
//),
//),
//);
//}








//if (signup_response.statusCode == 200 ||
//signup_response.statusCode == 201) {
//Navigator.pop(context);
//Navigator.push(
//context,
//PageRouteBuilder(
//pageBuilder: (context, animation, secondaryAnimation) {
//return VENDORSIGNUP2();
//},
//transitionsBuilder: (context, animation, secondaryAnimation, child) {
//return FadeTransition(
//opacity: animation,
//child: child,
//);
//},
//),
//);
//
//
//submit_location();
//} else {
//Navigator.pop(context);
//return showDialog(
//context: context,
//child: Dialog(
//backgroundColor: Colors.black12,
//child: Container(
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(10))),
//height: 70,
//child: Center(
//child: Text(
//'A user with that username already exists.',
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//),
//),
//),
//),
//),
//);
//}



//}