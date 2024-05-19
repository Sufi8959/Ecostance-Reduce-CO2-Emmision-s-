import 'package:json_annotation/json_annotation.dart';

part 'total_details.g.dart';

@JsonSerializable()
class TotalDetails {
  @JsonKey(name: 'amount_discount')
  double? amountDiscount;
  @JsonKey(name: 'amount_shipping')
  double? amountShipping;
  @JsonKey(name: 'amount_tax')
  double? amountTax;

  TotalDetails({this.amountDiscount, this.amountShipping, this.amountTax});

  factory TotalDetails.fromJson(Map<String, dynamic> json) {
    return _$TotalDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TotalDetailsToJson(this);
}
