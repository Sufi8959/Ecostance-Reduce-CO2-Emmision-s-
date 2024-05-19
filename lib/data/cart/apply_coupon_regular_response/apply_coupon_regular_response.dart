import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/domain/cart/models/apply_coupon.dart';

import 'stripe_payment_coupon.dart';
import 'stripe_subscription_coupon.dart';

part 'apply_coupon_regular_response.g.dart';

@JsonSerializable()
class ApplyCouponRegularResponse {
  double? subTotal;
  double? discount;
  double? total;
  StripePaymentCoupon? stripePaymentCoupon;
  StripeSubscriptionCoupon? stripeSubscriptionCoupon;
  bool? orderTotalWithinStripeRange;

  ApplyCouponRegularResponse(
      {this.subTotal,
      this.discount,
      this.total,
      this.stripePaymentCoupon,
      this.stripeSubscriptionCoupon,
      this.orderTotalWithinStripeRange});

  ///TODO: Change map string issue
  factory ApplyCouponRegularResponse.fromJson(Map<String, dynamic> json) {
    return _$ApplyCouponRegularResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplyCouponRegularResponseToJson(this);
}

extension ApplyCouponRegularResponseToMoadal on ApplyCouponRegularResponse? {
  ApplyCouponResponseModal toDomain() {
    return ApplyCouponResponseModal(
        subTotal: this?.subTotal ?? 0.0,
        discount: this?.discount ?? 0,
        total: this?.total ?? 0,
        stripePaymentCoupon: this?.stripePaymentCoupon.toDomanin() ??
            StripeRegularCouponModal.empty(),
        stripeSubscriptionCoupon: this?.stripeSubscriptionCoupon.toDomanin() ??
            StripeSubscriptionCouponModal.empty(),
        orderTotalWithinStripeRange:
            this?.orderTotalWithinStripeRange ?? false);
  }
}

extension StripePaymentCouponToModal on StripePaymentCoupon? {
  StripeRegularCouponModal toDomanin() {
    return StripeRegularCouponModal(
        id: this?.id.orEmpty() ?? "",
        object: this?.object.orEmpty() ?? "",
        amountOff: this?.amountOff.orZero() ?? 0,
        created: this?.created.orZero() ?? 0,
        currency: this?.currency.orEmpty() ?? "",
        duration: this?.duration.orEmpty() ?? '',
        durationInMonths: this?.durationInMonths.orZero() ?? 0,
        livemode: this?.livemode ?? false,
        maxRedemptions: this?.maxRedemptions,
        // metadata: this?.metadata,
        name: this?.name.orEmpty() ?? "",
        percentOff: this?.percentOff,
        redeemBy: this?.redeemBy,
        timesRedeemed: this?.timesRedeemed.orZero() ?? 0,
        valid: this?.valid ?? false);
  }
}

extension StripeSubscriptionCouponToModal on StripeSubscriptionCoupon? {
  StripeSubscriptionCouponModal toDomanin() {
    return StripeSubscriptionCouponModal(
        id: this?.id.orEmpty() ?? "",
        object: this?.object.orEmpty() ?? "",
        amountOff: this?.amountOff.orZero() ?? 0,
        created: this?.created.orZero() ?? 0,
        currency: this?.currency.orEmpty() ?? "",
        duration: this?.duration.orEmpty() ?? '',
        durationInMonths: this?.durationInMonths.orZero() ?? 0,
        livemode: this?.livemode ?? false,
        maxRedemptions: this?.maxRedemptions,
        // metadata: this?.metadata,
        name: this?.name.orEmpty() ?? "",
        percentOff: this?.percentOff,
        redeemBy: this?.redeemBy,
        timesRedeemed: this?.timesRedeemed.orZero() ?? 0,
        valid: this?.valid ?? false);
  }
}
