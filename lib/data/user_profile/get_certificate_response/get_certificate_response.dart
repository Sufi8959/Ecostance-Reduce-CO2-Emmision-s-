import 'package:json_annotation/json_annotation.dart';

import 'buyer.dart';
import 'project.dart';

part 'get_certificate_response.g.dart';

@JsonSerializable()
class GetCertificateResponse {
  String? formattedNewOriginNumber;
  String? originNumber;
  int? quantity;
  GetCertificateResponseProject? project;
  GetCertificateResponseBuyer? buyer;

  GetCertificateResponse({
    this.formattedNewOriginNumber,
    this.originNumber,
    this.quantity,
    this.project,
    this.buyer,
  });

  factory GetCertificateResponse.fromJson(Map<String, dynamic> json) {
    return _$GetCertificateResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCertificateResponseToJson(this);
}
