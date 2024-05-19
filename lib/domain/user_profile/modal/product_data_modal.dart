import 'package:net_carbons/domain/home_products/modal/models.dart';

class FetchOrderProductModal {
  FetchOrderProductModal(
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
      this.priceLocal});

  List<dynamic> docLinks;
  String id;
  List<String> tag;
  int productsListId;
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
  FetchOrderProductDetailsModal details;
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

  factory FetchOrderProductModal.empty() => FetchOrderProductModal(
      docLinks: [],
      id: '',
      tag: [],
      productsListId: 0,
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
      details: FetchOrderProductDetailsModal.empty(),
      status: '',
      subCategory: '',
      productType: '',
      productSubType: '',
      priceList: [],
      name: '',
      slug: '',
      discount: 0,
      priceLocal: PriceListModal.empty(),
      priceInUsd: PriceListModal.empty());

  factory FetchOrderProductModal.emptyCalc() => FetchOrderProductModal(
      docLinks: [],
      id: '',
      tag: [],
      productsListId: 0,
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
      details: FetchOrderProductDetailsModal.empty(),
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
      priceInUsd: PriceListModal.empty());
}

class FetchOrderProductDetailsModal {
  FetchOrderProductDetailsModal({required this.projectModal});
  factory FetchOrderProductDetailsModal.empty() =>
      FetchOrderProductDetailsModal(projectModal: ProjectModal.empty());

  ProjectModal projectModal;
}
