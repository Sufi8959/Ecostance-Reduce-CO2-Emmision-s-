// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalDetails _$TotalDetailsFromJson(Map<String, dynamic> json) => TotalDetails(
      amountDiscount: (json['amount_discount'] as num?)?.toDouble(),
      amountShipping: (json['amount_shipping'] as num?)?.toDouble(),
      amountTax: (json['amount_tax'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TotalDetailsToJson(TotalDetails instance) =>
    <String, dynamic>{
      'amount_discount': instance.amountDiscount,
      'amount_shipping': instance.amountShipping,
      'amount_tax': instance.amountTax,
    };
