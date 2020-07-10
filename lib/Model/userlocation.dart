class UserLocation {
  int id;
  double Lan;
  double Log;
  bool online;
  int user;

  UserLocation(
      {this.id,
        this.Lan,
        this.Log,
        this.online,
        this.user});

  UserLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Lan = json['Lan'];
    Log = json['Log'];
    online = json['online'];
    user = json['user'];
  }
}
