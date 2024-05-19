// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewCustomerResponse _$ReviewCustomerResponseFromJson(
        Map<String, dynamic> json) =>
    ReviewCustomerResponse(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : ReviewUserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewCustomerResponseToJson(
        ReviewCustomerResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
    };
