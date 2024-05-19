import 'package:json_annotation/json_annotation.dart';

import 'price_data.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  @JsonKey(name: 'price_data')
  PriceData? priceData;
  int? quantity;

  Item({this.priceData, this.quantity});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
