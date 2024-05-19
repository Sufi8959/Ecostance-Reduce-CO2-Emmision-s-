import 'package:json_annotation/json_annotation.dart';

part 'total_details.g.dart';

@JsonSerializable()
class TotalDetails {
  @JsonKey(name: 'amount_discount')
  int? amountDiscount;
  @JsonKey(name: 'amount_shipping')
  int? amountShipping;
  @JsonKey(name: 'amount_tax')
  int? amountTax;

  TotalDetails({this.amountDiscount, this.amountShipping, this.amountTax});

  factory TotalDetails.fromJson(Map<String, dynamic> json) {
    return _$TotalDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TotalDetailsToJson(this);
}
