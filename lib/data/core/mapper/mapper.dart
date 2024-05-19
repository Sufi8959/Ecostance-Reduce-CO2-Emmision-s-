import 'package:intl_phone_field/phone_number.dart';
import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/data/all_countries/hive_modal/country_hive_modal.dart';
import 'package:net_carbons/data/all_countries/responses/countries_list_response/countries_list_response.dart';
import 'package:net_carbons/data/all_countries/responses/countries_list_response/country.dart';
import 'package:net_carbons/data/cart/server_response/response.dart';
import 'package:net_carbons/data/core/mapper/mapper2.dart';
import 'package:net_carbons/data/forgot_password/responses/responses.dart';
import 'package:net_carbons/data/home_products/responses/product_list/auditor.dart';
import 'package:net_carbons/data/home_products/responses/product_list/details.dart';
import 'package:net_carbons/data/home_products/responses/product_list/document.dart';
import 'package:net_carbons/data/home_products/responses/product_list/price_list.dart';
import 'package:net_carbons/data/home_products/responses/product_list/product.dart';
import 'package:net_carbons/data/home_products/responses/product_list/product_list.dart';
import 'package:net_carbons/data/home_products/responses/product_list/project.dart';
import 'package:net_carbons/data/home_products/responses/product_list/sdg.dart';
import 'package:net_carbons/data/home_products/responses/product_list/sdg_details.dart';
import 'package:net_carbons/data/home_products/responses/product_list/standard.dart';
import 'package:net_carbons/data/home_products/responses/product_list/std_method.dart';
import 'package:net_carbons/data/login/authentication_response/authentication_response.dart';
import 'package:net_carbons/data/login/authentication_response/user.dart';
import 'package:net_carbons/data/register/register_response/register_response.dart';
import 'package:net_carbons/data/user_profile/device_info/browser.dart';
import 'package:net_carbons/data/user_profile/device_info/device.dart';
import 'package:net_carbons/data/user_profile/device_info/device_info_response.dart';
import 'package:net_carbons/data/user_profile/device_info/engine.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/certificate.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/coupon.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/customer.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/fetch_order_product_data/details.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/invoice.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/metadata.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/order.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/order_fetch_response.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/product.dart';
import 'package:net_carbons/data/user_profile/response/profile_response.dart';
import 'package:net_carbons/data/wish_list/response/wish_list_fetch_response/wish_list_fetch_response.dart';
import 'package:net_carbons/domain/auth/model/modals.dart';
import 'package:net_carbons/domain/cart/models/server_resp_modals.dart';
import 'package:net_carbons/domain/countries/model/country_modal.dart';
import 'package:net_carbons/domain/forgot_password/modal/resp_modal.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/domain/register/modal/RegisterRespModal.dart';
import 'package:net_carbons/domain/user_profile/modal/last_loogedin_info_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/metrics_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/product_data_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';
import 'package:net_carbons/domain/wish_list/modals/modals.dart';

import '../../../domain/user_profile/modal/my_orders_list.dart';
import '../../home_products/responses/location_details_response/degree_decimal.dart';
import '../../home_products/responses/location_details_response/image.dart';
import '../../home_products/responses/location_details_response/location_details_response.dart';
import '../../user_profile/carbol_calculations_response/carbol_calculations_response.dart';
import '../../user_profile/dashboard_metrics_response/dashboard_metrics_response.dart';
import '../../user_profile/order_fetch_response/fetch_order_product_data/fetch_order_product_data.dart';
import '../../wish_list/save_response/wish_list_save_response/product.dart';
import '../../wish_list/save_response/wish_list_save_response/wish_list_save_response.dart';
import '../../wish_list/save_response/wish_list_save_response/wishlist.dart';

// extension LoginResponseMapper on LoginResponse? {
//   AuthDataModal toDomain() {
//     return AuthDataModal(
//       user: this?.user?.toDomain() ?? UserModel.empty(),
//       token: this?.token?.orEmpty() ?? '',
//     );
//   }
// }
//
// extension UserResponseMapper on UserResponse? {
//   UserModel toDomain() {
//     return UserModel(
//       id: this?.id?.orEmpty() ?? '',
//       email: this?.name?.orEmpty() ?? '',
//       uid: this?.uid?.orEmpty() ?? '',
//     );
//   }
// }

