// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_review_by_order_product_ids_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReviewByOrderProductIdsResponse _$GetReviewByOrderProductIdsResponseFromJson(
        Map<String, dynamic> json) =>
    GetReviewByOrderProductIdsResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : GetReviewByOrderProductIdsResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetReviewByOrderProductIdsResponseToJson(
        GetReviewByOrderProductIdsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
