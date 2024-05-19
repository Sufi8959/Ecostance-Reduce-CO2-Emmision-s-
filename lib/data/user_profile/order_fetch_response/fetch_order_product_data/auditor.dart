import 'package:json_annotation/json_annotation.dart';

part 'auditor.g.dart';

@JsonSerializable()
class Auditor {
  String? name;
  String? notes;
  String? link;

  Auditor({this.name, this.notes, this.link});

  factory Auditor.fromJson(Map<String, dynamic> json) {
    return _$AuditorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuditorToJson(this);
}
