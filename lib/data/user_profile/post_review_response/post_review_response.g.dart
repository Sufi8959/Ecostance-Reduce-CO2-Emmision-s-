// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReviewResponse _$PostReviewResponseFromJson(Map<String, dynamic> json) =>
    PostReviewResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostReviewResponseToJson(PostReviewResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
