import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/fetch_order_product_data/fetch_order_product_data.dart';

part 'product.g.dart';

@JsonSerializable()
class OrderProductElement {
  @JsonKey(name: 'product')
  FetchOrderProductData? product;
  double? price;
  int? quantity;
  OrderProductCertificateResponse? certificate;
  @JsonKey(name: '_id')
  String? id;
  DateTime? updatedAt;
  DateTime? createdAt;

  OrderProductElement({
    this.product,
    this.price,
    this.quantity,
    this.certificate,
    this.id,
    this.updatedAt,
    this.createdAt,
  });

  factory OrderProductElement.fromJson(Map<String, dynamic> json) {
    return _$OrderProductElementFromJson(json);
  }
}

@JsonSerializable()
class OrderProductCertificateResponse {
  OrderProductCertificateResponse({
    required this.originNumber,
    required this.certificateURL,
  });

  final String? originNumber;
  final String? certificateURL;
  factory OrderProductCertificateResponse.fromJson(Map<String, dynamic> json) {
    return _$OrderProductCertificateResponseFromJson(json);
  }
}



