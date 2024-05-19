import 'package:json_annotation/json_annotation.dart';

part 'price_list.g.dart';

@JsonSerializable()
class PriceList {
  double? price;
  String? currency;
  double? oldPrice;
  String? currencySymbol;

  PriceList({
    this.price,
    this.currency,
    this.oldPrice,
    this.currencySymbol,
  });

  factory PriceList.fromJson(Map<String, dynamic> json) {
    return _$PriceListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PriceListToJson(this);
}
