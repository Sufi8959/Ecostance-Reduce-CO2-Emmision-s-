import 'package:json_annotation/json_annotation.dart';

import 'auditor.dart';
import 'document.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  String? exchange;
  String? scale;
  String? id;
  String? link;
  String? participants;
  String? size;
  DateTime? start;
  String? completion;
  String? validator;
  String? validatorLink;
  String? monitor;
  String? monitorNotes;
  String? monitorLink;
  List<Auditor>? auditor;
  String? information;
  List<String>? owners;
  String? developers;
  String? funders;
  List<Document>? documents;

  Project({
    this.exchange,
    this.scale,
    this.id,
    this.link,
    this.participants,
    this.size,
    this.start,
    this.completion,
    this.validator,
    this.validatorLink,
    this.monitor,
    this.monitorNotes,
    this.monitorLink,
    this.auditor,
    this.information,
    this.owners,
    this.developers,
    this.funders,
    this.documents,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return _$ProjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
