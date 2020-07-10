class VendorProfile {
  int id;
  String business_name;
  String unique_detail;
  String phone;
  String detail;
  String pro_pic;
  int lanlog;
  int user;

  VendorProfile(
      {this.id,
      this.business_name,
      this.unique_detail,
      this.phone,
      this.detail,
      this.pro_pic,
      this.lanlog,
      this.user});

  factory VendorProfile.fromJson(Map<String, dynamic> json) {
   return  VendorProfile(
        id: json['id'],
        business_name: json['business_name'],
        unique_detail: json['unique_detail'],
        phone: json['phone'],
        detail: json['detail'],
        pro_pic: json['pro_pic'],
        lanlog: json['lanlog'],
        user: json['user']);
  }
}
