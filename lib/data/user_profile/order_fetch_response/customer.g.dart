// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['_id'] as String?,
      user: json['user'] as String?,
      address: json['address'] as List<dynamic>?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      ghgReduced: json['ghgReduced'] as int?,
      projectsSupported: (json['projectsSupported'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      projectsSupportedCount: json['projectsSupportedCount'] as int?,
      treesPlanted: json['treesPlanted'] as int?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'address': instance.address,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'ghgReduced': instance.ghgReduced,
      'projectsSupported': instance.projectsSupported,
      'projectsSupportedCount': instance.projectsSupportedCount,
      'treesPlanted': instance.treesPlanted,
    };
