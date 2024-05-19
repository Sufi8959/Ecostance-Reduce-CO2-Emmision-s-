import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/wish_list/response/wishlist_product_data/wishlist_product_data.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';

import '../../../home_products/responses/product_list/price_list.dart';

part 'wish_list_fetch_response.g.dart';

@JsonSerializable()
class WishListResponse {
  WishListResponse({
    this.id,
    this.customer,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
  @JsonKey(name: '_id')
  final String? id;
  final String? customer;
  final List<ProductWishElement>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory WishListResponse.fromJson(Map<String, dynamic> json) =>
      _$WishListResponseFromJson(json);
}

@JsonSerializable()
class ProductWishElement {
  ProductWishElement({
    this.product,
    this.id,
    this.updatedAt,
    this.createdAt,
  });
  @JsonKey(name: 'product')
  final WishlistProductData? product;
  @JsonKey(name: '_id')
  final String? id;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  factory ProductWishElement.fromJson(Map<String, dynamic> json) =>
      _$ProductWishElementFromJson(json);
}

extension WishlistProductDataToProductModal on WishlistProductData? {
  ProductModal toProductModal(String currency) {
    PriceListModal? usdPrice = this
        ?.priceList
        ?.firstWhere((element) => element.currency == "USD",
            orElse: () =>
                this
                    ?.priceList
                    ?.firstWhere((element) => element.currency == "USD") ??
                PriceList(price: 0, currency: 'USD'))
        .toDomain();
    PriceListModal? localPrice = this
        ?.priceList
        ?.firstWhere((element) => element.currency == currency,
            orElse: () =>
                this
                    ?.priceList
                    ?.firstWhere((element) => element.currency == "USD") ??
                PriceList(price: 0, currency: 'USD'))
        .toDomain();

    return ProductModal(
        ratingCount: 0,
        avgRating: 0,
        docLinks: this?.docLinks ?? [],
        id: this?.id.orEmpty() ?? '',
        tag: this?.tag ?? [],
        productsListId: this?.productId.orEmpty() ?? '',
        formalName: this?.formalName.orEmpty() ?? '',
        stock: this?.stock.orZero() ?? 0,
        category: this?.category.orEmpty() ?? '',
        state: this?.state.orEmpty() ?? '',
        country: this?.country.orEmpty() ?? '',
        sku: this?.sku.orEmpty() ?? '',
        thumbImage: this?.thumbImage ?? [],
        image: this?.image ?? [],
        video: this?.video ?? [],
        shortDescription: this?.shortDescription.orEmpty() ?? '',
        longDescription: this?.longDescription.orEmpty() ?? '',
        details: DetailsModal.empty(),
        status: this?.status.orEmpty() ?? '',
        subCategory: this?.subCategory.orEmpty() ?? '',
        productType: this?.productType.orEmpty() ?? '',
        productSubType: this?.productSubType.orEmpty() ?? '',
        priceList: this?.priceList?.map((e) => e.toDomain()).toList() ?? [],
        name: this?.name.orEmpty() ?? '',
        slug: this?.slug.orEmpty() ?? '',
        discount: this?.discount.orZero() ?? 0,
        priceInUsd: usdPrice!,
        priceLocal: localPrice);
  }
}
