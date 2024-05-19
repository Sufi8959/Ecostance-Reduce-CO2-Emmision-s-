class PaymentLogModal {
  PaymentLogModal({
    required this.id,
    required this.object,
    required this.afterExpiration,
    required this.allowPromotionCodes,
    required this.amountSubtotal,
    required this.amountTotal,
    //   required this.automaticTax,
    required this.billingAddressCollection,
    required this.cancelUrl,
    required this.clientReferenceId,
    required this.consent,
    required this.consentCollection,
    required this.created,
    required this.currency,
    required this.customer,
    required this.customerCreation,
    // required this.customerDetails,
    required this.customerEmail,
    required this.expiresAt,
    required this.livemode,
    required this.locale,
    required this.mode,
    required this.paymentIntent,
    required this.paymentLink,
    required this.paymentMethodCollection,
    required this.paymentMethodTypes,
    required this.paymentStatus,
    //required this.phoneNumberCollection,
    required this.recoveredFrom,
    required this.setupIntent,
    required this.shipping,
    required this.shippingAddressCollection,
    required this.shippingOptions,
    required this.shippingRate,
    required this.status,
    required this.submitType,
    required this.subscription,
    required this.successUrl,
    //required this.totalDetails,
    required this.url,
  });

  String id;
  String object;
  dynamic afterExpiration;
  dynamic allowPromotionCodes;
  double amountSubtotal;
  double amountTotal;
  // AutomaticTax automaticTax;
  dynamic billingAddressCollection;
  String cancelUrl;
  dynamic clientReferenceId;
  dynamic consent;
  dynamic consentCollection;
  int created;
  String currency;
  String customer;
  String customerCreation;
  // CustomerDetailsModal customerDetails;
  String customerEmail;
  int expiresAt;
  bool livemode;
  dynamic locale;
  String mode;
  String paymentIntent;
  dynamic paymentLink;
  String paymentMethodCollection;
  List<String> paymentMethodTypes;
  String paymentStatus;
  //PaymentPhoneNumberCollectionModal phoneNumberCollection;
  dynamic recoveredFrom;
  dynamic setupIntent;
  dynamic shipping;
  dynamic shippingAddressCollection;
  List<dynamic> shippingOptions;
  dynamic shippingRate;
  String status;
  dynamic submitType;
  dynamic subscription;
  String successUrl;
//  PaymentTotalDetailsModal totalDetails;
  dynamic url;
}

class AutomaticTax {
  AutomaticTax({
    required this.enabled,
    required this.status,
  });

  bool enabled;
  dynamic status;
}

class CustomerDetailsModal {
  CustomerDetailsModal({
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
    required this.taxExempt,
    required this.taxIds,
  });

  PaymentAddressModal address;
  String email;
  String name;
  dynamic phone;
  String taxExempt;
  List<dynamic> taxIds;
}

class PaymentAddressModal {
  PaymentAddressModal({
    required this.city,
    required this.country,
    required this.line1,
    required this.line2,
    required this.postalCode,
    required this.state,
  });

  dynamic city;
  String country;
  dynamic line1;
  dynamic line2;
  dynamic postalCode;
  dynamic state;
}

class PaymentPhoneNumberCollectionModal {
  PaymentPhoneNumberCollectionModal({
    required this.enabled,
  });

  bool enabled;
}

class PaymentTotalDetailsModal {
  PaymentTotalDetailsModal({
    required this.amountDiscount,
    required this.amountShipping,
    required this.amountTax,
  });

  double amountDiscount;
  double amountShipping;
  double amountTax;
}
