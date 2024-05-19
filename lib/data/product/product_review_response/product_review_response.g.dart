// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductReviewResponse _$ProductReviewResponseFromJson(
        Map<String, dynamic> json) =>
    ProductReviewResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductReviewResponseToJson(
        ProductReviewResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
