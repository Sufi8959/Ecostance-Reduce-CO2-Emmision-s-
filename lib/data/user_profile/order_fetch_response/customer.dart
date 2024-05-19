import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  @JsonKey(name: '_id')
  String? id;
  String? user;
  List<dynamic>? address;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  int? ghgReduced;
  List<String>? projectsSupported;
  int? projectsSupportedCount;
  int? treesPlanted;

  Customer({
    this.id,
    this.user,
    this.address,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.ghgReduced,
    this.projectsSupported,
    this.projectsSupportedCount,
    this.treesPlanted,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return _$CustomerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
