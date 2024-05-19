// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReviewByOrderProductIdsResponseData
    _$GetReviewByOrderProductIdsResponseDataFromJson(
            Map<String, dynamic> json) =>
        GetReviewByOrderProductIdsResponseData(
          id: json['_id'] as String?,
          product: json['product'] as String?,
          customer: json['customer'] as String?,
          order: json['order'] as String?,
          rating: (json['rating'] as num?)?.toDouble(),
          comment: json['comment'] as String?,
          isReviewed: json['isReviewed'] as bool?,
          status: json['status'] as int?,
          createdAt: json['createdAt'] == null
              ? null
              : DateTime.tryParse(json['createdAt'] as String),
          updatedAt: json['updatedAt'] == null
              ? null
              : DateTime.tryParse(json['updatedAt'] as String),
          v: json['__v'] as int?,
        );

Map<String, dynamic> _$GetReviewByOrderProductIdsResponseDataToJson(
        GetReviewByOrderProductIdsResponseData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'product': instance.product,
      'customer': instance.customer,
      'order': instance.order,
      'rating': instance.rating,
      'comment': instance.comment,
      'isReviewed': instance.isReviewed,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
