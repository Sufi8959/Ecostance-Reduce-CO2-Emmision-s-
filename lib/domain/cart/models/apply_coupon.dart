class ApplyCouponResponseModal {
  ApplyCouponResponseModal(
      {required this.subTotal,
      required this.discount,
      required this.total,
      required this.stripePaymentCoupon,
      required this.stripeSubscriptionCoupon,
      required this.orderTotalWithinStripeRange});

  final double subTotal;
  final double discount;
  final double total;
  final StripeRegularCouponModal stripePaymentCoupon;
  final StripeSubscriptionCouponModal stripeSubscriptionCoupon;
  bool orderTotalWithinStripeRange;
}

class StripeRegularCouponModal {
  StripeRegularCouponModal({
    required this.id,
    required this.object,
    required this.amountOff,
    required this.created,
    required this.currency,
    required this.duration,
    required this.durationInMonths,
    required this.livemode,
    required this.maxRedemptions,
    this.metadata,
    required this.name,
    required this.percentOff,
    required this.redeemBy,
    required this.timesRedeemed,
    required this.valid,
  });

  final String id;
  final String object;
  final double amountOff;
  final int created;
  final String currency;
  final String duration;
  final int durationInMonths;
  final bool livemode;
  final dynamic maxRedemptions;
  final MetadataModal? metadata;
  final String name;
  final dynamic percentOff;
  final dynamic redeemBy;
  final int timesRedeemed;
  final bool valid;

  factory StripeRegularCouponModal.empty() => StripeRegularCouponModal(
      id: '',
      object: '',
      amountOff: 0,
      created: 0,
      currency: '',
      duration: '',
      durationInMonths: 0,
      livemode: false,
      maxRedemptions: '',
      name: '',
      percentOff: 0,
      redeemBy: 0,
      timesRedeemed: 0,
      valid: false);
}

class StripeSubscriptionCouponModal {
  StripeSubscriptionCouponModal({
    required this.id,
    required this.object,
    required this.amountOff,
    required this.created,
    required this.currency,
    required this.duration,
    required this.durationInMonths,
    required this.livemode,
    required this.maxRedemptions,
    this.metadata,
    required this.name,
    required this.percentOff,
    required this.redeemBy,
    required this.timesRedeemed,
    required this.valid,
  });

  final String id;
  final String object;
  final double amountOff;
  final int created;
  final String currency;
  final String duration;
  final int durationInMonths;
  final bool livemode;
  final dynamic maxRedemptions;
  final MetadataModal? metadata;
  final String name;
  final dynamic percentOff;
  final dynamic redeemBy;
  final int timesRedeemed;
  final bool valid;
  factory StripeSubscriptionCouponModal.empty() =>
      StripeSubscriptionCouponModal(
          id: '',
          object: '',
          amountOff: 0,
          created: 0,
          currency: '',
          duration: '',
          durationInMonths: 0,
          livemode: false,
          maxRedemptions: '',
          name: '',
          percentOff: 0,
          redeemBy: 0,
          timesRedeemed: 0,
          valid: false);
}

class MetadataModal {
  MetadataModal();
}

// extension StripeRegularCouponfromHiveModal on StripeRegularCouponHiveModal {
//   StripeRegularCouponModal fromHiveModal() {
//     return StripeRegularCouponModal(
//         id: id,
//         object: object,
//         amountOff: amountOff,
//         created: created,
//         currency: currency,
//         duration: duration,
//         durationInMonths: durationInMonths,
//         livemode: livemode,
//         maxRedemptions: maxRedemptions,
//         metadata: metadataHive?.fromHive(),
//         name: name,
//         percentOff: percentOff,
//         redeemBy: redeemBy,
//         timesRedeemed: timesRedeemed,
//         valid: valid);
//   }
// }
//
// extension StripeSubscriptionCouponModalfromHiveModal
//     on StripeSubscriptionCouponHiveModal {
//   StripeSubscriptionCouponModal fromHiveToModal() {
//     return StripeSubscriptionCouponModal(
//         id: id,
//         object: object,
//         amountOff: amountOff,
//         created: created,
//         currency: currency,
//         duration: duration,
//         durationInMonths: durationInMonths,
//         livemode: livemode,
//         maxRedemptions: maxRedemptions,
//         metadata: metadataHive?.fromHive(),
//         name: name,
//         percentOff: percentOff,
//         redeemBy: redeemBy,
//         timesRedeemed: timesRedeemed,
//         valid: valid);
//   }
// }
//
// extension MetadatafromHiveModal on MetadataHive {
//   MetadataModal fromHive() {
//     return MetadataModal();
//   }
// }
