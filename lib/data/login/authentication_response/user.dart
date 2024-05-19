import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/all_countries/responses/countries_list_response/country.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModelResponse {
  @JsonKey(name: '_id')
  String? id;
  String? email;
  String? emailVerificationStatus;
  String? phoneVerificationStatus;
  String? password;
  String? otp;
  DateTime? otpCreatedAt;
  String? uid;
  bool? termsAndConditions;
  bool? newsLetter;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  ProfileResponseCountry? country;
  String? defaultCurrency;
  DateTime? dob;
  String? firstName;
  String? lastName;
  String? recoveryEmail;
  String? profileImage;
  PhoneResponse? phone;

  UserModelResponse({
    this.id,
    this.email,
    this.emailVerificationStatus,
    this.phoneVerificationStatus,
    this.password,
    this.otp,
    this.otpCreatedAt,
    this.uid,
    this.termsAndConditions,
    this.newsLetter,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.country,
    this.defaultCurrency,
    this.dob,
    this.firstName,
    this.lastName,
    this.recoveryEmail,
    this.profileImage,
    this.phone
  });

  @override
  String toString() {
    return 'User(id: $id, email: $email, emailVerificationStatus: $emailVerificationStatus, phoneVerificationStatus: $phoneVerificationStatus, password: $password, otp: $otp, otpCreatedAt: $otpCreatedAt, uid: $uid, termsAndConditions: $termsAndConditions, newsLetter: $newsLetter, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  factory UserModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UserModelResponseFromJson(json);

  UserModelResponse copyWith({
    String? id,
    String? email,
    String? emailVerificationStatus,
    String? phoneVerificationStatus,
    String? password,
    String? otp,
    DateTime? otpCreatedAt,
    String? uid,
    bool? termsAndConditions,
    bool? newsLetter,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    ProfileResponseCountry? country,
    String? defaultCurrency,
    DateTime? dob,
    String? firstName,
    String? lastName,
    String? recoveryEmail,
    String? profileImage,
  }) {
    return UserModelResponse(
      id: id ?? this.id,
      email: email ?? this.email,
      emailVerificationStatus:
          emailVerificationStatus ?? this.emailVerificationStatus,
      phoneVerificationStatus:
          phoneVerificationStatus ?? this.phoneVerificationStatus,
      password: password ?? this.password,
      otp: otp ?? this.otp,
      otpCreatedAt: otpCreatedAt ?? this.otpCreatedAt,
      uid: uid ?? this.uid,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      newsLetter: newsLetter ?? this.newsLetter,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }
}

@JsonSerializable()
class ProfileResponseCountry {
  ProfileResponseCountry({
    this.countryCode,
    this.country,
  });
  @JsonKey(name: 'name')
  String? countryCode;
  @JsonKey(name: 'details')
  CountryResponse? country;
  factory ProfileResponseCountry.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseCountryFromJson(json);
}

@JsonSerializable()
class PhoneResponse {
  PhoneResponse({
     this.number,
     this.numericCode,
     this.countryCode,
  });

  final String? number;
  final String? numericCode;
  final String? countryCode;
  factory PhoneResponse.fromJson(Map<String, dynamic> json) => _$PhoneResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneResponseToJson(this);

}