extension RegisterResponseMapper on RegisterResponse? {
  RegisterRespModal toDomain() {
    return RegisterRespModal(
        message: this?.message?.orEmpty() ?? '',
        success: this?.success ?? false,
        user: this?.user.toDomain() ?? UserModel.empty(),
        token: this?.token.orEmpty() ?? '');
  }
}

extension AccountVerificationResponseMapper on AuthenticationResponse? {
  AuthDataModal toDomain() {
    return AuthDataModal(
        user: this?.user?.toDomain() ?? UserModel.empty(),
        ip: this?.ip.orEmpty() ?? '',
        token: this?.token.orEmpty() ?? '');
  }
}

extension AccountVerificationUserResponseToDomain on UserModelResponse? {
  UserModel toDomain() {
    return UserModel(
      id: this?.id.orEmpty() ?? '',
      email: this?.email.orEmpty() ?? '',
      emailVerificationStatus: this?.emailVerificationStatus.orEmpty() ?? '',
      phoneVerificationStatus: this?.phoneVerificationStatus.orEmpty() ?? '',
      otp: this?.otp.orEmpty() ?? '',
      otpCreatedAt:
          this?.otpCreatedAt ?? DateTime.fromMillisecondsSinceEpoch(1),
      uid: this?.uid.orEmpty() ?? '',
      termsAndConditions: this?.termsAndConditions ?? false,
      newsLetter: this?.newsLetter ?? false,
      status: this?.status.orEmpty() ?? '',
      createdAt: this?.createdAt ?? DateTime.fromMillisecondsSinceEpoch(1),
      updatedAt: this?.updatedAt ?? DateTime.fromMillisecondsSinceEpoch(1),
      v: this?.v.orZero() ?? 0,
      country: this?.country.toDomain() ?? UserProfileRespCountryModel.empty(),
      defaultCurrency: this?.defaultCurrency.orEmpty() ?? '',
      dob: this?.dob,
      firstName: this?.firstName.orEmpty() ?? '',
      lastName: this?.lastName.orEmpty() ?? '',
      recoveryEmail: this?.recoveryEmail.orEmpty() ?? '',
      profileImage: this?.profileImage.orEmpty() ?? '',
      phoneNumber: this?.phone.toDomain(),
    );
  }
}

extension PhoneToModal on PhoneResponse? {
  PhoneNumber? toDomain() {
    String subString = '';
    if (this != null &&
        this?.numericCode != null &&
        this?.number != null &&
        this?.countryCode != null) {
      subString = this!.number!.replaceAll(this!.numericCode!, '');
      return PhoneNumber(
          countryISOCode: this?.countryCode ?? '',
          countryCode: this?.numericCode ?? '',
          number: subString);
    }
    return null;
  }
}

extension ProfileResponseCountryToDomain on ProfileResponseCountry? {
  UserProfileRespCountryModel toDomain() {
    return UserProfileRespCountryModel(
      countryCode: this?.countryCode.orEmpty() ?? '',
      details: this?.country.toDomain() ?? CountryModal.empty(),
    );
  }
}

extension ForgotPasswordResponseMapper on ResetPasswordRespons? {
  ForgotPassRespModal toDomain() {
    return ForgotPassRespModal(message: this?.message?.orEmpty() ?? '');
  }
}

extension BillingAddressMapper on BillingAddressResponse? {
  BillingAddressModal toDomain() {
    return BillingAddressModal(
      id: this?.id?.orEmpty() ?? '',
      customerProfile: this?.customerProfile?.orEmpty() ?? '',
      firstName: this?.firstName?.orEmpty() ?? '',
      lastName: this?.lastName?.orEmpty() ?? '',
      contactNo: this?.contactNo?.toDomain(),
      addressLine1: this?.addressLine1?.orEmpty() ?? '',
      addressLine2: this?.addressLine2?.orEmpty() ?? '',
      city: this?.city?.orEmpty() ?? '',
      state: this?.state?.orEmpty() ?? '',
      country: this?.country?.orEmpty() ?? '',
      pincode: this?.pincode?.orEmpty() ?? '',
      stateCode: this?.stateCode?.orEmpty() ?? '',
      countryCode: this?.countryCode?.orEmpty() ?? '',
      email: '',
    );
  }
}

