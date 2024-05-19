part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.cartStarted() = CartStarted;
  const factory CartEvent.calculateTotal() = CartCalculateTotal;
  const factory CartEvent.addItem({required ProductCartModal product}) =
      AddItem;
  const factory CartEvent.alterItem(
      {required ProductCartModal product,
      required AlterItemAction action}) = AlterItem;
  const factory CartEvent.clear() = CartClear;

  const factory CartEvent.applyCoupon(String code) = CartApplyCoupon;
  // const factory CartEvent.updateCoupon(
  //     {required CouponStateModal couponStateModal,
  //     required double discount,
  //     required double subTotal,
  //     required double orderTotal}) = CartUpdateCoupon;
  const factory CartEvent.removeCoupon() = CartRemoveCoupon;
  const factory CartEvent.changeCurrency(String currency) = CartchangeCurrency;
  const factory CartEvent.setCartSyncedToServer(
          CartSyncedToServerOnAuth cartSyncedToServerOnAuth) =
      CartsetCartSyncedToServer;

  const factory CartEvent.saveCart(
      {required Map<String, ProductCartModal> products,
      required String currency,
      required bool itemsPreLogin,
      required SaveActionType saveActionType,
      required ProductCartModal productCartModal}) = CartSaveCart;
  const factory CartEvent.saveCartOnCheckout(
      {required Map<String, ProductCartModal> products,
      required ProductCartModal productCartModal}) = CartSaveCartOnCheckout;
}

enum AlterItemAction { increment, decrement, delete }

enum SaveActionType { update, remove,add }
//
//
// /v1/coupons/Festival123/apply
