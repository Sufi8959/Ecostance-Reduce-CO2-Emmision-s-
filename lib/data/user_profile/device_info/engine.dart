import 'package:json_annotation/json_annotation.dart';

part 'engine.g.dart';

@JsonSerializable()
class Engine {
  String? name;
  String? version;

  Engine({this.name, this.version});

  factory Engine.fromJson(Map<String, dynamic> json) {
    return _$EngineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EngineToJson(this);
}