extension BillingAddressModalToResponse on BillingAddressModal {
  BillingAddressResponse toDataLayer() {
    return BillingAddressResponse(
      id: id,
      customerProfile: customerProfile,
      firstName: firstName,
      lastName: lastName,
      contactNo: contactNo == null
          ? null
          : PhoneResponse(
              number: contactNo!.number,
              numericCode: contactNo!.countryCode,
              countryCode: contactNo!.countryISOCode),
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      city: city,
      state: state,
      country: country,
      pincode: pincode,
      stateCode: stateCode,
      countryCode: countryCode,
    );
  }
}

extension UserProfileResponseMapper on UserProfileResponse? {
  UserProfileModal toDomain() {
    return UserProfileModal(
        user: this?.user?.toDomain() ?? UserModel.empty(),

        ///TODO recheck null
        billingAddress: this?.billingAddress.toDomain(),
        calculationsResponseModal: this?.calculationsResponse.toDomain(),
        addressCountry: this?.addressCountry,
        checkoutDefaultCurrency: this?.checkoutDefaultCurrency,
        selectedCountry: this?.selectedCountry,
        lastLoggedIn: this?.lastLoggedIn,
        deviceInfoModal: this?.deviceInfoResponse.toDomain());
  }
}

extension DeviceInfoResponseToMoadil on DeviceInfoResponse? {
  DeviceInfoModal toDomain() {
    return DeviceInfoModal(
        ua: this?.ua ?? '',
        browser: this?.browser.toDomain(),
        engine: this?.engine.toDomain(),
        os: this?.os.toDomain(),
        device: this?.device.toDomain());
  }
}

extension BrowserToModal on Browser? {
  BrowserModal toDomain() {
    return BrowserModal(
        name: this?.name ?? '',
        version: this?.version ?? '',
        major: this?.major ?? '');
  }
}

extension DeviceToModal on Device? {
  DeviceModal toDomain() {
    return DeviceModal(vendor: this?.vendor ?? '', model: this?.model ?? '');
  }
}

extension EngineToModal on Engine? {
  EngineModal toDomain() {
    return EngineModal(name: this?.name ?? '', version: this?.version ?? '');
  }
}

extension CarbonCalculationsResponseToModal on CarbonCalculationsResponse? {
  CarbonCalculationsResponseModal toDomain() {
    return CarbonCalculationsResponseModal(
        houseHoldMembers: this?.houseHoldMembers.orZero() ?? 0,
        publicTransportationMembers:
            this?.publicTransportationMembers.orZero() ?? 0,
        income: this?.income.orEmpty() ?? '',
        houseSize: this?.houseSize.orEmpty() ?? '',
        airTravel: this?.airTravel.orEmpty() ?? '',
        meatConsumption: this?.meatConsumption.orEmpty() ?? '',
        totalCarbonEmissions: this?.totalCarbonEmissions.orZero() ?? 0,
        countryCode: this?.countryCode.orEmpty() ?? '');
  }
}

extension CountryHiveToCountryModal on CountryHiveModal {
  CountryModal hiveToCountryModal() {
    return CountryModal(
        id: id,
        entity: entity,
        countryCode: countryCode,
        currencyName: currencyName,
        currencyCode: currencyCode,
        numericCode: numericCode,
        minorUnit: minorUnit,
        carbonCountryCode: carbonCountryCode,
        carbonCountryPerCapita: carbonCountryPerCapita,
        phonePrefix: phonePrefix,
        status: status,
        show: show,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
        isCurrencySupported: isCurrencySupported);
  }
}

extension OtpSuccessResponseMapper on OtpSubmitResponse? {
  OtpSubmitResponseModalError toDomainError() {
    return OtpSubmitResponseModalError(
      message: this?.message?.orEmpty() ?? '',
    );
  }

  OtpSubmitResponseModalSuccess toDomainSuccess() {
    return OtpSubmitResponseModalSuccess(
      token: this?.token?.orEmpty() ?? '',
    );
  }
}

extension CountryResponseMapper on CountryResponse? {
  CountryModal toDomain() {
    return CountryModal(
      id: this?.id?.orEmpty() ?? '',
      entity: this?.entity?.orEmpty() ?? '',
      countryCode: this?.countryCode?.orEmpty() ?? '',
      currencyName: this?.currencyName?.orEmpty() ?? '',
      currencyCode: this?.currencyCode?.orEmpty() ?? '',
      numericCode: this?.numericCode?.orEmpty() ?? '',
      minorUnit: this?.minorUnit?.orEmpty() ?? '',
      carbonCountryCode: this?.carbonCountryCode?.orEmpty() ?? '',
      phonePrefix: this?.phonePrefix?.orEmpty() ?? '',
      status: this?.status?.orEmpty() ?? '',
      show: this?.show?.orEmpty() ?? '',
      v: this?.v.orZero() ?? 0,
      carbonCountryPerCapita: this?.carbonCountryPerCapita?.orEmpty() ?? '',
      createdAt: this?.createdAt ?? DateTime.now(),
      updatedAt: this?.updatedAt ?? DateTime.now(),
      isCurrencySupported: this?.isCurrencySupported ?? false,
    );
  }
}

