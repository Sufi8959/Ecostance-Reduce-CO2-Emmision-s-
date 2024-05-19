import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'items.g.dart';

@JsonSerializable()
class Items {
  String? object;
  List<Datum>? data;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  @JsonKey(name: 'total_count')
  int? totalCount;
  String? url;

  Items({this.object, this.data, this.hasMore, this.totalCount, this.url});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
