class VendorLogin {
  String token;

  VendorLogin(
      {this.token});

  VendorLogin.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
