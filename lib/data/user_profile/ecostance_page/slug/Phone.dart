class Phone {
  Phone({
      this.number, 
      this.countryCode, 
      this.numericCode,});

  Phone.fromJson(dynamic json) {
    number = json['number'];
    countryCode = json['countryCode'];
    numericCode = json['numericCode'];
  }
  String? number;
  String? countryCode;
  String? numericCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['countryCode'] = countryCode;
    map['numericCode'] = numericCode;
    return map;
  }

}