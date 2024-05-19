// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelResponse _$UserModelResponseFromJson(Map<String, dynamic> json) =>
    UserModelResponse(
      id: json['_id'] as String?,
      email: json['email'] as String?,
      emailVerificationStatus: json['emailVerificationStatus'] as String?,
      phoneVerificationStatus: json['phoneVerificationStatus'] as String?,
      password: json['password'] as String?,
      otp: json['otp'] as String?,
      otpCreatedAt: json['otpCreatedAt'] == null
          ? null
          : DateTime.tryParse(json['otpCreatedAt'] as String),
      uid: json['uid'] as String?,
      termsAndConditions: json['termsAndConditions'] as bool?,
      newsLetter: json['newsLetter'] as bool?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      country: json['country'] == null
          ? null
          : ProfileResponseCountry.fromJson(
              json['country'] as Map<String, dynamic>),
      defaultCurrency: json['defaultCurrency'] as String?,
      dob:
          json['dob'] == null ? null : DateTime.tryParse(json['dob'] as String),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      recoveryEmail: json['recoveryEmail'] as String?,
      profileImage: json['profileImage'] as String?,
      phone: json['phone'] == null
          ? null
          : PhoneResponse.fromJson(json['phone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelResponseToJson(UserModelResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'emailVerificationStatus': instance.emailVerificationStatus,
      'phoneVerificationStatus': instance.phoneVerificationStatus,
      'password': instance.password,
      'otp': instance.otp,
      'otpCreatedAt': instance.otpCreatedAt?.toIso8601String(),
      'uid': instance.uid,
      'termsAndConditions': instance.termsAndConditions,
      'newsLetter': instance.newsLetter,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'country': instance.country,
      'defaultCurrency': instance.defaultCurrency,
      'dob': instance.dob?.toIso8601String(),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'recoveryEmail': instance.recoveryEmail,
      'profileImage': instance.profileImage,
      'phone': instance.phone,
    };

ProfileResponseCountry _$ProfileResponseCountryFromJson(
        Map<String, dynamic> json) =>
    ProfileResponseCountry(
      countryCode: json['name'] as String?,
      country: json['details'] == null
          ? null
          : CountryResponse.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseCountryToJson(
        ProfileResponseCountry instance) =>
    <String, dynamic>{
      'name': instance.countryCode,
      'details': instance.country,
    };

PhoneResponse _$PhoneResponseFromJson(Map<String, dynamic> json) =>
    PhoneResponse(
      number: json['number'] as String?,
      numericCode: json['numericCode'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$PhoneResponseToJson(PhoneResponse instance) =>
    <String, dynamic>{
      'number': instance.number,
      'numericCode': instance.numericCode,
      'countryCode': instance.countryCode,
    };
