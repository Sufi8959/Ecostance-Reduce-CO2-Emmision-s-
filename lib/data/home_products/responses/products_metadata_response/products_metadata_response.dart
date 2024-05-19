import 'package:json_annotation/json_annotation.dart';

part 'products_metadata_response.g.dart';

@JsonSerializable()
class ProductsMetadataResponse {
  int? total;
  int? totalPages;
  int? currentPage;
  dynamic nextPage;

  ProductsMetadataResponse({
    this.total,
    this.totalPages,
    this.currentPage,
    this.nextPage,
  });

  factory ProductsMetadataResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductsMetadataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsMetadataResponseToJson(this);
}
