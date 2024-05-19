import 'package:json_annotation/json_annotation.dart';

part 'automatic_tax.g.dart';

@JsonSerializable()
class AutomaticTax {
  bool? enabled;

  AutomaticTax({this.enabled});

  factory AutomaticTax.fromJson(Map<String, dynamic> json) {
    return _$AutomaticTaxFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AutomaticTaxToJson(this);
}
