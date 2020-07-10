class UserLogin {
  String token;

  UserLogin(
      {this.token});

  UserLogin.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
