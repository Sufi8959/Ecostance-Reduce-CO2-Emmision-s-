import 'package:json_annotation/json_annotation.dart';

import 'order.dart';
import 'user.dart';

part 'create_order_response.g.dart';

@JsonSerializable()
class CreateOrderResponse {
  @JsonKey(name: 'data')
  Order? order;
  User? user;
  String? slug;

  CreateOrderResponse({this.order, this.user, this.slug});

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateOrderResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateOrderResponseToJson(this);
}
