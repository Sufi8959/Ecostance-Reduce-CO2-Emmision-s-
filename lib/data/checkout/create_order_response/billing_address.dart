import 'package:json_annotation/json_annotation.dart';

part 'billing_address.g.dart';

@JsonSerializable()
class BillingAddress {
  String? firstName;
  String? lastName;
  String? contactNo;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? stateCode;
  String? countryCode;

  BillingAddress({
    this.firstName,
    this.lastName,
    this.contactNo,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.stateCode,
    this.countryCode,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> json) {
    return _$BillingAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BillingAddressToJson(this);
}
