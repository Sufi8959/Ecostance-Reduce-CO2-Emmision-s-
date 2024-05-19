import 'package:copy_with_extension/copy_with_extension.dart';
import '../../../data/home_products/responses/product_list/document.dart';
part 'models.g.dart';

class ProductsListModal {
  ProductsListModal({required this.products, required this.metadata});

  List<ProductModal> products;
  ProductsMetadata metadata;
}

@CopyWith()
class ProductModal {
  ProductModal(
      {required this.docLinks,
      required this.id,
      required this.tag,
      required this.productsListId,
      required this.formalName,
      required this.stock,
      required this.category,
      required this.state,
      required this.country,
      required this.sku,
      required this.thumbImage,
      required this.image,
      required this.video,
      required this.shortDescription,
      required this.longDescription,
      required this.details,
      required this.status,
      required this.subCategory,
      required this.productType,
      required this.productSubType,
      required this.priceList,
      required this.name,
      required this.slug,
      required this.discount,
      required this.priceInUsd,
      this.priceLocal,
      required this.avgRating,
      required this.ratingCount});

  List<dynamic> docLinks;
  String id;
  List<String> tag;
  String productsListId;
  String formalName;
  int stock;
  String category;
  String state;
  String country;
  String sku;
  List<String> thumbImage;
  List<String> image;
  List<String> video;
  String shortDescription;
  String longDescription;
  DetailsModal details;
  String status;
  String subCategory;
  String productType;
  String productSubType;
  List<PriceListModal> priceList;
  String name;
  String slug;
  int discount;
  PriceListModal priceInUsd;
  PriceListModal? priceLocal;
  int ratingCount;
  double avgRating;

  factory ProductModal.empty() => ProductModal(
      docLinks: [],
      id: '',
      tag: [],
      productsListId: '',
      formalName: '',
      stock: 0,
      category: '',
      state: '',
      country: '',
      sku: '',
      thumbImage: [],
      image: [],
      video: [],
      shortDescription: '',
      longDescription: '',
      details: DetailsModal.empty(),
      status: '',
      subCategory: '',
      productType: '',
      productSubType: '',
      priceList: [],
      name: '',
      slug: '',
      discount: 0,
      priceLocal: PriceListModal.empty(),
      priceInUsd: PriceListModal.empty(),
      avgRating: 0,
      ratingCount: 0);

  factory ProductModal.emptyCalc() => ProductModal(
      docLinks: [],
      id: '',
      tag: [],
      productsListId: '',
      formalName: '',
      stock: 0,
      category: '',
      state: '',
      country: '',
      sku: '',
      thumbImage: [],
      image: [],
      video: [],
      shortDescription: '',
      longDescription: '',
      details: DetailsModal.empty(),
      status: '',
      subCategory: '',
      productType: '',
      productSubType: '',
      priceList: [
        PriceListModal(
            price: 0, currency: "USD", oldPrice: 0, currencySymbol: '')
      ],
      name: '',
      slug: '',
      discount: 0,
      priceLocal: PriceListModal.empty(),
      priceInUsd: PriceListModal.empty(),
      avgRating: 0,
      ratingCount: 0);
}

extension ProductModalGetWithCurrency on ProductModal {
  ProductModal getWithUpdatedCurrency(String currency) {
    return copyWith(
        priceLocal: priceList.firstWhere(
      (element) => element.currency == currency,
      orElse: () =>
          priceList.firstWhere((element) => element.currency == currency),
    ));
  }
}

class DetailsModal {
  DetailsModal({
    required this.project,
    required this.sdgs,
    required this.standards,
    required this.stdMethod,
    required this.estimatedAnnualEmissionReduction,
    required this.creditsIssued,
    required this.operationRegistration,
    required this.termStart,
    required this.termEnd,
    required this.location,
    required this.landArea,
    required this.coBenifitsDescription,
    required this.documents,
  });

  ProjectModal project;
  List<SdgElementModal> sdgs;
  List<StandardModal> standards;
  StdMethodModal stdMethod;
  String estimatedAnnualEmissionReduction;
  String creditsIssued;
  DateTime operationRegistration;
  DateTime termStart;
  DateTime termEnd;
  List<LocationDetailsModal> location;
  String landArea;
  String coBenifitsDescription;
  List<Document> documents;

