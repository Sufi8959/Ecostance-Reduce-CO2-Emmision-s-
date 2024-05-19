import 'package:net_carbons/domain/home_products/modal/models.dart';

class CartServerModal {
  CartServerModal(
      {required this.id,
      required this.customer,
      required this.products,
      required this.createdAt,
      required this.updatedAt,
      required this.v,
      required this.stripeSubscriptionCouponId,
      required this.coupon,
      required this.stripePaymentCouponId,
      required this.discount,
      required this.subTotal,
      required this.orderTotal,
      required this.discountUnit,
      required this.couponType,
      required this.orderTotalWithinStripeRange,this.temporaryCheckoutCurrency});

  String id;
  CartCustomerData customer;
  List<CartServerProductElementModal> products;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String coupon;
  String stripePaymentCouponId;
  String stripeSubscriptionCouponId;
  double discount;
  double orderTotal;
  double subTotal;
  double discountUnit;
  String couponType;
  bool orderTotalWithinStripeRange;
  String? temporaryCheckoutCurrency;
}

class CartServerProductElementModal {
  CartServerProductElementModal({
    required this.product,
    required this.quantity,
    required this.status,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  ProductModal product;
  int quantity;
  int status;
  String id;
  DateTime updatedAt;
  DateTime createdAt;
}

class CartServerProductIdModal {
  CartServerProductIdModal({
    required this.id,
  });

  String id;
}

class CartServerResponseProductIdModal {
  CartServerResponseProductIdModal({
    required this.id,
  });

  String id;
  factory CartServerResponseProductIdModal.empty() =>
      CartServerResponseProductIdModal(id: '');
}

class CartCustomerData {
  CartCustomerData({
     this.checkoutDefaultCurrency,
  });

  final String? checkoutDefaultCurrency;
}
