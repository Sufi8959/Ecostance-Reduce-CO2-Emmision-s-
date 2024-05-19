import 'package:json_annotation/json_annotation.dart';

import 'billing_address.dart';
import 'certificate.dart';
import 'coupon.dart';
import 'customer.dart';
import 'invoice.dart';
import 'payment_log.dart';
import 'product.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: '_id')
  String? id;
  String? orderNumber;
  List<Product>? products;
  Customer? customer;
  double? orderTotal;
  double? calculatedCouponDiscount;
  double? subTotal;
  String? currency;
  String? currencySymbol;
  BillingAddress? billingAddress;
  int? carbonOffsetEarned;
  double? amountPaid;
  int? amountRemaining;
  String? paymentMode;
  String? paymentMethod;
  List<PaymentLog>? paymentLogs;
  String? paymentStatus;
  int? subscriptionCancelledAt;
  List<Certificate>? certificates;
  Coupon? coupon;
  String? couponCode;
  int? status;
  int? emailSentStatus;
  int? metricsCalculatedStatus;
  int? isSubscriptionCycleCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  Invoice? invoice;

  Datum({
    this.id,
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
    this.amountPaid,
    this.amountRemaining,
    this.paymentMode,
    this.paymentMethod,
    this.paymentLogs,
    this.paymentStatus,
    this.subscriptionCancelledAt,
    this.certificates,
    this.coupon,
    this.couponCode,
    this.status,
    this.emailSentStatus,
    this.metricsCalculatedStatus,
    this.isSubscriptionCycleCompleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.invoice,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
