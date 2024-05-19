import 'Phone.dart';

class BillingAddress {
  BillingAddress({
      this.id, 
      this.customerProfile, 
      this.firstName, 
      this.lastName, 
      this.phone, 
      this.addressLine1, 
      this.addressLine2, 
      this.city, 
      this.state, 
      this.country, 
      this.pincode, 
      this.stateCode, 
      this.countryCode, 
      this.isBilling, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  BillingAddress.fromJson(dynamic json) {
    id = json['_id'];
    customerProfile = json['customerProfile'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'] != null ? Phone.fromJson(json['phone']) : null;
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    stateCode = json['stateCode'];
    countryCode = json['countryCode'];
    isBilling = json['isBilling'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? customerProfile;
  String? firstName;
  String? lastName;
  Phone? phone;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? stateCode;
  String? countryCode;
  bool? isBilling;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['customerProfile'] = customerProfile;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    if (phone != null) {
      map['phone'] = phone?.toJson();
    }
    map['addressLine1'] = addressLine1;
    map['addressLine2'] = addressLine2;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['pincode'] = pincode;
    map['stateCode'] = stateCode;
    map['countryCode'] = countryCode;
    map['isBilling'] = isBilling;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}