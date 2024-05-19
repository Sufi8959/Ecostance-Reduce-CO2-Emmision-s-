// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      priceData: json['price_data'] == null
          ? null
          : PriceData.fromJson(json['price_data'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'price_data': instance.priceData?.toJson() ?? {},
      'quantity': instance.quantity,
    };
