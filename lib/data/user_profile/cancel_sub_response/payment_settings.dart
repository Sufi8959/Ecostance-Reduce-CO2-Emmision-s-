import 'package:json_annotation/json_annotation.dart';

part 'payment_settings.g.dart';

@JsonSerializable()
class PaymentSettings {
  @JsonKey(name: 'payment_method_options')
  dynamic paymentMethodOptions;
  @JsonKey(name: 'payment_method_types')
  dynamic paymentMethodTypes;
  @JsonKey(name: 'save_default_payment_method')
  String? saveDefaultPaymentMethod;

  PaymentSettings({
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.saveDefaultPaymentMethod,
  });

  factory PaymentSettings.fromJson(Map<String, dynamic> json) {
    return _$PaymentSettingsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentSettingsToJson(this);
}
