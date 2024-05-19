import 'package:json_annotation/json_annotation.dart';

part 'discount.g.dart';

@JsonSerializable()
class Discount {
  String? coupon;

  Discount({this.coupon});

  factory Discount.fromJson(Map<String, dynamic> json) {
    return _$DiscountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}
