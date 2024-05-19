import 'package:json_annotation/json_annotation.dart';

part 'standard.g.dart';

@JsonSerializable()
class GetCertificateResponseStandard {
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

  GetCertificateResponseStandard({
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

  factory GetCertificateResponseStandard.fromJson(Map<String, dynamic> json) {
    return _$GetCertificateResponseStandardFromJson(json);
  }
}
