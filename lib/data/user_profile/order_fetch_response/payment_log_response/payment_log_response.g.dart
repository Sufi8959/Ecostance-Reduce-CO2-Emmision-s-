// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentLogResponse _$PaymentLogResponseFromJson(Map<String, dynamic> json) =>
    PaymentLogResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      afterExpiration: json['after_expiration'],
      allowPromotionCodes: json['allow_promotion_codes'],
      amountSubtotal: (json['amount_subtotal'] as num?)?.toDouble(),
      amountTotal: (json['amount_total'] as num?)?.toDouble(),
      automaticTax: json['automatic_tax'] == null
          ? null
          : AutomaticTax.fromJson(
              json['automatic_tax'] as Map<String, dynamic>),
      billingAddressCollection: json['billing_address_collection'],
      cancelUrl: json['cancel_url'] as String?,
      clientReferenceId: json['client_reference_id'],
      consent: json['consent'],
      consentCollection: json['consent_collection'],
      created: json['created'] as int?,
      currency: json['currency'] as String?,
      customer: json['customer'] as String?,
      customerCreation: json['customer_creation'] as String?,
      customerDetails: json['customer_details'] == null
          ? null
          : CustomerDetails.fromJson(
              json['customer_details'] as Map<String, dynamic>),
      customerEmail: json['customer_email'] as String?,
      expiresAt: json['expires_at'] as int?,
      livemode: json['livemode'] as bool?,
      locale: json['locale'],
      mode: json['mode'] as String?,
      paymentIntent: json['payment_intent'] as String?,
      paymentLink: json['payment_link'],
      paymentMethodCollection: json['payment_method_collection'] as String?,
      paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      paymentStatus: json['payment_status'] as String?,
      phoneNumberCollection: json['phone_number_collection'] == null
          ? null
          : PhoneNumberCollection.fromJson(
              json['phone_number_collection'] as Map<String, dynamic>),
      recoveredFrom: json['recovered_from'],
      setupIntent: json['setup_intent'],
      shipping: json['shipping'],
      shippingAddressCollection: json['shipping_address_collection'],
      shippingOptions: json['shipping_options'] as List<dynamic>?,
      shippingRate: json['shipping_rate'],
      status: json['status'] as String?,
      submitType: json['submit_type'],
      subscription: json['subscription'],
      successUrl: json['success_url'] as String?,
      totalDetails: json['total_details'] == null
          ? null
          : TotalDetails.fromJson(
              json['total_details'] as Map<String, dynamic>),
      url: json['url'],
    );

Map<String, dynamic> _$PaymentLogResponseToJson(PaymentLogResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'after_expiration': instance.afterExpiration,
      'allow_promotion_codes': instance.allowPromotionCodes,
      'amount_subtotal': instance.amountSubtotal,
      'amount_total': instance.amountTotal,
      'automatic_tax': instance.automaticTax,
      'billing_address_collection': instance.billingAddressCollection,
      'cancel_url': instance.cancelUrl,
      'client_reference_id': instance.clientReferenceId,
      'consent': instance.consent,
      'consent_collection': instance.consentCollection,
      'created': instance.created,
      'currency': instance.currency,
      'customer': instance.customer,
      'customer_creation': instance.customerCreation,
      'customer_details': instance.customerDetails,
      'customer_email': instance.customerEmail,
      'expires_at': instance.expiresAt,
      'livemode': instance.livemode,
      'locale': instance.locale,
      'mode': instance.mode,
      'payment_intent': instance.paymentIntent,
      'payment_link': instance.paymentLink,
      'payment_method_collection': instance.paymentMethodCollection,
      'payment_method_types': instance.paymentMethodTypes,
      'payment_status': instance.paymentStatus,
      'phone_number_collection': instance.phoneNumberCollection,
      'recovered_from': instance.recoveredFrom,
      'setup_intent': instance.setupIntent,
      'shipping': instance.shipping,
      'shipping_address_collection': instance.shippingAddressCollection,
      'shipping_options': instance.shippingOptions,
      'shipping_rate': instance.shippingRate,
      'status': instance.status,
      'submit_type': instance.submitType,
      'subscription': instance.subscription,
      'success_url': instance.successUrl,
      'total_details': instance.totalDetails,
      'url': instance.url,
    };
