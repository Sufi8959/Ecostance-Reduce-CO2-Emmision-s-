import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import 'recurring.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
  String? id;
  String? object;
  bool? active;
  @JsonKey(name: 'billing_scheme')
  String? billingScheme;
  int? created;
  String? currency;
  @JsonKey(name: 'custom_unit_amount')
  dynamic customUnitAmount;
  bool? livemode;
  @JsonKey(name: 'lookup_key')
  dynamic lookupKey;
  Metadata? metadata;
  dynamic nickname;
  String? product;
  Recurring? recurring;
  @JsonKey(name: 'tax_behavior')
  String? taxBehavior;
  @JsonKey(name: 'tiers_mode')
  dynamic tiersMode;
  @JsonKey(name: 'transform_quantity')
  dynamic transformQuantity;
  String? type;
  @JsonKey(name: 'unit_amount')
  int? unitAmount;
  @JsonKey(name: 'unit_amount_decimal')
  String? unitAmountDecimal;

  Price({
    this.id,
    this.object,
    this.active,
    this.billingScheme,
    this.created,
    this.currency,
    this.customUnitAmount,
    this.livemode,
    this.lookupKey,
    this.metadata,
    this.nickname,
    this.product,
    this.recurring,
    this.taxBehavior,
    this.tiersMode,
    this.transformQuantity,
    this.type,
    this.unitAmount,
    this.unitAmountDecimal,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
