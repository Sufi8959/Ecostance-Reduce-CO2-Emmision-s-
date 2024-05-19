import 'package:json_annotation/json_annotation.dart';

import 'degree_decimal.dart';
import 'image.dart';

part 'location_details_response.g.dart';

@JsonSerializable()
class LocationDetails {
  String? lat;
  String? long;
  DegreeDecimal? degreeDecimal;
  String? description;
  List<LocationImage>? images;

  LocationDetails({
    this.lat,
    this.long,
    this.degreeDecimal,
    this.description,
    this.images,
  });

  factory LocationDetails.fromJson(Map<String, dynamic> json) {
    return _$LocationDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationDetailsToJson(this);
}
