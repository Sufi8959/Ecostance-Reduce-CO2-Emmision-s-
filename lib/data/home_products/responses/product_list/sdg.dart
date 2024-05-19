import 'package:json_annotation/json_annotation.dart';

import 'sdg_details.dart';

part 'sdg.g.dart';

@JsonSerializable()
class Sdg {
  @JsonKey(name: 'sdg')
  SdgDetails? sdgDetails;
  String? details;
  bool? fulFilled;

  Sdg({this.sdgDetails, this.details, this.fulFilled});

  factory Sdg.fromJson(Map<String, dynamic> json) {
    return _$SdgFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SdgToJson(this);
}
