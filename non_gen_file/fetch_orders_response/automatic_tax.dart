import 'package:json_annotation/json_annotation.dart';

part 'automatic_tax.g.dart';

@JsonSerializable()
class AutomaticTax {
  bool? enabled;
  dynamic status;

  AutomaticTax({this.enabled, this.status});

  factory AutomaticTax.fromJson(Map<String, dynamic> json) {
    return _$AutomaticTaxFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AutomaticTaxToJson(this);
}