extension CountriesResponseMapper on CountriesListResponse? {
  List<CountryModal> toDomain() {
    final List<CountryModal> list =
        this?.countries.map((e) => e.toDomain()).toList() ?? [];
    list.sort((a, b) => a.entity.compareTo(b.entity));
    return list;
  }
}

extension OtpVerifyResponseMapper on OtpVerifyResponse? {
  VerifyOtpResponseModal toDomain() {
    return VerifyOtpResponseModal(this?.success ?? false);
  }
}

///////////////////////

extension ProductsListResponseMapper on ProductList? {
  ProductsListModal toDomain(String currency) {
    List<ProductModal> mapped = [];
    this?.products?.forEach((element) {
      mapped.add(element.toDomain(currency));
    });

    return ProductsListModal(
        products: mapped,
        metadata: ProductsMetadata(
          total: this?.metadataResponse?.total ?? 0,
          totalPages: this?.metadataResponse?.totalPages ?? 0,
          currentPage: this?.metadataResponse?.currentPage ?? 0,
          nextPage: this?.metadataResponse?.nextPage,
        ));
  }
}

extension ProuctResponseMapper on Product? {
  ProductModal toDomain(String currency) {
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
      ///TODo dangourus null !
      priceInUsd: usdPrice!,
      priceLocal: localPrice,
      priceList: this?.priceList?.map((e) => e.toDomain()).toList() ?? [],
      docLinks: this?.docLinks ?? [],
      id: this?.id.orEmpty() ?? '',
      sku: this?.sku.orEmpty() ?? '',
      name: this?.name.orEmpty() ?? '',
      slug: this?.slug.orEmpty() ?? '',
      discount: this?.discount ?? 0,
      category: this?.category ?? '',
      tag: this?.tag ?? [],
      stock: this?.stock ?? 0,
      thumbImage: this?.thumbImage ?? [],
      image: this?.image ?? [],
      shortDescription: this?.shortDescription.orEmpty() ?? '',
      status: this?.status.orEmpty() ?? '',
      longDescription: this?.longDescription.orEmpty() ?? '',
      formalName: this?.formalName.orEmpty() ?? '',
      video: this?.video ?? [],
      productsListId: this?.productId ?? '',
      country: this?.country.orEmpty() ?? '',
      details: this?.details.toDomain() ?? DetailsModal.empty(),
      subCategory: this?.subCategory.orEmpty() ?? '',
      productSubType: this?.productSubType.orEmpty() ?? '',
      productType: this?.productType.orEmpty() ?? '',
      state: this?.status.orEmpty() ?? '',
      avgRating: this?.avgRating ?? 0,
      ratingCount: this?.ratingCount ?? 0,
    );
  }
}

extension DetailsToModal on Details? {
  DetailsModal toDomain() {
    return DetailsModal(
        project: this?.project.toDomain() ?? ProjectModal.empty(),
        sdgs: this?.sdgs?.map((e) => e.toDomain()).toList() ?? [],
        standards: this?.standards?.map((e) => e.toDomain()).toList() ?? [],
        stdMethod: this?.stdMethod.toDomain() ?? StdMethodModal.empty(),
        estimatedAnnualEmissionReduction:
            this?.estimatedAnnualEmissionReduction.orEmpty() ?? '',
        creditsIssued: this?.creditsIssued.orEmpty() ?? '',
        operationRegistration: this?.operationRegistration ??
            DateTime.fromMicrosecondsSinceEpoch(1),
        termStart: this?.termStart ?? DateTime.fromMicrosecondsSinceEpoch(1),
        termEnd: this?.termEnd ?? DateTime.fromMicrosecondsSinceEpoch(1),
        location: this?.location?.map((e) => e.toDomain()).toList() ?? [],
        landArea: this?.landArea.orEmpty() ?? '',
        coBenifitsDescription: this?.coBenifitsDescription.orEmpty() ?? '',
        documents: this?.documents ?? []);
  }
}

