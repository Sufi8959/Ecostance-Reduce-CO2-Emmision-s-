import 'package:json_annotation/json_annotation.dart';

part 'sdg_details.g.dart';

@JsonSerializable()
class SdgDetails {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  String? image;
  String? imageInvert;
  @JsonKey(name: '__v')
  int? v;
  int? index;

  SdgDetails({
    this.id,
    this.name,
    this.description,
    this.image,
    this.imageInvert,
    this.v,
    this.index,
  });

  factory SdgDetails.fromJson(Map<String, dynamic> json) {
    return _$SdgDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SdgDetailsToJson(this);
}
