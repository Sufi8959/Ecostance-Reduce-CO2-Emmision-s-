class Id {
  Id({
      this.year, 
      this.month,});

  Id.fromJson(dynamic json) {
    year = json['year'];
    month = json['month'];
  }
  int? year;
  int? month;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = year;
    map['month'] = month;
    return map;
  }

}