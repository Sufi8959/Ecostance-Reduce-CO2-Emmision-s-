import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/home_products/responses/product_list/price_list.dart';

import 'category_list.dart';
import 'details.dart';

part 'wishlist_product_data.g.dart';

@JsonSerializable()
class WishlistProductData {
  List<dynamic>? docLinks;
  @JsonKey(name: '_id')
  String? id;
  List<String>? tag;
  @JsonKey(name: 'id')
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

  WishlistProductData({
    this.docLinks,
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
  });

  factory WishlistProductData.fromJson(Map<String, dynamic> json) {
    return _$WishlistProductDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WishlistProductDataToJson(this);
}
