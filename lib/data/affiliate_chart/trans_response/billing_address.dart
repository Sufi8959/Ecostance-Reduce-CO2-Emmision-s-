class BillingAddress {
  BillingAddress({
      this.firstName, 
      this.lastName, 
      this.city, 
      this.state, 
      this.country,});

  BillingAddress.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }
  String? firstName;
  String? lastName;
  String? city;
  String? state;
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    return map;
  }

}