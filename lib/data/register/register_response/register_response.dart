import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/login/authentication_response/user.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  bool? success;
  String? message;
  UserModelResponse? user;
  String? token;

  RegisterResponse({this.success, this.message, this.user, this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class OtpVerifyResponse {
  @JsonKey(name: 'success')
  bool success;

  OtpVerifyResponse(this.success);

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyResponseFromJson(json);
}
