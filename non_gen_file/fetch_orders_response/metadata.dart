import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable()
class Metadata {
  int? total;
  int? totalPages;
  int? currentPage;
  dynamic nextPage;

  Metadata({this.total, this.totalPages, this.currentPage, this.nextPage});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
