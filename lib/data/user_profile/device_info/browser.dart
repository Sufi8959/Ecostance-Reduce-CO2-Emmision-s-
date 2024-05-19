import 'package:json_annotation/json_annotation.dart';

part 'browser.g.dart';

@JsonSerializable()
class Browser {
  String? name;
  String? version;
  String? major;

  Browser({this.name, this.version, this.major});

  factory Browser.fromJson(Map<String, dynamic> json) {
    return _$BrowserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrowserToJson(this);
}
