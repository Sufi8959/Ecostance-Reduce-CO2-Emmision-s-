// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSettings _$PaymentSettingsFromJson(Map<String, dynamic> json) =>
    PaymentSettings(
      paymentMethodOptions: json['payment_method_options'],
      paymentMethodTypes: json['payment_method_types'],
      saveDefaultPaymentMethod: json['save_default_payment_method'] as String?,
    );

Map<String, dynamic> _$PaymentSettingsToJson(PaymentSettings instance) =>
    <String, dynamic>{
      'payment_method_options': instance.paymentMethodOptions,
      'payment_method_types': instance.paymentMethodTypes,
      'save_default_payment_method': instance.saveDefaultPaymentMethod,
    };
