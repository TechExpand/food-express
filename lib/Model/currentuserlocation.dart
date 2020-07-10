class CurrentUserlocation {
  int id;
  double Lan;
  double Log;
  bool online;
  int user;

  CurrentUserlocation(
      {this.id,
      this.Lan,
      this.Log,
      this.online,
      this.user});

  CurrentUserlocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Lan = json['Lan'];
    Log = json['Log'];
    online = json['online'];
    user = json['user'];
  }
}