extension LocationDetailsResponseToDomain on LocationDetails? {
  LocationDetailsModal toDomain() {
    return LocationDetailsModal(
        lat: this?.lat.orEmpty() ?? '',
        long: this?.long.orEmpty() ?? '',
        degreeDecimal:
            this?.degreeDecimal.toDomain() ?? DegreeDecimalModal.empty(),
        description: this?.description.orEmpty() ?? '',
        images: this?.images?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension LocationImageToDomain on LocationImage? {
  LocationImageModal toDomain() {
    return LocationImageModal(
        link: this?.link.orEmpty() ?? '', size: this?.size.orEmpty() ?? '');
  }
}

extension DegreDecimalToDomain on DegreeDecimal? {
  DegreeDecimalModal toDomain() {
    return DegreeDecimalModal(
        type: this?.type.orEmpty() ?? '', coordinates: this?.coordinates ?? []);
  }
}

extension StdMethodToModal on StdMethod? {
  StdMethodModal toDomain() {
    return StdMethodModal(
        type: this?.type.orEmpty() ?? '',
        version: this?.version.orEmpty() ?? '',
        link: this?.link.orEmpty() ?? '');
  }
}

extension StandardToModal on Standard? {
  StandardModal toDomain() {
    return StandardModal(
        id: this?.id.orEmpty() ?? '',
        standardId: this?.standardId.orEmpty() ?? '',
        type: this?.type.orEmpty() ?? '',
        name: this?.name.orEmpty() ?? '',
        companyWebsite: this?.companyWebsite.orEmpty() ?? '',
        methodology: this?.methodology.orEmpty() ?? '',
        logo: this?.logo.orEmpty() ?? '',
        link: this?.link.orEmpty() ?? '',
        description: this?.description.orEmpty() ?? '');
  }
}

extension SdgElementToModal on Sdg? {
  SdgElementModal toDomain() {
    return SdgElementModal(
        sdg: this?.sdgDetails.toDomain() ?? SdgSdgModal.empty(),
        details: this?.details.orEmpty() ?? '',
        fulFilled: this?.fulFilled ?? false);
  }
}

extension SdgToModal on SdgDetails? {
  SdgSdgModal toDomain() {
    return SdgSdgModal(
        id: this?.id.orEmpty() ?? '',
        name: this?.name.orEmpty() ?? '',
        description: this?.description.orEmpty() ?? '',
        image: this?.image.orEmpty() ?? '',
        imageInvert: this?.imageInvert.orEmpty() ?? '',
        v: this?.v.orZero() ?? 0,
        index: this?.index.orZero() ?? 0);
  }
}

extension ProjectToModal on Project? {
  ProjectModal toDomain() {
    return ProjectModal(
        exchange: this?.exchange.orEmpty() ?? '',
        scale: this?.scale.orEmpty() ?? '',
        id: this?.id.orEmpty() ?? '',
        link: this?.link.orEmpty() ?? '',
        participants: this?.participants.orEmpty() ?? '',
        size: this?.size.orEmpty() ?? '',
        start: this?.start ?? DateTime.fromMicrosecondsSinceEpoch(1),
        completion: this?.completion.orEmpty() ?? '',
        validator: this?.validator.orEmpty() ?? '',
        validatorLink: this?.validatorLink.orEmpty() ?? '',
        monitor: this?.monitor.orEmpty() ?? '',
        monitorNotes: this?.monitorNotes.orEmpty() ?? '',
        monitorLink: this?.monitorLink.orEmpty() ?? '',
        auditor: this?.auditor?.map((e) => e.toDomain()).toList() ?? [],
        information: this?.information.orEmpty() ?? '',
        owners: this?.owners ?? [],
        developers: this?.developers.orEmpty() ?? '',
        funders: this?.funders.orEmpty() ?? '',
        documents: this?.documents?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension ProjectDocumentsToResponse on Document? {
  ProjectDocumentsModal toDomain() {
    return ProjectDocumentsModal(
        name: this?.name.orEmpty() ?? '', link: this?.link.orEmpty() ?? '');
  }
}

extension AuditorToModal on Auditor? {
  AuditorModal toDomain() {
    return AuditorModal(
        name: this?.name.orEmpty() ?? '',
        notes: this?.notes.orEmpty() ?? '',
        link: this?.link.orEmpty() ?? '');
  }
}

extension PriceListToModal on PriceList? {
  PriceListModal toDomain() {
    return PriceListModal(
        price: double.parse(this?.price?.orZero().toString() ?? "0.0"),
        currency: this?.currency.orEmpty() ?? '',
        oldPrice: double.parse(this?.oldPrice?.orZero().toString() ?? "0.0"),
        currencySymbol: this?.currencySymbol.orEmpty() ?? '');
  }
}

// extension CartFromSaveToModal on CartSaveResponse? {
//   CartSaveResponseModal toDomain() {
//     return CartSaveResponseModal(
//         cart: this?.cart.toDomain() ?? CartSaveModal.empty());
//   }
// }

// extension CartResponseToModal on CartResponse? {
//   CartSaveModal toDomain() {
//     return CartSaveModal(
//       id: this?.id.orEmpty() ?? '',
//       customer: this?.customer.orEmpty() ?? '',
//       products: this?.products?.map((e) => e.toDomain()).toList() ?? [],
//       createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
//       updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
//       v: this?.v.orZero() ?? 0,
//       stripeSubscriptionCouponId:
//           this?.stripeSubscriptionCouponId.orEmpty() ?? '',
//       coupon: this?.coupon.orEmpty() ?? '',
//       stripePaymentCouponId: this?.stripePaymentCouponId.orEmpty() ?? '',
//     );
//   }
// }
//
// extension ProductCartSaveResponseToModal on ProductCartSaveResponse? {
//   ProductCartSaveModal toDomain() {
//     return ProductCartSaveModal(
//         product: this?.product.orEmpty() ?? '',
//         quantity: this?.quantity.orZero() ?? 0,
//         status: this?.status.orZero() ?? 0,
//         id: this?.id.orEmpty() ?? '',
//         updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
//         createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1));
//   }
// }

extension CartServerResponseToModal on CartServerResponse? {
  CartServerModal toDomain(String currency, bool considerChangedCurrency) {
    String? defCurrency;

    if (this?.temporaryCheckoutCurrency != null) {
      this!.temporaryCheckoutCurrency!.isNotEmpty
          ? defCurrency = this!.temporaryCheckoutCurrency
          : null;
    }

    return CartServerModal(
      id: this?.id.orEmpty() ?? '',
      customer: this?.customer.toDomain() ??
          CartCustomerData(
              checkoutDefaultCurrency: this?.customer?.checkoutDefaultCurrency),
      products: this
              ?.products
              ?.map((e) => e.toDomain(defCurrency ?? currency))
              .toList() ??
          [],
      createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
      updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
      v: this?.v ?? 0,
      coupon: this?.coupon.orEmpty() ?? '',
      stripePaymentCouponId: this?.stripePaymentCouponId.orEmpty() ?? '',
      stripeSubscriptionCouponId:
          this?.stripeSubscriptionCouponId.orEmpty() ?? '',
      discount: this?.discount ?? 0.0,
      subTotal: this?.subTotal ?? 0.0,
      orderTotal: this?.orderTotal ?? 0.0,
      discountUnit: this?.discountUnit ?? 0.0,
      couponType: this?.couponType.orEmpty() ?? '',
      orderTotalWithinStripeRange: this?.orderTotalWithinStripeRange ?? false,
      temporaryCheckoutCurrency: this?.temporaryCheckoutCurrency,
    );
  }
}

extension CartCustomerDataResponseToModal on CartCustomerDataResponse? {
  CartCustomerData toDomain() {
    String? currency;
    if (this?.checkoutDefaultCurrency != null) {
      currency = this!.checkoutDefaultCurrency!.isEmpty
          ? null
          : this!.checkoutDefaultCurrency!;
    }
    return CartCustomerData(checkoutDefaultCurrency: currency);
  }
}

extension CartServerProductElementResponseToModal
    on CartServerProductElementResponse? {
  CartServerProductElementModal toDomain(String currency) {
    return CartServerProductElementModal(
        product: this?.product.toProductModal(currency) ?? ProductModal.empty(),
        quantity: this?.quantity ?? 0,
        status: this?.status ?? 0,
        id: this?.id.orEmpty() ?? '',
        updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1));
  }
}

extension CartServerResponseProductIdToDomain
    on CartServerResponseProductIdResponse? {
  CartServerResponseProductIdModal toDomain() {
    return CartServerResponseProductIdModal(id: this?.id ?? '');
  }
}

extension WishListSaveResponseToModal on WishListSaveResponse? {
  WishListSaveModal toDomain() {
    return WishListSaveModal(
        wishlist: this?.wishlist.toDomain() ?? WishlistModal.empty());
  }
}

extension WishlistResponseToModal on WishlistResponse? {
  WishlistModal toDomain() {
    return WishlistModal(
        id: this?.id.orEmpty() ?? '',
        customer: this?.customer.orEmpty() ?? '',
        products: this?.products?.map((e) => e.toDomain()).toList() ?? [],
        createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        v: this?.v ?? 0);
  }
}

extension WishListProductResponseToModal on WishListProductResponse? {
  WishlistProductModal toDomain() {
    return WishlistProductModal(
        product: this?.product.orEmpty() ?? '',
        id: this?.id.orEmpty() ?? '',
        updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1));
  }
}

extension DashboardMetricsResponseToModal on DashboardMetricsResponse? {
  DashboardMetricsModal toDomain() {
    return DashboardMetricsModal(
        ghgReduced: this?.ghgReduced.orZero() ?? 0,
        treesPlanted: this?.treesPlanted.orZero() ?? 0,
        projectsSupportedCount: this?.projectsSupportedCount.orZero() ?? 0);
  }
}

extension MyOrderFetchResponseToModal on OrderFetchResponse? {
  MyOrdersListModal toDomain(String currency) {
    return MyOrdersListModal(
        metadata: this?.metadata.toDomain() ?? MetadataModal.empty(),
        orders: this?.orders?.map((e) => e.toDomain(currency)).toList() ?? []);
  }
}

extension MetadataToModal on Metadata? {
  MetadataModal toDomain() {
    return MetadataModal(
        total: this?.total.orZero() ?? 0,
        totalPages: this?.totalPages.orZero() ?? 0,
        currentPage: this?.currentPage.orZero() ?? 0,
        nextPage: this?.nextPage);
    //this?.nextPage.orZero() ??
  }
}

extension OrdersFetchSingleOrderResponseToModal on Order? {
  OrderFetchModal toDomain(String currency) {
    // print(this?.paymentLogs);
    return OrderFetchModal(
      id: this?.id.orEmpty() ?? '',
      orderNumber: this?.orderNumber.orEmpty() ?? '',
      products: this?.products?.map((e) => e.toDomain(currency)).toList() ?? [],
      customer: this?.customer.toDomain() ?? OrderCustomerModal.empty(),
      orderTotal: this?.orderTotal.orZero() ?? 0.0,
      calculatedCouponDiscount: this?.calculatedCouponDiscount.orZero() ?? 0,
      subTotal: this?.subTotal.orZero() ?? 0,
      billingAddress: this?.billingAddress.toDomain(),
      carbonOffsetEarned: this?.carbonOffsetEarned.orZero().toDouble() ?? 0,
      paymentMode: this?.paymentMode.orEmpty() ?? '',
      paymentMethod: this?.paymentMethod.orEmpty() ?? '',
      paymentStatus: this?.paymentStatus.orEmpty() ?? '',
      subscriptionCancelledAt: this?.subscriptionCancelledAt.orZero() ?? 0,
      certificates: this?.certificates?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status.orZero() ?? 0,
      emailSentStatus: this?.emailSentStatus.orZero().toDouble() ?? 0,
      metricsCalculatedStatus:
          this?.metricsCalculatedStatus.orZero().toDouble() ?? 0,
      createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
      updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
      v: this?.v.orZero() ?? 0,
      invoice: this?.invoice.toDomain() ?? InvoiceModal.empty(),
      currency: this?.currency ?? '',
      currencySymbol: this?.currencySymbol ?? '\$',
      paymentLogModal:
          this?.paymentLogs?.map((e) => e.toDomain()).toList() ?? [],
      isSubscriptionCycleCompleted:
          this?.isSubscriptionCycleCompleted.orZero() ?? 0,
      couponCode: this?.couponCode ?? '',
      coupon: this?.coupon.toDomain() ?? CouponModal.empty(),
    );
  }
}

extension CouponToModal on Coupon? {
  CouponModal toDomain() {
    return CouponModal(
        id: this?.id.orEmpty() ?? '',
        code: this?.code.orEmpty() ?? '',
        type: this?.type.orEmpty() ?? '',
        discountUnit: this?.discountUnit.orZero() ?? 0,
        startDate: this?.startDate ?? DateTime.fromMillisecondsSinceEpoch(1),
        endDate: this?.endDate ?? DateTime.fromMillisecondsSinceEpoch(1),
        status: this?.status.orZero() ?? 0,
        createdAt: this?.createdAt ?? DateTime.fromMillisecondsSinceEpoch(1),
        updatedAt: this?.updatedAt ?? DateTime.fromMillisecondsSinceEpoch(1),
        v: this?.v.orZero() ?? 0);
  }
}

extension OrderProductElementToModal on OrderProductElement? {
  OrderProductElementModal toDomain(String currency) {
    return OrderProductElementModal(
      product:
          this?.product.toDomain(currency) ?? FetchOrderProductModal.empty(),
      price: this?.price.orZero() ?? 0,
      quantity: this?.quantity.orZero() ?? 0,
      certificate: this?.certificate.toDomain() ??
          OrderProductCertificate(certificateURL: '', originNumber: ''),
      id: this?.id.orEmpty() ?? '',
      updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
      createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
    );
  }
}

extension OrderProductCertificateResponseToMdal
    on OrderProductCertificateResponse? {
  OrderProductCertificate toDomain() {
    return OrderProductCertificate(
        certificateURL: this?.certificateURL ?? '',
        originNumber: this?.originNumber ?? '');
  }
}

extension FetchOrderProductDataToModal on FetchOrderProductData? {
  FetchOrderProductModal toDomain(String currency) {
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
    return FetchOrderProductModal(
        docLinks: this?.docLinks ?? [],
        id: this?.id.orEmpty() ?? '',
        tag: this?.tag ?? [],
        productsListId: this?.productId ?? 0,
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
        status: this?.status.orEmpty() ?? '',
        subCategory: this?.subCategory.orEmpty() ?? '',
        productType: this?.productType.orEmpty() ?? '',
        productSubType: this?.productSubType.orEmpty() ?? '',
        priceList: this?.priceList?.map((e) => e.toDomain()).toList() ?? [],
        name: this?.name.orEmpty() ?? '',
        slug: this?.slug.orEmpty() ?? '',
        discount: this?.discount.orZero() ?? 0,
        priceInUsd: usdPrice!,
        priceLocal: localPrice,
        details:
            this?.details.toDomain() ?? FetchOrderProductDetailsModal.empty());
  }
}

extension FetchOrderProductDetailsResponseToModal
    on FetchOrderProductDetailsResponse? {
  FetchOrderProductDetailsModal toDomain() {
    return FetchOrderProductDetailsModal(
        projectModal: this?.project.toDomain() ?? ProjectModal.empty());
  }
}

extension CustomerToModal on Customer? {
  OrderCustomerModal toDomain() {
    return OrderCustomerModal(
        id: this?.id.orEmpty() ?? '',
        user: this?.user.orEmpty() ?? '',
        address: this?.address ?? [],
        status: this?.status.orEmpty() ?? '',
        createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        v: this?.v.orZero() ?? 0,
        ghgReduced: this?.ghgReduced.orZero() ?? 0,
        projectsSupported: this?.projectsSupported ?? [],
        projectsSupportedCount: this?.projectsSupportedCount.orZero() ?? 0,
        treesPlanted: this?.treesPlanted.orZero() ?? 0);
  }
}

extension CertificateToModal on Certificate? {
  CertificateModal toDomain() {
    return CertificateModal(
        id: this?.id.orEmpty() ?? '',
        originNumber: this?.originNumber.orEmpty() ?? '',
        customer: this?.customer.orEmpty() ?? '',
        userCertificateSlug: this?.userCertificateSlug.orEmpty() ?? '',
        order: this?.order.orEmpty() ?? '',
        product: this?.product.orEmpty() ?? '',
        certificateUrl: this?.certificateUrl.orEmpty() ?? '',
        status: this?.status.orZero() ?? 0,
        createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        v: this?.v.orZero() ?? 0,
        transactionId: this?.transactionId.orEmpty() ?? '');
  }
}

extension InvoiceToModal on Invoice? {
  InvoiceModal toDomain() {
    return InvoiceModal(
        id: this?.id.orEmpty() ?? "",
        status: this?.status.orZero() ?? 0,
        createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        v: this?.v.orZero() ?? 0,
        filePath: this?.filePath.orEmpty() ?? "");
  }
}
