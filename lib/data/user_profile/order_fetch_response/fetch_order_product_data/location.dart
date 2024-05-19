import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String? lat;
  String? long;
  String? description;
  String? lang;

  Location({this.lat, this.long, this.description, this.lang});

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
