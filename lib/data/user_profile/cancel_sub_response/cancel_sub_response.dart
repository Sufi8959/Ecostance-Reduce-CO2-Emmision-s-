import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'cancel_sub_response.g.dart';

@JsonSerializable()
class CancelSubResponse {
  bool? success;
  Data? data;

  CancelSubResponse({this.success, this.data});

  factory CancelSubResponse.fromJson(Map<String, dynamic> json) {
    return _$CancelSubResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CancelSubResponseToJson(this);
}
