import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';

part 'coupon.g.dart';

@JsonSerializable()
class Coupon {
  String? id;
  String? object;
  @JsonKey(name: 'amount_off')
  int? amountOff;
  int? created;
  String? currency;
  String? duration;
  @JsonKey(name: 'duration_in_months')
  int? durationInMonths;
  bool? livemode;
  @JsonKey(name: 'max_redemptions')
  dynamic maxRedemptions;
  Metadata? metadata;
  String? name;
  @JsonKey(name: 'percent_off')
  dynamic percentOff;
  @JsonKey(name: 'redeem_by')
  dynamic redeemBy;
  @JsonKey(name: 'times_redeemed')
  int? timesRedeemed;
  bool? valid;

  Coupon({
    this.id,
    this.object,
    this.amountOff,
    this.created,
    this.currency,
    this.duration,
    this.durationInMonths,
    this.livemode,
    this.maxRedemptions,
    this.metadata,
    this.name,
    this.percentOff,
    this.redeemBy,
    this.timesRedeemed,
    this.valid,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return _$CouponFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CouponToJson(this);
}
