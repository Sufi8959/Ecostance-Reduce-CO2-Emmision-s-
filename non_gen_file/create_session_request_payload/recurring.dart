import 'package:json_annotation/json_annotation.dart';

part 'recurring.g.dart';

@JsonSerializable()
class Recurring {
  String? interval;

  Recurring({this.interval});

  factory Recurring.fromJson(Map<String, dynamic> json) {
    return _$RecurringFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecurringToJson(this);
}
