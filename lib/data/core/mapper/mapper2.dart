import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/domain/user_profile/modal/payment_log.dart';

import '../../user_profile/order_fetch_response/payment_log_response/payment_log_response.dart';

extension PaymentLogResponseToModal on PaymentLogResponse? {
  PaymentLogModal toDomain() {
    return PaymentLogModal(
        id: this?.id.orEmpty() ?? '',
        object: this?.object.orEmpty() ?? '',
        afterExpiration: this?.afterExpiration,
        allowPromotionCodes: this?.allowPromotionCodes,
        amountSubtotal: this?.amountSubtotal.orZero() ?? 0,
        amountTotal: this?.amountTotal.orZero() ?? 0,
        //   automaticTax: this?.automaticTax.orZero() ?? 0,
        billingAddressCollection: this?.billingAddressCollection,
        cancelUrl: this?.cancelUrl.orEmpty() ?? '',
        clientReferenceId: this?.clientReferenceId,
        consent: this?.consent,
        consentCollection: this?.consentCollection,
        created: this?.created.orZero() ?? 0,
        currency: this?.currency.orEmpty() ?? '',
        customer: this?.customer.orEmpty() ?? '',
        customerCreation: this?.customerCreation.orEmpty() ?? '',
        // customerDetails: this?.customerDetails,
        customerEmail: this?.customerEmail.orEmpty() ?? '',
        expiresAt: this?.expiresAt.orZero() ?? 0,
        livemode: this?.livemode ?? false,
        locale: this?.locale,
        mode: this?.mode.orEmpty() ?? '',
        paymentIntent: this?.paymentIntent.orEmpty() ?? '',
        paymentLink: this?.paymentLink,
        paymentMethodCollection: this?.paymentMethodCollection.orEmpty() ?? '',
        paymentMethodTypes: this?.paymentMethodTypes ?? [],
        paymentStatus: this?.paymentStatus.orEmpty() ?? '',
        // phoneNumberCollection: this?.phoneNumberCollection,
        recoveredFrom: this?.recoveredFrom,
        setupIntent: this?.setupIntent,
        shipping: this?.shipping,
        shippingAddressCollection: this?.shippingAddressCollection,
        shippingOptions: this?.shippingOptions ?? [],
        shippingRate: this?.shippingRate,
        status: this?.status.orEmpty() ?? '',
        submitType: this?.submitType,
        subscription: this?.subscription,
        successUrl: this?.successUrl.orEmpty() ?? '',
        //  totalDetails: this?.totalDetails?.toDomain(),
        url: this?.url);
  }
}
