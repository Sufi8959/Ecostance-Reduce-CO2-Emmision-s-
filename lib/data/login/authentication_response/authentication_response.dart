import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  UserModelResponse? user;
  String? ip;
  String? token;

  AuthenticationResponse({this.user, this.ip, this.token});

  @override
  String toString() {
    return 'AuthenticationResponse(user: $user, ip: $ip, token: $token)';
  }

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthenticationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

  AuthenticationResponse copyWith({
    UserModelResponse? user,
    String? ip,
    String? token,
  }) {
    return AuthenticationResponse(
      user: user ?? this.user,
      ip: ip ?? this.ip,
      token: token ?? this.token,
    );
  }
}
