// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceData _$PriceDataFromJson(Map<String, dynamic> json) => PriceData(
  currency: json['currency'] as String?,
  productData: json['product_data'] == null
      ? null
      : ProductData.fromJson(json['product_data'] as Map<String, dynamic>),
  unitAmountDecimal: json['unit_amount_decimal'] as String?,
  recurring: json['recurring'] == null
      ? null
      : Recurring.fromJson(json['recurring'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PriceDataToJson(PriceData instance) {
  Map<String, dynamic> map = <String, dynamic>{
    'currency': instance.currency,
    'product_data': instance.productData,
    'unit_amount_decimal': instance.unitAmountDecimal,
  };
  if (instance.recurring != null) {
    map.addAll({'recurring': instance.recurring?.toJson() ?? {}});
  } else {
    map.addAll({'recurring': {}});
  }

  return map;
}