import 'package:json_annotation/json_annotation.dart';

import 'standard.dart';

part 'project.g.dart';

@JsonSerializable()
class GetCertificateResponseProject {
  String? name;
  String? owner;
  String? number;
  String? state;
  List<GetCertificateResponseStandard>? standards;
  List<dynamic>? intermediaries;

  GetCertificateResponseProject({
    this.name,
    this.owner,
    this.number,
    this.state,
    this.standards,
    this.intermediaries,
  });

  factory GetCertificateResponseProject.fromJson(Map<String, dynamic> json) {
    return _$GetCertificateResponseProjectFromJson(json);
  }
}
