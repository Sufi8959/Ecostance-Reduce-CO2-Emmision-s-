// class AuthDataModal {
//   UserModel? user;
//   String token;
//   AuthDataModal({this.user, required this.token});
// }
//
// class UserModel {
//   String id;
//   String email;
//   String uid;
//
//   UserModel({
//     required this.id,
//     required this.email,
//     required this.uid,
//   });
//   factory UserModel.empty() => UserModel(
//         id: '',
//         email: '',
//         uid: '',
//       );
// }

import 'package:intl_phone_field/phone_number.dart';
import 'package:net_carbons/domain/countries/model/country_modal.dart';

class AuthDataModal {
  AuthDataModal({
    required this.user,
    this.ip,
    required this.token,
  });

  UserModel user;
  String? ip;
  String token;

  set setUser(UserModel user) {
    user = user;
  }
}

class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.emailVerificationStatus,
    required this.phoneVerificationStatus,
    required this.otp,
    required this.otpCreatedAt,
    required this.uid,
    required this.termsAndConditions,
    required this.newsLetter,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.country,
    required this.defaultCurrency,
     this.dob,
    required this.firstName,
    required this.lastName,
    required this.recoveryEmail,
    required this.profileImage,
    this.phoneNumber
  });

  String id;
  String email;
  String emailVerificationStatus;
  String phoneVerificationStatus;
  String otp;
  DateTime otpCreatedAt;
  String uid;
  bool termsAndConditions;
  bool newsLetter;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  UserProfileRespCountryModel country;
  String defaultCurrency;
  DateTime? dob;
  String firstName;
  String lastName;
  String recoveryEmail;
  String profileImage;
  PhoneNumber? phoneNumber;

  factory UserModel.empty() => UserModel(
      id: '',
      email: '',
      emailVerificationStatus: '',
      phoneVerificationStatus: '',
      otp: '',
      otpCreatedAt: DateTime.fromMillisecondsSinceEpoch(1),
      uid: '',
      termsAndConditions: false,
      newsLetter: false,
      status: '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(1),
      v: 0,
      country: UserProfileRespCountryModel.empty(),
      defaultCurrency: '',
      dob: DateTime.fromMicrosecondsSinceEpoch(1),
      firstName: '',
      lastName: '',
      recoveryEmail: '',
      profileImage: '');

  UserModel copyWith({
    String? id,
    String? email,
    String? emailVerificationStatus,
    String? phoneVerificationStatus,
    String? otp,
    DateTime? otpCreatedAt,
    String? uid,
    bool? termsAndConditions,
    bool? newsLetter,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    UserProfileRespCountryModel? country,
    String? defaultCurrency,
    DateTime? dob,
    String? firstName,
    String? lastName,
    String? recoveryEmail,
    String? profileImage,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      emailVerificationStatus:
          emailVerificationStatus ?? this.emailVerificationStatus,
      phoneVerificationStatus:
          phoneVerificationStatus ?? this.phoneVerificationStatus,
      otp: otp ?? this.otp,
      otpCreatedAt: otpCreatedAt ?? this.otpCreatedAt,
      uid: uid ?? this.uid,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      newsLetter: newsLetter ?? this.newsLetter,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      country: country ?? this.country,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      dob: dob ?? this.dob,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      recoveryEmail: recoveryEmail ?? this.recoveryEmail,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}

class UserProfileRespCountryModel {
  UserProfileRespCountryModel({
    required this.countryCode,
    required this.details,
  });

  String countryCode;
  CountryModal details;

  factory UserProfileRespCountryModel.empty() => UserProfileRespCountryModel(
      countryCode: '', details: CountryModal.empty());
}
