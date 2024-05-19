// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_order_product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchOrderProductData _$FetchOrderProductDataFromJson(
        Map<String, dynamic> json) =>
    FetchOrderProductData(
      docLinks: json['docLinks'] as List<dynamic>?,
      id: json['_id'] as String?,
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList(),
      productId: json['id'] as int?,
      formalName: json['formalName'] as String?,
      stock: json['stock'] as int?,
      category: json['category'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      sku: json['sku'] as String?,
      thumbImage: (json['thumbImage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      video:
          (json['video'] as List<dynamic>?)?.map((e) => e as String).toList(),
      shortDescription: json['shortDescription'] as String?,
      longDescription: json['longDescription'] as String?,
      details: json['details'] == null
          ? null
          : FetchOrderProductDetailsResponse.fromJson(
              json['details'] as Map<String, dynamic>),
      status: json['status'] as String?,
      subCategory: json['subCategory'] as String?,
      productType: json['productType'] as String?,
      productSubType: json['productSubType'] as String?,
      priceList: (json['priceList'] as List<dynamic>?)
          ?.map((e) => PriceList.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      discount: json['discount'] as int?,
      categoryList: (json['categoryList'] as List<dynamic>?)
          ?.map((e) => CategoryList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchOrderProductDataToJson(
        FetchOrderProductData instance) =>
    <String, dynamic>{
      'docLinks': instance.docLinks,
      '_id': instance.id,
      'tag': instance.tag,
      'id': instance.productId,
      'formalName': instance.formalName,
      'stock': instance.stock,
      'category': instance.category,
      'state': instance.state,
      'country': instance.country,
      'sku': instance.sku,
      'thumbImage': instance.thumbImage,
      'image': instance.image,
      'video': instance.video,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'details': instance.details,
      'status': instance.status,
      'subCategory': instance.subCategory,
      'productType': instance.productType,
      'productSubType': instance.productSubType,
      'priceList': instance.priceList,
      'name': instance.name,
      'slug': instance.slug,
      'discount': instance.discount,
      'categoryList': instance.categoryList,
    };
