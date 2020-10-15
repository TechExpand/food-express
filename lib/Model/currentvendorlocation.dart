class CurrentVendorlocation {
  int id;
  String Lan;
  String Log;
  bool online;
  int user;
  double distance;

  CurrentVendorlocation({this.id, this.Lan, this.Log, this.online, this.user, this.distance});

  factory CurrentVendorlocation.fromJson(Map<String, dynamic> json) {
    return CurrentVendorlocation(
        id: json['id'],
        Lan: json['Lan'],
        Log: json['Log'],
        online: json['online'],
        user: json['user'],
        distance: json['distance']
    );
  }
}
