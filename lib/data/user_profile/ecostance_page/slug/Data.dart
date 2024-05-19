import 'Phone.dart';
import 'Country.dart';

class Data {
  Data({
      this.phone, 
      this.isDeleted, 
      this.id, 
      this.email, 
      this.emailVerificationStatus, 
      this.phoneVerificationStatus, 
      this.otp, 
      this.otpCreatedAt, 
      this.uid, 
      this.termsAndConditions, 
      this.newsLetter, 
      this.notification, 
      this.welcomeEmailSent, 
      this.registrationEmailSent, 
      this.loginAttemptCount, 
      this.accountLocked, 
      this.primaryEmailChangeAttemptCount, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.firstLoginAttempt, 
      this.draftedRecoveryEmail, 
      this.recoveryEmailOTP, 
      this.recoveryEmailOTPCreatedAt, 
      this.recoveryEmail, 
      this.country, 
      this.firstName, 
      this.lastName, 
      this.profileImage,});

  Data.fromJson(dynamic json) {
    phone = json['phone'] != null ? Phone.fromJson(json['phone']) : null;
    isDeleted = json['isDeleted'];
    id = json['_id'];
    email = json['email'];
    emailVerificationStatus = json['emailVerificationStatus'];
    phoneVerificationStatus = json['phoneVerificationStatus'];
    otp = json['otp'];
    otpCreatedAt = json['otpCreatedAt'];
    uid = json['uid'];
    termsAndConditions = json['termsAndConditions'];
    newsLetter = json['newsLetter'];
    notification = json['notification'];
    welcomeEmailSent = json['welcomeEmailSent'];
    registrationEmailSent = json['registrationEmailSent'];
    loginAttemptCount = json['loginAttemptCount'];
    accountLocked = json['accountLocked'];
    primaryEmailChangeAttemptCount = json['primaryEmailChangeAttemptCount'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    firstLoginAttempt = json['firstLoginAttempt'];
    draftedRecoveryEmail = json['draftedRecoveryEmail'];
    recoveryEmailOTP = json['recoveryEmailOTP'];
    recoveryEmailOTPCreatedAt = json['recoveryEmailOTPCreatedAt'];
    recoveryEmail = json['recoveryEmail'];
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
  }
  Phone? phone;
  bool? isDeleted;
  String? id;
  String? email;
  String? emailVerificationStatus;
  String? phoneVerificationStatus;
  String? otp;
  String? otpCreatedAt;
  String? uid;
  bool? termsAndConditions;
  bool? newsLetter;
  bool? notification;
  bool? welcomeEmailSent;
  bool? registrationEmailSent;
  int? loginAttemptCount;
  bool? accountLocked;
  int? primaryEmailChangeAttemptCount;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? firstLoginAttempt;
  String? draftedRecoveryEmail;
  String? recoveryEmailOTP;
  String? recoveryEmailOTPCreatedAt;
  String? recoveryEmail;
  Country? country;
  String? firstName;
  String? lastName;
  dynamic profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (phone != null) {
      map['phone'] = phone?.toJson();
    }
    map['isDeleted'] = isDeleted;
    map['_id'] = id;
    map['email'] = email;
    map['emailVerificationStatus'] = emailVerificationStatus;
    map['phoneVerificationStatus'] = phoneVerificationStatus;
    map['otp'] = otp;
    map['otpCreatedAt'] = otpCreatedAt;
    map['uid'] = uid;
    map['termsAndConditions'] = termsAndConditions;
    map['newsLetter'] = newsLetter;
    map['notification'] = notification;
    map['welcomeEmailSent'] = welcomeEmailSent;
    map['registrationEmailSent'] = registrationEmailSent;
    map['loginAttemptCount'] = loginAttemptCount;
    map['accountLocked'] = accountLocked;
    map['primaryEmailChangeAttemptCount'] = primaryEmailChangeAttemptCount;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['firstLoginAttempt'] = firstLoginAttempt;
    map['draftedRecoveryEmail'] = draftedRecoveryEmail;
    map['recoveryEmailOTP'] = recoveryEmailOTP;
    map['recoveryEmailOTPCreatedAt'] = recoveryEmailOTPCreatedAt;
    map['recoveryEmail'] = recoveryEmail;
    if (country != null) {
      map['country'] = country?.toJson();
    }
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['profileImage'] = profileImage;
    return map;
  }

}