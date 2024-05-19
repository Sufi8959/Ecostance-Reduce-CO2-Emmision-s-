class Country {
  Country({
      this.name, 
      this.details,});

  Country.fromJson(dynamic json) {
    name = json['name'];
    details = json['details'];
  }
  String? name;
  dynamic details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['details'] = details;
    return map;
  }

}