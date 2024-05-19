// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['_id'] as String?,
      orderNumber: json['orderNumber'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              CrateOrderResponseProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: json['customer'] as String?,
      orderTotal: (json['orderTotal'] as num?)?.toDouble(),
      calculatedCouponDiscount:
          (json['calculatedCouponDiscount'] as num?)?.toDouble(),
      subTotal: (json['subTotal'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      billingAddress: json['billingAddress'] == null
          ? null
          : BillingAddress.fromJson(
              json['billingAddress'] as Map<String, dynamic>),
      carbonOffsetEarned: (json['carbonOffsetEarned'] as num?)?.toDouble(),
      paymentMode: json['paymentMode'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      paymentLogs: json['paymentLogs'] as List<dynamic>?,
      paymentStatus: json['paymentStatus'] as String?,
      subscriptionCancelledAt: json['subscriptionCancelledAt'] as int?,
      certificates: json['certificates'] as List<dynamic>?,
      status: json['status'] as int?,
      emailSentStatus: json['emailSentStatus'] as int?,
      metricsCalculatedStatus:
          (json['metricsCalculatedStatus'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      invoice: json['invoice'] == null
          ? null
          : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      couponCode: json['couponCode'] as String?,
      coupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      '_id': instance.id,
      'orderNumber': instance.orderNumber,
      'products': instance.products,
      'customer': instance.customer,
      'orderTotal': instance.orderTotal,
      'calculatedCouponDiscount': instance.calculatedCouponDiscount,
      'subTotal': instance.subTotal,
      'currency': instance.currency,
      'currencySymbol': instance.currencySymbol,
      'billingAddress': instance.billingAddress,
      'carbonOffsetEarned': instance.carbonOffsetEarned,
      'paymentMode': instance.paymentMode,
      'paymentMethod': instance.paymentMethod,
      'paymentLogs': instance.paymentLogs,
      'paymentStatus': instance.paymentStatus,
      'subscriptionCancelledAt': instance.subscriptionCancelledAt,
      'certificates': instance.certificates,
      'status': instance.status,
      'emailSentStatus': instance.emailSentStatus,
      'metricsCalculatedStatus': instance.metricsCalculatedStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'invoice': instance.invoice,
      'couponCode': instance.couponCode,
      'coupon': instance.coupon,
    };
