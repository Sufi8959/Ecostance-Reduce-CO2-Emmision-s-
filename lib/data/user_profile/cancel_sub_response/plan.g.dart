// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      id: json['id'] as String?,
      object: json['object'] as String?,
      active: json['active'] as bool?,
      aggregateUsage: json['aggregate_usage'],
      amount: json['amount'] as int?,
      amountDecimal: json['amount_decimal'] as String?,
      billingScheme: json['billing_scheme'] as String?,
      created: json['created'] as int?,
      currency: json['currency'] as String?,
      interval: json['interval'] as String?,
      intervalCount: json['interval_count'] as int?,
      livemode: json['livemode'] as bool?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      nickname: json['nickname'],
      product: json['product'] as String?,
      tiersMode: json['tiers_mode'],
      transformUsage: json['transform_usage'],
      trialPeriodDays: json['trial_period_days'],
      usageType: json['usage_type'] as String?,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'active': instance.active,
      'aggregate_usage': instance.aggregateUsage,
      'amount': instance.amount,
      'amount_decimal': instance.amountDecimal,
      'billing_scheme': instance.billingScheme,
      'created': instance.created,
      'currency': instance.currency,
      'interval': instance.interval,
      'interval_count': instance.intervalCount,
      'livemode': instance.livemode,
      'metadata': instance.metadata,
      'nickname': instance.nickname,
      'product': instance.product,
      'tiers_mode': instance.tiersMode,
      'transform_usage': instance.transformUsage,
      'trial_period_days': instance.trialPeriodDays,
      'usage_type': instance.usageType,
    };
