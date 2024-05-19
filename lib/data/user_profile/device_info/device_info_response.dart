import 'package:json_annotation/json_annotation.dart';

import 'browser.dart';
import 'device.dart';
import 'engine.dart';

part 'device_info_response.g.dart';

@JsonSerializable()
class DeviceInfoResponse {
  String? ua;
  Browser? browser;
  Engine? engine;
  Engine? os;
  Device? device;

  DeviceInfoResponse({
    this.ua,
    this.browser,
    this.engine,
    this.os,
    this.device,
  });

  factory DeviceInfoResponse.fromJson(Map<String, dynamic> json) {
    return _$DeviceInfoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeviceInfoResponseToJson(this);
}
