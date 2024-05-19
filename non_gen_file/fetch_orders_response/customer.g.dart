// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['_id'] as String?,
      user: json['user'] as String?,
      address: json['address'] as List<dynamic>?,
      ghgReduced: json['ghgReduced'] as int?,
      treesPlanted: json['treesPlanted'] as int?,
      projectsSupported: (json['projectsSupported'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      projectsSupportedCount: json['projectsSupportedCount'] as int?,
      totalCarbonEmissions: json['totalCarbonEmissions'] as int?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      carbonCalculations: json['carbonCalculations'] == null
          ? null
          : CarbonCalculations.fromJson(
              json['carbonCalculations'] as Map<String, dynamic>),
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'address': instance.address,
      'ghgReduced': instance.ghgReduced,
      'treesPlanted': instance.treesPlanted,
      'projectsSupported': instance.projectsSupported,
      'projectsSupportedCount': instance.projectsSupportedCount,
      'totalCarbonEmissions': instance.totalCarbonEmissions,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'carbonCalculations': instance.carbonCalculations,
      'companyName': instance.companyName,
    };
