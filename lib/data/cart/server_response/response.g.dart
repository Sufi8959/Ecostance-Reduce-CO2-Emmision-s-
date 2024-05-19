// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartServerResponse _$CartServerResponseFromJson(Map<String, dynamic> json) =>
    CartServerResponse(
      id: json['_id'] as String?,
      customer: json['customer'] == null
          ? null
          : CartCustomerDataResponse.fromJson(
              json['customer'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartServerProductElementResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      stripePaymentCouponId: json['stripePaymentCouponId'] as String?,
      coupon: json['coupon'] as String?,
      stripeSubscriptionCouponId: json['stripeSubscriptionCouponId'] as String?,
      orderTotal: (json['orderTotal'] as num?)?.toDouble(),
      subTotal: (json['subTotal'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      discountUnit: (json['discountUnit'] as num?)?.toDouble(),
      couponType: json['couponType'] as String?,
      orderTotalWithinStripeRange: json['orderTotalWithinStripeRange'] as bool?,
      temporaryCheckoutCurrency: json['temporaryCheckoutCurrency'] as String?,
    );

Map<String, dynamic> _$CartServerResponseToJson(CartServerResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'customer': instance.customer,
      'products': instance.products,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'coupon': instance.coupon,
      'stripePaymentCouponId': instance.stripePaymentCouponId,
      'stripeSubscriptionCouponId': instance.stripeSubscriptionCouponId,
      'discount': instance.discount,
      'orderTotal': instance.orderTotal,
      'subTotal': instance.subTotal,
      'discountUnit': instance.discountUnit,
      'couponType': instance.couponType,
      'orderTotalWithinStripeRange': instance.orderTotalWithinStripeRange,
      'temporaryCheckoutCurrency': instance.temporaryCheckoutCurrency,
    };

CartCustomerDataResponse _$CartCustomerDataResponseFromJson(
        Map<String, dynamic> json) =>
    CartCustomerDataResponse(
      checkoutDefaultCurrency: json['checkoutDefaultCurrency'] as String?,
    );

Map<String, dynamic> _$CartCustomerDataResponseToJson(
        CartCustomerDataResponse instance) =>
    <String, dynamic>{
      'checkoutDefaultCurrency': instance.checkoutDefaultCurrency,
    };

CartServerProductElementResponse _$CartServerProductElementResponseFromJson(
        Map<String, dynamic> json) =>
    CartServerProductElementResponse(
      product: json['product'] == null
          ? null
          : WishlistProductData.fromJson(
              json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      status: json['status'] as int?,
      id: json['_id'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CartServerProductElementResponseToJson(
        CartServerProductElementResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'status': instance.status,
      '_id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

CartServerResponseProductIdResponse
    _$CartServerResponseProductIdResponseFromJson(Map<String, dynamic> json) =>
        CartServerResponseProductIdResponse(
          id: json['_id'] as String,
        );

Map<String, dynamic> _$CartServerResponseProductIdResponseToJson(
        CartServerResponseProductIdResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
    };
