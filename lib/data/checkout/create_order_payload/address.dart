import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/login/authentication_response/user.dart';

part 'address.g.dart';

@JsonSerializable()
class CreateOrderRequestAddress {
  String? firstName;
  String? lastName;
  PhoneResponse? phone;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? stateCode;
  String? countryCode;

  CreateOrderRequestAddress({
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
  });

  factory CreateOrderRequestAddress.fromJson(Map<String, dynamic> json) {
    return _$CreateOrderRequestAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateOrderRequestAddressToJson(this);
}
