// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceList _$PriceListFromJson(Map<String, dynamic> json) => PriceList(
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      currencySymbol: json['currencySymbol'] as String?,
    );

Map<String, dynamic> _$PriceListToJson(PriceList instance) => <String, dynamic>{
      'price': instance.price,
      'currency': instance.currency,
      'oldPrice': instance.oldPrice,
      'currencySymbol': instance.currencySymbol,
    };
