import 'package:json_annotation/json_annotation.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  @JsonKey(name: '_id')
  String? id;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  String? filePath;

  Invoice({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.filePath,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return _$InvoiceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
