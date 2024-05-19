import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class LocationImage {
  String? link;
  String? size;

  LocationImage({this.link, this.size});

  factory LocationImage.fromJson(Map<String, dynamic> json) =>
      _$LocationImageFromJson(json);

  Map<String, dynamic> toJson() => _$LocationImageToJson(this);
}
