import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'product.dart';

part 'create_order_payload_refId.g.dart';

@JsonSerializable()
class CreateOrderPayloadRefId {
  List<CreateOrderRequestProduct> products;
  double? total;
  CreateOrderRequestAddress? address;
  String paymentStatus;
  String paymentMethod;
  String? couponCode;
  String type;
  String origin;
  String sessionId;
  String referalUserId;
  String customer;
  double orderTotal;
  String currency;
  String currencySymbol;
  String paymentMode;
  List paymentLogs;

  CreateOrderPayloadRefId(
      {required this.products,
      this.total,
      this.address,
      required this.paymentStatus,
      required this.paymentMethod,
      this.couponCode,
      required this.type,
      required this.customer,
      required this.orderTotal,
      required this.currency,
      required this.currencySymbol,
      required this.paymentMode,
      required this.origin,
      required this.sessionId,
      required this.referalUserId,
      required this.paymentLogs});

  factory CreateOrderPayloadRefId.fromJson(Map<String, dynamic> json) {
    return _$CreateOrderRefIdPayloadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateOrderRefIdPayloadToJson(this);
}
