import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import 'order.dart';

part 'order_fetch_response.g.dart';

@JsonSerializable()
class OrderFetchResponse {
  Metadata? metadata;
  @JsonKey(name: 'data')
  List<Order>? orders;

  OrderFetchResponse({this.metadata, this.orders});

  factory OrderFetchResponse.fromJson(Map<String, dynamic> json) {
    return _$OrderFetchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderFetchResponseToJson(this);
}
