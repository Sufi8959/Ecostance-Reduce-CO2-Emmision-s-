import 'package:json_annotation/json_annotation.dart';

part 'standard.g.dart';

@JsonSerializable()
class Standard {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'id')
  String? standardId;
  String? type;
  String? name;
  String? companyWebsite;
  String? methodology;
  String? logo;
  String? link;
  String? description;

  Standard({
    this.id,
    this.standardId,
    this.type,
    this.name,
    this.companyWebsite,
    this.methodology,
    this.logo,
    this.link,
    this.description,
  });

  factory Standard.fromJson(Map<String, dynamic> json) {
    return _$StandardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StandardToJson(this);
}
