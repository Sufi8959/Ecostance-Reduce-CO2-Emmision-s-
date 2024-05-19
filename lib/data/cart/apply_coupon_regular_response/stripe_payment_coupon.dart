import 'package:json_annotation/json_annotation.dart';

part 'stripe_payment_coupon.g.dart';

@JsonSerializable()
class StripePaymentCoupon {
  String? id;
  String? object;
  @JsonKey(name: 'amount_off')
  double? amountOff;
  int? created;
  String? currency;
  String? duration;
  @JsonKey(name: 'duration_in_months')
  int? durationInMonths;
  bool? livemode;
  @JsonKey(name: 'max_redemptions')
  dynamic maxRedemptions;

  String? name;
  @JsonKey(name: 'percent_off')
  dynamic percentOff;
  @JsonKey(name: 'redeem_by')
  dynamic redeemBy;
  @JsonKey(name: 'times_redeemed')
  int? timesRedeemed;
  bool? valid;

  StripePaymentCoupon({
    this.id,
    this.object,
    this.amountOff,
    this.created,
    this.currency,
    this.duration,
    this.durationInMonths,
    this.livemode,
    this.maxRedemptions,
    this.name,
    this.percentOff,
    this.redeemBy,
    this.timesRedeemed,
    this.valid,
  });

  factory StripePaymentCoupon.fromJson(Map<String, dynamic> json) {
    return _$StripePaymentCouponFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StripePaymentCouponToJson(this);
}
