// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_metrics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardMetricsResponse _$DashboardMetricsResponseFromJson(
        Map<String, dynamic> json) =>
    DashboardMetricsResponse(
      ghgReduced: json['ghgReduced'] as int?,
      treesPlanted: json['treesPlanted'] as int?,
      projectsSupportedCount: json['projectsSupportedCount'] as int?,
    );

Map<String, dynamic> _$DashboardMetricsResponseToJson(
        DashboardMetricsResponse instance) =>
    <String, dynamic>{
      'ghgReduced': instance.ghgReduced,
      'treesPlanted': instance.treesPlanted,
      'projectsSupportedCount': instance.projectsSupportedCount,
    };
