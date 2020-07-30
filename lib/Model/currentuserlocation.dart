class CurrentUserlocation {
  int id;
  String Lan;
  String Log;
  bool online;
  int user;

  CurrentUserlocation({this.id, this.Lan, this.Log, this.online, this.user});

  factory CurrentUserlocation.fromJson(Map<String, dynamic> json) {
    return CurrentUserlocation(
      id: json['id'],
      Lan: json['Lan'],
      Log: json['Log'],
      online: json['online'],
      user: json['user'],
    );
  }
}
