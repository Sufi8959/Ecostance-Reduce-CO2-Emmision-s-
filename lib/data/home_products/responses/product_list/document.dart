import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {
  String? name;
  String? link;

  Document({this.name, this.link});

  factory Document.fromJson(Map<String, dynamic> json) {
    return _$DocumentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
