import 'package:json_annotation/json_annotation.dart';

part 'recurring.g.dart';

@JsonSerializable()
class Recurring {
  @JsonKey(name: 'aggregate_usage')
  dynamic aggregateUsage;
  String? interval;
  @JsonKey(name: 'interval_count')
  int? intervalCount;
  @JsonKey(name: 'trial_period_days')
  dynamic trialPeriodDays;
  @JsonKey(name: 'usage_type')
  String? usageType;

  Recurring({
    this.aggregateUsage,
    this.interval,
    this.intervalCount,
    this.trialPeriodDays,
    this.usageType,
  });

  factory Recurring.fromJson(Map<String, dynamic> json) {
    return _$RecurringFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecurringToJson(this);
}
