import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: '_id')
  String? id;
  String? product;
  String? customer;
  String? order;
  double? rating;
  String? comment;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  Datum({
    this.id,
    this.product,
    this.customer,
    this.order,
    this.rating,
    this.comment,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
