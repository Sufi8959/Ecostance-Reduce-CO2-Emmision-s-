import 'package:json_annotation/json_annotation.dart';

import 'discount.dart';
import 'item.dart';

part 'create_session_request_payload.g.dart';

@JsonSerializable()
class CreateSessionRequestPayload {
  List<Item>? items;
  List<Discount> discounts;
  String? email;
  String? paymentMode;

  CreateSessionRequestPayload({
    this.items,
    required this.discounts,
    this.email,
    this.paymentMode,
  });

  factory CreateSessionRequestPayload.fromJson(Map<String, dynamic> json) {
    return _$CreateSessionRequestPayloadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateSessionRequestPayloadToJson(this);
}
