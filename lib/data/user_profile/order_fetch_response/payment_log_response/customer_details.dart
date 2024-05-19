import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'customer_details.g.dart';

@JsonSerializable()
class CustomerDetails {
  Address? address;
  String? email;
  String? name;
  dynamic phone;
  @JsonKey(name: 'tax_exempt')
  String? taxExempt;
  @JsonKey(name: 'tax_ids')
  List<dynamic>? taxIds;

  CustomerDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.taxExempt,
    this.taxIds,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return _$CustomerDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}
