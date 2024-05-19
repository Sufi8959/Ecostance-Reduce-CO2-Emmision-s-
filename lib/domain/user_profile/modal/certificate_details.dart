import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/data/user_profile/get_certificate_response/buyer.dart';
import 'package:net_carbons/data/user_profile/get_certificate_response/get_certificate_response.dart';
import 'package:net_carbons/data/user_profile/get_certificate_response/project.dart';
import 'package:net_carbons/data/user_profile/get_certificate_response/standard.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/certificate.dart';

class CertificateDetailsModal {
  CertificateDetailsModal({
    required this.formattedNewOriginNumber,
    required this.originNumber,
    required this.quantity,
    required this.project,
    required this.buyer,
  });

  String formattedNewOriginNumber;
  String originNumber;
  int quantity;
  CertificateDetailProjectModal project;
  CertificateDetailBuyerModal buyer;
}

class CertificateDetailBuyerModal {
  CertificateDetailBuyerModal({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.deliveryDate,
    required this.transactionId,
  });

  String firstName;
  String lastName;
  String city;
  String state;
  String country;
  String pincode;
  DateTime deliveryDate;
  String transactionId;

  factory CertificateDetailBuyerModal.empty() => CertificateDetailBuyerModal(
      firstName: '',
      lastName: '',
      city: '',
      state: '',
      country: '',
      pincode: '',
      deliveryDate: DateTime.fromMicrosecondsSinceEpoch(1),
      transactionId: '');
}

class CertificateDetailProjectModal {
  CertificateDetailProjectModal({
    required this.name,
    required this.owner,
    required this.number,
    required this.state,
    required this.standards,
    required this.intermediaries,
  });

  String name;
  String owner;
  String number;
  String state;
  List<CertificateDetailStandardModal> standards;
  List<dynamic> intermediaries;

  factory CertificateDetailProjectModal.empty() =>
      CertificateDetailProjectModal(
          name: '',
          owner: '',
          number: '',
          state: '',
          standards: [],
          intermediaries: []);
}

class CertificateDetailStandardModal {
  CertificateDetailStandardModal({
    required this.id,
    required this.standardId,
    required this.type,
    required this.name,
    required this.companyWebsite,
    required this.methodology,
    required this.logo,
    required this.link,
    required this.description,
  });

  String id;
  String standardId;
  String type;
  String name;
  String companyWebsite;
  String methodology;
  String logo;
  String link;
  String description;
}

extension CertificateDetailsToModal on GetCertificateResponse? {
  CertificateDetailsModal toDomain() {
    return CertificateDetailsModal(
        formattedNewOriginNumber:
            this?.formattedNewOriginNumber.orEmpty() ?? '',
        originNumber: this?.originNumber.orEmpty() ?? '',
        quantity: this?.quantity.orZero() ?? 0,
        project:
            this?.project.toDomain() ?? CertificateDetailProjectModal.empty(),
        buyer: this?.buyer.toDomain() ?? CertificateDetailBuyerModal.empty());
  }
}

extension CertificateDetailBuyerToModal on GetCertificateResponseBuyer? {
  CertificateDetailBuyerModal toDomain() {
    return CertificateDetailBuyerModal(
        firstName: this?.firstName.orEmpty() ?? '',
        lastName: this?.lastName.orEmpty() ?? '',
        city: this?.city.orEmpty() ?? '',
        state: this?.state.orEmpty() ?? '',
        country: this?.country.orEmpty() ?? '',
        pincode: this?.pincode.orEmpty() ?? '',
        deliveryDate:
            this?.deliveryDate ?? DateTime.fromMicrosecondsSinceEpoch(1),
        transactionId: this?.transactionId.orEmpty() ?? '');
  }
}

extension CertificateProjectToDomain on GetCertificateResponseProject? {
  CertificateDetailProjectModal toDomain() {
    return CertificateDetailProjectModal(
        name: this?.name.orEmpty() ?? '',
        owner: this?.owner.orEmpty() ?? '',
        number: this?.number.orEmpty() ?? '',
        state: this?.state.orEmpty() ?? '',
        standards: this?.standards?.map((e) => e.toDomain()).toList() ?? [],
        intermediaries: this?.intermediaries ?? []);
  }
}

extension CertificateDetailStandardToModal on GetCertificateResponseStandard? {
  CertificateDetailStandardModal toDomain() {
    return CertificateDetailStandardModal(
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
