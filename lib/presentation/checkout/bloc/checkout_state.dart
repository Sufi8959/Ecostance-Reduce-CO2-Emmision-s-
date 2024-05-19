part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  factory CheckoutState(
      {required int cartQuantity,
      required double cartTotal,
      required double discount,
      required double orderTotal,
      required double subTotal,
      required Map<String, ProductCartModal> products,
      required String paymentCurrency,
      UserProfileModal? userProfile,
      BillingAddressModal? billingAddress,
      required CheckoutType checkoutType,
      required bool isLoading,
      required bool onSession,
      CouponStateModal? couponStateModal,
      String? couponMessage,
      required bool couponHasError,
      required bool orderTotalWithinStripeRange,
      required bool isCouponLoading,
      required bool newExpressItemSavedToCart,
          required bool isItemsLoading,
      required bool shouldShowEmissionPopup}) = _CheckoutState;

  const factory CheckoutState.initial(
      {required int cartQuantity,
          required bool isItemsLoading,
      required double cartTotal,
      required double discount,
      required double orderTotal,
      required double subTotal,
      required Map<String, ProductCartModal> products,
      required String paymentCurrency,
      UserProfileModal? userProfile,
      BillingAddressModal? billingAddress,
      required CheckoutType checkoutType,
      CouponStateModal? couponStateModal,
      required bool isLoading,
      required bool onSession,
      String? couponMessage,
      required bool couponHasError,
      required bool orderTotalWithinStripeRange,
      required bool isCouponLoading,
      required bool newExpressItemSavedToCart,
      required bool shouldShowEmissionPopup}) = CheckoutStateInitial;
}

enum CheckoutType { express, regular, initial }
