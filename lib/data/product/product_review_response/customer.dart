import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'customer.g.dart';

@JsonSerializable()
class ReviewCustomerResponse {
  @JsonKey(name: '_id')
  String? id;
  ReviewUserResponse? user;

  ReviewCustomerResponse({this.id, this.user});

  factory ReviewCustomerResponse.fromJson(Map<String, dynamic> json) {
    return _$ReviewCustomerResponseFromJson(json);
  }
}
