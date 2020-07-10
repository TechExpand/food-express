class VendorLocation {
  int id;
  double Lan;
  double Log;
  bool online;
  int user;

  VendorLocation(
      {this.id,
        this.Lan,
        this.Log,
        this.online,
        this.user});

  VendorLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Lan = json['Lan'];
    Log = json['Log'];
    online = json['online'];
    user = json['user'];
  }
}