  factory DetailsModal.empty() => DetailsModal(
      project: ProjectModal.empty(),
      sdgs: [],
      standards: [],
      stdMethod: StdMethodModal.empty(),
      estimatedAnnualEmissionReduction: '',
      creditsIssued: '',
      operationRegistration: DateTime.fromMicrosecondsSinceEpoch(1),
      termStart: DateTime.fromMicrosecondsSinceEpoch(1),
      termEnd: DateTime.fromMicrosecondsSinceEpoch(1),
      // location: [],
      landArea: '',
      coBenifitsDescription: '',
      documents: [],
      location: []);
}

class ProjectModal {
  ProjectModal(
      {required this.exchange,
      required this.scale,
      required this.id,
      required this.link,
      required this.participants,
      required this.size,
      required this.start,
      required this.completion,
      required this.validator,
      required this.validatorLink,
      required this.monitor,
      required this.monitorNotes,
      required this.monitorLink,
      required this.auditor,
      required this.information,
      required this.owners,
      required this.developers,
      required this.funders,
      required this.documents});

  String exchange;
  String scale;
  String id;
  String link;
  String participants;
  String size;
  DateTime start;
  String completion;
  String validator;
  String validatorLink;
  String monitor;
  String monitorNotes;
  String monitorLink;
  List<AuditorModal> auditor;
  String information;
  List<String> owners;
  String developers;
  String funders;
  List<ProjectDocumentsModal> documents;

  factory ProjectModal.empty() => ProjectModal(
      exchange: '',
      scale: '',
      id: '',
      link: '',
      participants: '',
      size: '',
      start: DateTime.fromMicrosecondsSinceEpoch(1),
      completion: '',
      validator: '',
      validatorLink: '',
      monitor: '',
      monitorNotes: '',
      monitorLink: '',
      auditor: [],
      information: '',
      owners: [],
      developers: '',
      funders: '',
      documents: []);
}

class ProjectDocumentsModal {
  ProjectDocumentsModal({
    required this.name,
    required this.link,
  });

  String name;

  String link;
}

class AuditorModal {
  AuditorModal({
    required this.name,
    required this.notes,
    required this.link,
  });

  String name;
  String notes;
  String link;
}

class SdgElementModal {
  SdgElementModal({
    required this.sdg,
    required this.details,
    required this.fulFilled,
  });

  SdgSdgModal sdg;
  String details;
  bool fulFilled;
}

class SdgSdgModal {
  SdgSdgModal({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.imageInvert,
    required this.v,
    required this.index,
  });
  String id;
  String name;
  String description;
  String image;
  String imageInvert;
  int v;
  int index;
  factory SdgSdgModal.empty() => SdgSdgModal(
      id: '',
      name: '',
      description: '',
      image: '',
      imageInvert: '',
      v: 0,
      index: 0);
}

class StandardModal {
  StandardModal({
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

class StdMethodModal {
  StdMethodModal({
    required this.type,
    required this.version,
    required this.link,
  });

  String type;
  String version;
  String link;
  factory StdMethodModal.empty() =>
      StdMethodModal(type: '', version: '', link: '');
}

class PriceListModal {
  PriceListModal(
      {required this.price,
      required this.currency,
      required this.oldPrice,
      required this.currencySymbol});

  double price;
  String currency;
  double oldPrice;
  String currencySymbol;
  factory PriceListModal.empty() =>
      PriceListModal(price: 0, currency: '', oldPrice: 0, currencySymbol: '');
}

class LocationDetailsModal {
  LocationDetailsModal({
    required this.lat,
    required this.long,
    required this.degreeDecimal,
    required this.description,
    required this.images,
  });

  String lat;
  String long;
  DegreeDecimalModal degreeDecimal;
  String description;
  List<LocationImageModal> images;

  factory LocationDetailsModal.empty() => LocationDetailsModal(
      lat: '',
      long: '',
      degreeDecimal: DegreeDecimalModal.empty(),
      description: '',
      images: []);
}

class DegreeDecimalModal {
  DegreeDecimalModal({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;
  factory DegreeDecimalModal.empty() =>
      DegreeDecimalModal(type: '', coordinates: []);
}

class LocationImageModal {
  LocationImageModal({
    required this.link,
    required this.size,
  });

  String link;
  String size;
}

class ProductsMetadata {
  ProductsMetadata({
    required this.total,
    required this.totalPages,
    required this.currentPage,
    required this.nextPage,
  });

  final int total;
  final int totalPages;
  final int currentPage;
  final int? nextPage;
}
