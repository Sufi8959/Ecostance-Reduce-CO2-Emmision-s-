import 'package:json_annotation/json_annotation.dart';

part 'coupon.g.dart';

@JsonSerializable()
class Coupon {
  @JsonKey(name: '_id')
  String? id;
  String? code;
  String? type;
  int? discountUnit;
  DateTime? startDate;
  DateTime? endDate;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  Coupon({
    this.id,
    this.code,
    this.type,
    this.discountUnit,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });



  factory Coupon.fromJson(Map<String, dynamic> json) {
    return _$CouponFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CouponToJson(this);
}
