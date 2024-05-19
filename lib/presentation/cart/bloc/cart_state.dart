part of 'cart_bloc.dart';

@Freezed()
class CartState with _$CartState {
  const factory CartState({
    required bool isLoading,
    required bool isCouponLoading,
    required bool isTotalsLoading,
    required bool couponHasError,
    required int cartQuantity,
    required double cartTotal,
    required double discount,
    required double orderTotal,
    required double subTotal,
    required Map<String, ProductCartModal> products,
    CouponStateModal? couponStateModal,
    required bool cartSavedManually,
    required CartSyncedToServerOnAuth cartSyncedToServer,
    String? couponMessage,
    required String currency,
  }) = _CartState;

  factory CartState.initial() => const CartState(

      isTotalsLoading: false,
      isLoading: false,
      cartQuantity: 0,
      cartTotal: 0.0,
      products: {},
      isCouponLoading: false,
      couponHasError: false,
      discount: 0,
      orderTotal: 0,
      cartSavedManually: false,
      subTotal: 0,
      cartSyncedToServer: CartSyncedToServerOnAuth.initial, currency: '');
}

enum CartSyncedToServerOnAuth { initial, synced, failed, syncing }
