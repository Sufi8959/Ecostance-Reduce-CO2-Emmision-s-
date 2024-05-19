import 'package:json_annotation/json_annotation.dart';

part 'certificate.g.dart';

@JsonSerializable()
class Certificate {
  @JsonKey(name: '_id')
  String? id;
  String? originNumber;
  String? customer;
  String? userCertificateSlug;
  String? order;
  String? product;
  @JsonKey(name: 'certificateURL')
  String? certificateUrl;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  String? transactionId;

  Certificate({
    this.id,
    this.originNumber,
    this.customer,
    this.userCertificateSlug,
    this.order,
    this.product,
    this.certificateUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.transactionId,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return _$CertificateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}
