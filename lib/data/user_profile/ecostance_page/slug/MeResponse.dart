import 'Data.dart';
import 'Slug.dart';
import 'BillingAddress.dart';
import 'CarbonCalculations.dart';
import 'DeviceInfo.dart';

class MeResponse {
  MeResponse({
      this.success,
      this.data, 
      this.slug, 
      this.billingAddress, 
      this.carbonCalculations, 
      this.addressCountry, 
      this.selectedCountry, 
      this.checkoutDefaultCurrency, 
      this.lastLoggedIn, 
      this.deviceInfo, 
      this.temporaryCheckoutCurrency,});

  MeResponse.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    slug = json['slug'] != null ? Slug.fromJson(json['slug']) : null;
    billingAddress = json['billingAddress'] != null ? BillingAddress.fromJson(json['billingAddress']) : null;
    carbonCalculations = json['carbonCalculations'] != null ? CarbonCalculations.fromJson(json['carbonCalculations']) : null;
    addressCountry = json['addressCountry'];
    selectedCountry = json['selectedCountry'];
    checkoutDefaultCurrency = json['checkoutDefaultCurrency'];
    lastLoggedIn = json['lastLoggedIn'];
    deviceInfo = json['deviceInfo'] != null ? DeviceInfo.fromJson(json['deviceInfo']) : null;
    temporaryCheckoutCurrency = json['temporaryCheckoutCurrency'];
  }
  bool? success;
  Data? data;
  Slug? slug;
  BillingAddress? billingAddress;
  CarbonCalculations? carbonCalculations;
  String? addressCountry;
  String? selectedCountry;
  String? checkoutDefaultCurrency;
  String? lastLoggedIn;
  DeviceInfo? deviceInfo;
  String? temporaryCheckoutCurrency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (slug != null) {
      map['slug'] = slug?.toJson();
    }
    if (billingAddress != null) {
      map['billingAddress'] = billingAddress?.toJson();
    }
    if (carbonCalculations != null) {
      map['carbonCalculations'] = carbonCalculations?.toJson();
    }
    map['addressCountry'] = addressCountry;
    map['selectedCountry'] = selectedCountry;
    map['checkoutDefaultCurrency'] = checkoutDefaultCurrency;
    map['lastLoggedIn'] = lastLoggedIn;
    if (deviceInfo != null) {
      map['deviceInfo'] = deviceInfo?.toJson();
    }
    map['temporaryCheckoutCurrency'] = temporaryCheckoutCurrency;
    return map;
  }

}