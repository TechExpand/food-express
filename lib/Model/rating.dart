class Rating {
  int id;
  int rate;
  int lanlog;


  Rating(
      {this.id,
      this.rate,
      this.lanlog,
     });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        id: json['id'],
        rate: json['rate'],
        lanlog: json['lanlog'],
        );
  }
}
