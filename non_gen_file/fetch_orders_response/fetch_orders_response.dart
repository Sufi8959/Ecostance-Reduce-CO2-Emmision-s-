import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'metadata.dart';

part 'fetch_orders_response.g.dart';

@JsonSerializable()
class FetchOrdersResponse {
  bool? success;
  Metadata? metadata;
  List<Datum>? data;

  FetchOrdersResponse({this.success, this.metadata, this.data});

  factory FetchOrdersResponse.fromJson(Map<String, dynamic> json) {
    return _$FetchOrdersResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FetchOrdersResponseToJson(this);
}
