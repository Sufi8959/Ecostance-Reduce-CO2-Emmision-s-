import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/coupon.dart';

import 'billing_address.dart';
import 'invoice.dart';
import 'product.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  String? id;
  String? orderNumber;
  List<CrateOrderResponseProduct>? products;
  String? customer;
  double? orderTotal;
  double? calculatedCouponDiscount;
  double? subTotal;
  String? currency;
  String? currencySymbol;
  BillingAddress? billingAddress;
  double? carbonOffsetEarned;
  String? paymentMode;
  String? paymentMethod;
  List<dynamic>? paymentLogs;
  String? paymentStatus;
  int? subscriptionCancelledAt;
  List<dynamic>? certificates;
  int? status;
  int? emailSentStatus;
  double? metricsCalculatedStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  Invoice? invoice;
  String? couponCode;
  Coupon? coupon;

  Order(
      {this.id,
      this.orderNumber,
      this.products,
      this.customer,
      this.orderTotal,
      this.calculatedCouponDiscount,
      this.subTotal,
      this.currency,
      this.currencySymbol,
      this.billingAddress,
      this.carbonOffsetEarned,
      this.paymentMode,
      this.paymentMethod,
      this.paymentLogs,
      this.paymentStatus,
      this.subscriptionCancelledAt,
      this.certificates,
      this.status,
      this.emailSentStatus,
      this.metricsCalculatedStatus,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.invoice,
      this.couponCode,
      this.coupon});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
