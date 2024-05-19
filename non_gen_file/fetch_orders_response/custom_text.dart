import 'package:json_annotation/json_annotation.dart';

part 'custom_text.g.dart';

@JsonSerializable()
class CustomText {
  @JsonKey(name: 'shipping_address')
  dynamic shippingAddress;
  dynamic submit;

  CustomText({this.shippingAddress, this.submit});

  factory CustomText.fromJson(Map<String, dynamic> json) {
    return _$CustomTextFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomTextToJson(this);
}
