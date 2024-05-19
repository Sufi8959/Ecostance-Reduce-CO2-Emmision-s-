import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'post_review_response.g.dart';

@JsonSerializable()
class PostReviewResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  PostReviewResponse({this.success, this.message, this.data});

  factory PostReviewResponse.fromJson(Map<String, dynamic> json) {
    return _$PostReviewResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostReviewResponseToJson(this);
}
