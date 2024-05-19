import 'package:json_annotation/json_annotation.dart';

part 'std_method.g.dart';

@JsonSerializable()
class StdMethod {
  String? type;
  String? version;
  String? link;

  StdMethod({this.type, this.version, this.link});

  factory StdMethod.fromJson(Map<String, dynamic> json) {
    return _$StdMethodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StdMethodToJson(this);
}
