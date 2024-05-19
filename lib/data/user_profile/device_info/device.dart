import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  String? vendor;
  String? model;

  Device({this.vendor, this.model});

  factory Device.fromJson(Map<String, dynamic> json) {
    return _$DeviceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
