import 'dart:ffi';

class CurrentUserlocation {
  int id;
  String Lan;
  String Log;
  bool online;
  double distance;
  int user;

  CurrentUserlocation({this.id, this.Lan, this.Log, this.online, this.user,this.distance});

  factory CurrentUserlocation.fromJson(Map<String, dynamic> json) {
    return CurrentUserlocation(
      distance: json['distance'],
      id: json['id'],
      Lan: json['Lan'],
      Log: json['Log'],
      online: json['online'],
      user: json['user'],
    );
  }
}
