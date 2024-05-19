import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/login/authentication_response/user.dart';
import 'package:net_carbons/data/user_profile/carbol_calculations_response/carbol_calculations_response.dart';
import 'package:net_carbons/data/user_profile/device_info/device_info_response.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class UserProfileResponse {
  @JsonKey(name: 'data')
  UserModelResponse? user;
  @JsonKey(name: 'billingAddress')
  BillingAddressResponse? billingAddress;
  @JsonKey(name: 'carbonCalculations')
  CarbonCalculationsResponse? calculationsResponse;
  DateTime? lastLoggedIn;
  String? addressCountry;
  String? selectedCountry;
  String? checkoutDefaultCurrency;
  @JsonKey(name: 'deviceInfo')
  DeviceInfoResponse? deviceInfoResponse;

  UserProfileResponse(
      {this.user,
      this.billingAddress,
      this.calculationsResponse,
      this.selectedCountry,
      this.checkoutDefaultCurrency,
      this.addressCountry,
      this.lastLoggedIn,this.deviceInfoResponse});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}

@JsonSerializable()
class BillingAddressResponse {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'customerProfile')
  String? customerProfile;

  @JsonKey(name: 'firstName')
  String? firstName;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'phone')
  PhoneResponse? contactNo;

  @JsonKey(name: 'addressLine1')
  String? addressLine1;

  @JsonKey(name: 'addressLine2')
  String? addressLine2;

  @JsonKey(name: 'city')
  String? city;

  @JsonKey(name: 'state')
  String? state;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'pincode')
  String? pincode;

  @JsonKey(name: 'stateCode')
  String? stateCode;

  @JsonKey(name: 'countryCode')
  String? countryCode;

  @JsonKey(name: 'isBilling')
  bool? isBilling;

  @JsonKey(name: 'createdAt')
  String? createdAt;

  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  BillingAddressResponse({
    this.id,
    this.customerProfile,
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
    this.isBilling,
    this.createdAt,
    this.updatedAt,
  });

  factory BillingAddressResponse.fromJson(Map<String, dynamic> json) {
    return _$BillingAddressResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$BillingAddressResponseToJson(this);
}

// "_id": "62bd51b93f1c6d700f53efb6",
//         "customerProfile": "62bb0c803f1c6d700f53d33f",
//         "firstName": "Muahmmed",
//         "lastName": "Rashid",
//         "contactNo": "9947519795",
//         "addressLine1": "Calicut",
//         "addressLine2": "Koduvaly",
//         "city": "Kalavoor",
//         "state": "Kerala",
//         "country": "India",
//         "pincode": "673572",
//         "stateCode": "KL",
//         "countryCode": "IN",
//         "isBilling": true,
//         "createdAt": "2022-06-30T07:33:13.484Z",
//         "updatedAt": "2022-06-30T07:33:13.484Z",
//         "__v": 0
