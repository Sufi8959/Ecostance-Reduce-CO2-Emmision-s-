part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started(
      {required CheckoutType checkoutType,
      CouponStateModal? couponStateModal,
      ProductCartModal? productCartModal}) = CheckoutEventStarted;

  const factory CheckoutEvent.startRegularCheckout({
    required CheckoutType checkoutType,
  }) = CheckoutEventRegularCheckoutStarted;

  const factory CheckoutEvent.startExpressCheckout(
          {required CheckoutType checkoutType,
          required ProductCartModal productCartModal}) =
      CheckoutEventExpressCheckoutStarted;

  const factory CheckoutEvent.alterItem(
      {required ProductCartModal product,
      required AlterItemAction action}) = CheckoutEventAlterItem;
  const factory CheckoutEvent.saveCart(
      {required Map<String, ProductCartModal> products,
      required String currency,
      required bool itemsPreLogin,
      required SaveActionType saveActionType,
      required ProductCartModal productCartModal}) = CheckoutSaveCart;

  const factory CheckoutEvent.applyCoupon(
      {required String code,
      required CheckoutType checkoutType}) = CheckoutEventApplyCoupon;
  const factory CheckoutEvent.removeCoupon(
      {required CheckoutType checkoutType}) = CheckoutEventRemoveCoupon;

  const factory CheckoutEvent.done() = CheckoutEventDone;

  const factory CheckoutEvent.cancelled() = CheckoutEventcancelled;
  const factory CheckoutEvent.onLogout() = CheckoutEventonLogout;
  const factory CheckoutEvent.changeCurrency({required String newCurrency}) =
      CheckoutEventchangeCurrency;

  const factory CheckoutEvent.changeEmissionPopupStatus(
      {required bool newStatus}) = CheckoutEventchangeEmissionPopupStatus;

  const factory CheckoutEvent.updateUser() = CheckoutEventUpdateUser;
  const factory CheckoutEvent.billingAddressUpdate(
      BillingAddressModal billingAddressModal) = CheckoutEventUpdateAdress;
  const factory CheckoutEvent.deleteItem(
      {required ProductCartModal productCartModal}) = CheckoutEventDeleteItem;
  const factory CheckoutEvent.setLoading({required bool newStatus}) =
      CheckoutEventsetLoading;
}
