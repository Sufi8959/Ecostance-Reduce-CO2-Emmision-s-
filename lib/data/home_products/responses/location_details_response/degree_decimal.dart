import 'package:json_annotation/json_annotation.dart';

part 'degree_decimal.g.dart';

@JsonSerializable()
class DegreeDecimal {
  String? type;
  List<double>? coordinates;

  DegreeDecimal({this.type, this.coordinates});

  factory DegreeDecimal.fromJson(Map<String, dynamic> json) {
    return _$DegreeDecimalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DegreeDecimalToJson(this);
}
