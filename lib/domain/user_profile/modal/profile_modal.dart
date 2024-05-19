import 'package:intl_phone_field/phone_number.dart';
import 'package:net_carbons/domain/auth/model/modals.dart';
import 'package:net_carbons/domain/user_profile/modal/last_loogedin_info_modal.dart';

class UserProfileModal {
  UserProfileModal(
      {this.calculationsResponseModal,
      required this.user,
      this.billingAddress,
      this.addressCountry,
      this.checkoutDefaultCurrency,
      this.selectedCountry,
      this.lastLoggedIn,
      this.deviceInfoModal});

  UserModel user;
  BillingAddressModal? billingAddress;
  final DateTime? lastLoggedIn;
  final CarbonCalculationsResponseModal? calculationsResponseModal;
  String? addressCountry;
  String? selectedCountry;
  String? checkoutDefaultCurrency;
  DeviceInfoModal? deviceInfoModal;


  UserProfileModal copyWith(
      {UserModel? userModel,
      BillingAddressModal? billingAddressModal,
      DeviceInfoModal? deviceInfoModal}) {
    return UserProfileModal(
        user: user,
        billingAddress: billingAddress ?? billingAddress,
        addressCountry: '',
        checkoutDefaultCurrency: '',
        selectedCountry: '',
        deviceInfoModal: deviceInfoModal ?? this.deviceInfoModal);
  }

  factory UserProfileModal.empty() => UserProfileModal(
      billingAddress: null,
      user: UserModel.empty(),
      addressCountry: '',
      checkoutDefaultCurrency: '',
      selectedCountry: '',
      deviceInfoModal: null);
}

class BillingAddressModal {
  BillingAddressModal({
    required this.id,
    required this.customerProfile,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.stateCode,
    required this.countryCode,
     this.contactNo,
    required this.firstName,
    required this.lastName,
    required this.email,

  });
  final String id;
  final String customerProfile;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String country;
  final String pincode;
  final String stateCode;
  final String countryCode;
  final PhoneNumber? contactNo;
  final String firstName;
  final String lastName;
  final String email;

  // factory BillingAddressModal.empty() => BillingAddressModal(
  //       id: '',
  //       customerProfile: '',
  //       addressLine1: '',
  //       addressLine2: '',
  //       city: '',
  //       state: '',
  //       country: '',
  //       pincode: '',
  //       stateCode: '',
  //       countryCode: '',
  //       contactNo: '',
  //       firstName: '',
  //       lastName: '',
  //       email: '',
  //     );

  @override
  String toString() => """" id: '$id',
    customerProfile: '$customerProfile',
    addressLine1: '$addressLine1',
    addressLine2: '$addressLine2',
    city: '$city',
    state: '$state',
    country: '$country',
    pincode: '$pincode',
    stateCode: '$state',
    countryCode: '$countryCode',
    contactNo: '$contactNo',
    firstName: '$firstName',
    lastName: '$lastName',
    email: '$email',
    """;
  BillingAddressModal copyWith({
    String? id,
    String? customerProfile,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? country,
    String? pincode,
    String? stateCode,
    String? countryCode,
    PhoneNumber? contactNo,
    String? firstName,
    String? lastName,
    String? email,
  }) {
    return BillingAddressModal(
        id: id ?? this.id,
        customerProfile: customerProfile ?? this.customerProfile,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        pincode: pincode ?? this.pincode,
        stateCode: stateCode ?? this.stateCode,
        countryCode: countryCode ?? this.countryCode,
        contactNo: contactNo ?? this.contactNo,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email);
  }

  bool isInvalid() =>
      customerProfile.isEmpty ||
      addressLine1.isEmpty ||
      city.isEmpty ||
      state.isEmpty ||
      country.isEmpty ||
      pincode.isEmpty ||
      stateCode.isEmpty ||
      countryCode.isEmpty ||
      contactNo == null ||
      firstName.isEmpty ||
      lastName.isEmpty;
}

class CarbonCalculationsResponseModal {
  CarbonCalculationsResponseModal({
    required this.houseHoldMembers,
    required this.publicTransportationMembers,
    required this.income,
    required this.houseSize,
    required this.airTravel,
    required this.meatConsumption,
    required this.totalCarbonEmissions,
    required this.countryCode,
  });

  final int houseHoldMembers;
  final int publicTransportationMembers;
  final String income;
  final String houseSize;
  final String airTravel;
  final String meatConsumption;
  final double totalCarbonEmissions;
  final String countryCode;
}
