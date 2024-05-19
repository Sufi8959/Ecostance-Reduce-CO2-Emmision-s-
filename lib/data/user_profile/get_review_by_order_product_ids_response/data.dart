import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class GetReviewByOrderProductIdsResponseData {
  @JsonKey(name: '_id')
  String? id;
  String? product;
  String? customer;
  String? order;
  double? rating;
  String? comment;
  bool? isReviewed;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  GetReviewByOrderProductIdsResponseData({
    this.id,
    this.product,
    this.customer,
    this.order,
    this.rating,
    this.comment,
    this.isReviewed,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetReviewByOrderProductIdsResponseData.fromJson(
          Map<String, dynamic> json) =>
      _$GetReviewByOrderProductIdsResponseDataFromJson(json);
}
