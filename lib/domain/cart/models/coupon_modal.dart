import 'package:net_carbons/domain/cart/models/apply_coupon.dart';
import 'package:net_carbons/domain/cart/models/server_resp_modals.dart';

class CouponStateModal {
  CouponStateModal({
    required this.name,
    required this.stripePaymentId,
    required this.stripeSubscriptionId,
    required this.discountUnit,
    required this.couponType,
  });

  String name;
  String stripeSubscriptionId;
  String stripePaymentId;
  String couponType;
  double discountUnit;
}

extension CouponStateModalFromApplyCoupon on ApplyCouponResponseModal {
  CouponStateModal toCouponStateModal() {
    return CouponStateModal(
        name: stripePaymentCoupon.name,
        stripePaymentId: stripePaymentCoupon.id,
        stripeSubscriptionId: stripeSubscriptionCoupon.id,
        discountUnit: 0,
        couponType: '');
  }
}

extension CouponStateModalFromCartModal on CartServerModal {
  CouponStateModal toCouponStateModal() {
    return CouponStateModal(
        name: coupon,
        stripePaymentId: stripePaymentCouponId,
        stripeSubscriptionId: stripeSubscriptionCouponId,
        discountUnit: discountUnit,
        couponType: couponType);
  }
}

// extension CouponStateModalFromSaveCartModal on CartSaveModal {
//   CouponStateModal toCouponStateModal() {
//     return CouponStateModal(
//         name: coupon,
//         stripePaymentId: stripePaymentCouponId,
//         stripeSubscriptionId: stripeSubscriptionCouponId);
//   }
// }
