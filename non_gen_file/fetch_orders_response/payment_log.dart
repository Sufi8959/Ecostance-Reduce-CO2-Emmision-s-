import 'package:json_annotation/json_annotation.dart';

import 'automatic_tax.dart';
import 'custom_text.dart';
import 'customer_details.dart';
import 'phone_number_collection.dart';
import 'total_details.dart';

part 'payment_log.g.dart';

@JsonSerializable()
class PaymentLog {
  String? id;
  String? object;
  @JsonKey(name: 'after_expiration')
  dynamic afterExpiration;
  @JsonKey(name: 'allow_promotion_codes')
  dynamic allowPromotionCodes;
  @JsonKey(name: 'amount_subtotal')
  int? amountSubtotal;
  @JsonKey(name: 'amount_total')
  int? amountTotal;
  @JsonKey(name: 'automatic_tax')
  AutomaticTax? automaticTax;
  @JsonKey(name: 'billing_address_collection')
  dynamic billingAddressCollection;
  @JsonKey(name: 'cancel_url')
  String? cancelUrl;
  @JsonKey(name: 'client_reference_id')
  dynamic clientReferenceId;
  dynamic consent;
  @JsonKey(name: 'consent_collection')
  dynamic consentCollection;
  int? created;
  String? currency;
  @JsonKey(name: 'custom_fields')
  List<dynamic>? customFields;
  @JsonKey(name: 'custom_text')
  CustomText? customText;
  String? customer;
  @JsonKey(name: 'customer_creation')
  String? customerCreation;
  @JsonKey(name: 'customer_details')
  CustomerDetails? customerDetails;
  @JsonKey(name: 'customer_email')
  String? customerEmail;
  @JsonKey(name: 'expires_at')
  int? expiresAt;
  String? invoice;
  @JsonKey(name: 'invoice_creation')
  dynamic invoiceCreation;
  bool? livemode;
  dynamic locale;
  String? mode;
  @JsonKey(name: 'payment_intent')
  dynamic paymentIntent;
  @JsonKey(name: 'payment_link')
  dynamic paymentLink;
  @JsonKey(name: 'payment_method_collection')
  String? paymentMethodCollection;
  @JsonKey(name: 'payment_method_options')
  dynamic paymentMethodOptions;
  @JsonKey(name: 'payment_method_types')
  List<String>? paymentMethodTypes;
  @JsonKey(name: 'payment_status')
  String? paymentStatus;
  @JsonKey(name: 'phone_number_collection')
  PhoneNumberCollection? phoneNumberCollection;
  @JsonKey(name: 'recovered_from')
  dynamic recoveredFrom;
  @JsonKey(name: 'setup_intent')
  dynamic setupIntent;
  dynamic shipping;
  @JsonKey(name: 'shipping_address_collection')
  dynamic shippingAddressCollection;
  @JsonKey(name: 'shipping_options')
  List<dynamic>? shippingOptions;
  @JsonKey(name: 'shipping_rate')
  dynamic shippingRate;
  String? status;
  @JsonKey(name: 'submit_type')
  dynamic submitType;
  String? subscription;
  @JsonKey(name: 'success_url')
  String? successUrl;
  @JsonKey(name: 'total_details')
  TotalDetails? totalDetails;
  dynamic url;

  PaymentLog({
    this.id,
    this.object,
    this.afterExpiration,
    this.allowPromotionCodes,
    this.amountSubtotal,
    this.amountTotal,
    this.automaticTax,
    this.billingAddressCollection,
    this.cancelUrl,
    this.clientReferenceId,
    this.consent,
    this.consentCollection,
    this.created,
    this.currency,
    this.customFields,
    this.customText,
    this.customer,
    this.customerCreation,
    this.customerDetails,
    this.customerEmail,
    this.expiresAt,
    this.invoice,
    this.invoiceCreation,
    this.livemode,
    this.locale,
    this.mode,
    this.paymentIntent,
    this.paymentLink,
    this.paymentMethodCollection,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.paymentStatus,
    this.phoneNumberCollection,
    this.recoveredFrom,
    this.setupIntent,
    this.shipping,
    this.shippingAddressCollection,
    this.shippingOptions,
    this.shippingRate,
    this.status,
    this.submitType,
    this.subscription,
    this.successUrl,
    this.totalDetails,
    this.url,
  });

  factory PaymentLog.fromJson(Map<String, dynamic> json) {
    return _$PaymentLogFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentLogToJson(this);
}
