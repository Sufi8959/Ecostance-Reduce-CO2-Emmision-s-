import 'package:json_annotation/json_annotation.dart';

import 'product_data.dart';
import 'recurring.dart';

part 'price_data.g.dart';

@JsonSerializable()
class PriceData {
  String? currency;
  @JsonKey(name: 'product_data')
  ProductData? productData;
  @JsonKey(name: 'unit_amount_decimal')
  String? unitAmountDecimal;
  Recurring? recurring;

  PriceData({
    this.currency,
    this.productData,
    this.unitAmountDecimal,
    this.recurring,
  });

  factory PriceData.fromJson(Map<String, dynamic> json) {
    return _$PriceDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PriceDataToJson(this);
}
