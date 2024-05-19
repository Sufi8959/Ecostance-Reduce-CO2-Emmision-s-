import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'product.dart';

part 'create_order_payload.g.dart';

@JsonSerializable()
class CreateOrderPayload {
  List<CreateOrderRequestProduct> products;
  double? total;
  CreateOrderRequestAddress? address;
  String paymentStatus;
  String paymentMethod;
  String? couponCode;
  String type;
  String origin;
  String sessionId;
  String customer;
  double orderTotal;
  String currency;
  String currencySymbol;
  String paymentMode;
  List paymentLogs;

  CreateOrderPayload(
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
      required this.paymentLogs});

  factory CreateOrderPayload.fromJson(Map<String, dynamic> json) {
    return _$CreateOrderPayloadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateOrderPayloadToJson(this);
}
