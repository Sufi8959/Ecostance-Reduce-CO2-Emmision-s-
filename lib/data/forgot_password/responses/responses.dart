import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class ResetPasswordRespons {
  @JsonKey(name: 'message')
  String? message;

  ResetPasswordRespons({this.message});
  factory ResetPasswordRespons.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponsFromJson(json);
}

@JsonSerializable()
class OtpSubmitResponse {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'token')
  String? token;

  OtpSubmitResponse({this.message, this.token});
  factory OtpSubmitResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpSubmitResponseFromJson(json);
}
