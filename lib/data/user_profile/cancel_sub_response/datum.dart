import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import 'plan.dart';
import 'price.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? id;
  String? object;
  @JsonKey(name: 'billing_thresholds')
  dynamic billingThresholds;
  int? created;
  Metadata? metadata;
  Plan? plan;
  Price? price;
  int? quantity;
  String? subscription;
  @JsonKey(name: 'tax_rates')
  List<dynamic>? taxRates;

  Datum({
    this.id,
    this.object,
    this.billingThresholds,
    this.created,
    this.metadata,
    this.plan,
    this.price,
    this.quantity,
    this.subscription,
    this.taxRates,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
