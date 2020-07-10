class UserProfile {
  int id;
  String first_name;
  String last_name;
  String pro_pic;
  int lanlog;
  int user;

  UserProfile(
      {this.id,
      this.first_name,
      this.last_name,
      this.pro_pic,
      this.lanlog,
      this.user});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        id: json['id'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        pro_pic: json['pro_pic'],
        lanlog: json['lanlog'],
        user: json['user']);
  }
}
