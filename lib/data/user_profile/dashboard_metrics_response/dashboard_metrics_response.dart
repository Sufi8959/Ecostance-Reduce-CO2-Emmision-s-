import 'package:json_annotation/json_annotation.dart';

part 'dashboard_metrics_response.g.dart';

@JsonSerializable()
class DashboardMetricsResponse {
  int? ghgReduced;
  int? treesPlanted;
  int? projectsSupportedCount;

  DashboardMetricsResponse({
    this.ghgReduced,
    this.treesPlanted,
    this.projectsSupportedCount,
  });

  factory DashboardMetricsResponse.fromJson(Map<String, dynamic> json) {
    return _$DashboardMetricsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DashboardMetricsResponseToJson(this);
}
