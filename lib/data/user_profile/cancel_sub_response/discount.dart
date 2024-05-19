import 'package:json_annotation/json_annotation.dart';

import 'coupon.dart';

part 'discount.g.dart';

@JsonSerializable()
class Discount {
  String? id;
  String? object;
  @JsonKey(name: 'checkout_session')
  dynamic checkoutSession;
  Coupon? coupon;
  String? customer;
  int? end;
  dynamic invoice;
  @JsonKey(name: 'invoice_item')
  dynamic invoiceItem;
  @JsonKey(name: 'promotion_code')
  dynamic promotionCode;
  int? start;
  String? subscription;

  Discount({
    this.id,
    this.object,
    this.checkoutSession,
    this.coupon,
    this.customer,
    this.end,
    this.invoice,
    this.invoiceItem,
    this.promotionCode,
    this.start,
    this.subscription,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return _$DiscountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}
