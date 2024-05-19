class CartSaveResponseModal {
  CartSaveResponseModal({
    required this.cart,
  });

  CartSaveModal cart;
}

class CartSaveModal {
  CartSaveModal(
      {required this.id,
      required this.customer,
      required this.products,
      required this.createdAt,
      required this.updatedAt,
      required this.v,
      required this.stripeSubscriptionCouponId,
      required this.coupon,
      required this.stripePaymentCouponId});

  String id;
  String customer;
  List<ProductCartSaveModal> products;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String coupon;
  String stripePaymentCouponId;
  String stripeSubscriptionCouponId;

  factory CartSaveModal.empty() => CartSaveModal(
      id: '',
      customer: '',
      products: [],
      createdAt: DateTime.fromMicrosecondsSinceEpoch(1),
      updatedAt: DateTime.fromMicrosecondsSinceEpoch(1),
      v: 0,
      stripeSubscriptionCouponId: '',
      coupon: '',
      stripePaymentCouponId: '');
}

class ProductCartSaveModal {
  ProductCartSaveModal({
    required this.product,
    required this.quantity,
    required this.status,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  String product;
  int quantity;
  int status;
  String id;
  DateTime updatedAt;
  DateTime createdAt;
}
