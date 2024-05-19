import 'package:json_annotation/json_annotation.dart';

part 'buyer.g.dart';

@JsonSerializable()
class GetCertificateResponseBuyer {
  String? firstName;
  String? lastName;
  String? city;
  String? state;
  String? country;
  String? pincode;
  DateTime? deliveryDate;
  String? transactionId;

  GetCertificateResponseBuyer({
    this.firstName,
    this.lastName,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.deliveryDate,
    this.transactionId,
  });

  factory GetCertificateResponseBuyer.fromJson(Map<String, dynamic> json) =>
      _$GetCertificateResponseBuyerFromJson(json);
}
