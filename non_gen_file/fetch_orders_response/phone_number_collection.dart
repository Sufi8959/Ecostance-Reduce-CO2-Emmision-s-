import 'package:json_annotation/json_annotation.dart';

part 'phone_number_collection.g.dart';

@JsonSerializable()
class PhoneNumberCollection {
  bool? enabled;

  PhoneNumberCollection({this.enabled});

  factory PhoneNumberCollection.fromJson(Map<String, dynamic> json) {
    return _$PhoneNumberCollectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PhoneNumberCollectionToJson(this);
}
