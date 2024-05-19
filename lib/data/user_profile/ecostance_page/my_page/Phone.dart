class Phone {
  Phone({
      this.number, 
      this.numericCode, 
      this.countryCode,});

  Phone.fromJson(dynamic json) {
    number = json['number'];
    numericCode = json['numericCode'];
    countryCode = json['countryCode'];
  }
  String? number;
  String? numericCode;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['numericCode'] = numericCode;
    map['countryCode'] = countryCode;
    return map;
  }

}