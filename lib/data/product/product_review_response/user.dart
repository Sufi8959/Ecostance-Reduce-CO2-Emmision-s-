import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class ReviewUserResponse {
  @JsonKey(name: '_id')
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? profileImage;

  ReviewUserResponse({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.profileImage,
  });

  factory ReviewUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserResponseFromJson(json);
}
