class CurrentVendorlocation {
  int id;
  double Lan;
  double Log;
  bool online;
  int user;

  CurrentVendorlocation(
      {this.id,
        this.Lan,
        this.Log,
        this.online,
        this.user});

  CurrentVendorlocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Lan = json['Lan'];
    Log = json['Log'];
    online = json['online'];
    user = json['user'];
  }
}
