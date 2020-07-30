class LocationProfileDetail {
  int id;
  String business_name;
  String unique_detail;
  String phone;
  String detail;
  String pro_pic;
  int lanlog;
  int user;

  LocationProfileDetail(
      {this.id,
      this.business_name,
      this.unique_detail,
      this.phone,
      this.detail,
      this.pro_pic,
      this.lanlog,
      this.user});

  factory LocationProfileDetail.fromJson(Map<String, dynamic> json) {
    return LocationProfileDetail(
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

class LocationMenuDetail {
  int id;
  String menu_title;
  String menu_description;
  int menu_price;
  String menu_picture1;
  String menu_picture2;
  String menu_picture3;
  int lanlog;
  int user;

  LocationMenuDetail(
      {this.id,
      this.menu_title,
      this.menu_description,
      this.menu_price,
      this.menu_picture1,
      this.menu_picture2,
      this.menu_picture3,
      this.lanlog,
      this.user});

  factory LocationMenuDetail.fromJson(Map<String, dynamic> json) {
    return LocationMenuDetail(
        id: json['id'],
        menu_title: json['menu_title'],
        menu_description: json['menu_description'],
        menu_price: json['menu_price'],
        menu_picture1: json['menu_picture1'],
        menu_picture2: json['menu_picture2'],
        menu_picture3: json['menu_picture3'],
        lanlog: json['lanlog'],
        user: json['user']);
  }
}
