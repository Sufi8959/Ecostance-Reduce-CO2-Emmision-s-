import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';

part 'plan.g.dart';

@JsonSerializable()
class Plan {
  String? id;
  String? object;
  bool? active;
  @JsonKey(name: 'aggregate_usage')
  dynamic aggregateUsage;
  int? amount;
  @JsonKey(name: 'amount_decimal')
  String? amountDecimal;
  @JsonKey(name: 'billing_scheme')
  String? billingScheme;
  int? created;
  String? currency;
  String? interval;
  @JsonKey(name: 'interval_count')
  int? intervalCount;
  bool? livemode;
  Metadata? metadata;
  dynamic nickname;
  String? product;
  @JsonKey(name: 'tiers_mode')
  dynamic tiersMode;
  @JsonKey(name: 'transform_usage')
  dynamic transformUsage;
  @JsonKey(name: 'trial_period_days')
  dynamic trialPeriodDays;
  @JsonKey(name: 'usage_type')
  String? usageType;

  Plan({
    this.id,
    this.object,
    this.active,
    this.aggregateUsage,
    this.amount,
    this.amountDecimal,
    this.billingScheme,
    this.created,
    this.currency,
    this.interval,
    this.intervalCount,
    this.livemode,
    this.metadata,
    this.nickname,
    this.product,
    this.tiersMode,
    this.transformUsage,
    this.trialPeriodDays,
    this.usageType,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
