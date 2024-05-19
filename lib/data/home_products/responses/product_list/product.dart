import 'package:json_annotation/json_annotation.dart';

import 'category_list.dart';
import 'details.dart';
import 'price_list.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  List<dynamic>? docLinks;
  @JsonKey(name: '_id')
  String? id;
  List<String>? tag;
  @JsonKey(name: 'id')

  ///TODO: Decide final type
  String? productId;
  String? formalName;
  int? stock;
  String? category;
  String? state;
  String? country;
  String? sku;
  List<String>? thumbImage;
  List<String>? image;
  List<String>? video;
  String? shortDescription;
  String? longDescription;
  Details? details;
  String? status;
  String? subCategory;
  String? productType;
  String? productSubType;
  List<PriceList>? priceList;
  String? name;
  String? slug;
  int? discount;
  List<CategoryList>? categoryList;
  double? avgRating;
  int? ratingCount;

  Product(
      {this.docLinks,
      this.id,
      this.tag,
      this.productId,
      this.formalName,
      this.stock,
      this.category,
      this.state,
      this.country,
      this.sku,
      this.thumbImage,
      this.image,
      this.video,
      this.shortDescription,
      this.longDescription,
      this.details,
      this.status,
      this.subCategory,
      this.productType,
      this.productSubType,
      this.priceList,
      this.name,
      this.slug,
      this.discount,
      this.categoryList,
      this.avgRating,
      this.ratingCount});

  factory Product.fromJson(Map<String, dynamic> json) {
    print('73 product from json');
    print(json);
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
