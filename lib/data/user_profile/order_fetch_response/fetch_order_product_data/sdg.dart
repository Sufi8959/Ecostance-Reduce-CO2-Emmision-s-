import 'package:json_annotation/json_annotation.dart';

part 'sdg.g.dart';

@JsonSerializable()
class Sdg {
  String? sdg;
  String? details;
  bool? fulFilled;

  Sdg({this.sdg, this.details, this.fulFilled});

  factory Sdg.fromJson(Map<String, dynamic> json) => _$SdgFromJson(json);

  Map<String, dynamic> toJson() => _$SdgToJson(this);
}
