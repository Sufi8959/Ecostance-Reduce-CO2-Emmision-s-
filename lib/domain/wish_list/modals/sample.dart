//
//
//
// class WishlistProductDataModalModal {
//   WishlistProductDataModalModal({
//     required this.docLinks,
//     required this.id,
//     required this.tag,
//     required this.productId,
//     required this.formalName,
//     required this.stock,
//     required this.category,
//     required this.state,
//     required this.country,
//     required this.sku,
//     required this.thumbImage,
//     required this.image,
//     required this.video,
//     required this.shortDescription,
//     required this.longDescription,
//     required this.details,
//     required this.status,
//     required this.subCategory,
//     required this.productType,
//     required this.productSubType,
//     required this.priceList,
//     required this.name,
//     required this.slug,
//     required this.discount,
//     required this.categoryList,
//   });
//
//   final List<dynamic> docLinks;
//   final String id;
//   final List<String> tag;
//   final int productId;
//   final String formalName;
//   final int stock;
//   final String category;
//   final String state;
//   final String country;
//   final String sku;
//   final List<String> thumbImage;
//   final List<String> image;
//   final List<String> video;
//   final String shortDescription;
//   final String longDescription;
//   final WishlistProductDetailsModal details;
//   final String status;
//   final String subCategory;
//   final String productType;
//   final String productSubType;
//   final List<WishlistProductPriceListModal> priceList;
//   final String name;
//   final String slug;
//   final int discount;
//   final List<WishlistProductCategoryListModal> categoryList;
// }
//
// class WishlistProductCategoryListModal {
//   WishlistProductCategoryListModal({
//     required this.category,
//     required this.subCategory,
//   });
//
//   final String category;
//   final String subCategory;
// }
//
// class WishlistProductDetailsModal {
//   WishlistProductDetailsModal({
//     required this.project,
//     required this.sdgs,
//     required this.standards,
//     required this.stdMethod,
//     required this.estimatedAnnualEmissionReduction,
//     required this.creditsIssued,
//     required this.operationRegistration,
//     required this.termStart,
//     required this.termEnd,
//     required this.location,
//     required this.landArea,
//     required this.coBenifitsDescription,
//     required this.documents,
//     required this.link,
//   });
//
//   final WishlistProductProjectModal project;
//   final List<WishlistProductSdgElementModal> sdgs;
//   final List<String> standards;
//   final WishlistProductStdMethodModal stdMethod;
//   final String estimatedAnnualEmissionReduction;
//   final String creditsIssued;
//   final DateTime operationRegistration;
//   final DateTime termStart;
//   final DateTime termEnd;
//   final List<WishlistProductLocationModal> location;
//   final String landArea;
//   final String coBenifitsDescription;
//   final String documents;
//   final String link;
// }
//
// class WishlistProductLocationModal {
//   WishlistProductLocationModal({
//     required this.lat,
//     required this.long,
//     required this.description,
//     required this.lang,
//     required this.degreeDecimal,
//     required this.images,
//   });
//
//   final String lat;
//   final String long;
//   final String description;
//   final String lang;
//   final WishlistProductDegreeDecimalModal degreeDecimal;
//   final List<WishlistProductImageModal> images;
// }
//
// class WishlistProductDegreeDecimalModal {
//   WishlistProductDegreeDecimalModal({
//     required this.type,
//     required this.coordinates,
//   });
//
//   final String type;
//   final List<double> coordinates;
// }
//
// class WishlistProductImageModal {
//   WishlistProductImageModal({
//     required this.link,
//     required this.size,
//   });
//
//   final String link;
//   final String size;
// }
//
// class WishlistProductProjectModal {
//   WishlistProductProjectModal({
//     required this.exchange,
//     required this.scale,
//     required this.id,
//     required this.link,
//     required this.participants,
//     required this.size,
//     required this.start,
//     required this.completion,
//     required this.validator,
//     required this.validatorLink,
//     required this.monitor,
//     required this.monitorNotes,
//     required this.monitorLink,
//     required this.auditor,
//     required this.information,
//     required this.owners,
//     required this.developers,
//     required this.funders,
//     required this.documents,
//   });
//
//   final String exchange;
//   final String scale;
//   final String id;
//   final String link;
//   final String participants;
//   final String size;
//   final String start;
//   final String completion;
//   final String validator;
//   final String validatorLink;
//   final String monitor;
//   final String monitorNotes;
//   final String monitorLink;
//   final List<WishlistProductAuditorModal> auditor;
//   final String information;
//   final String owners;
//   final String developers;
//   final String funders;
//   final List<WishlistProductDocumentModal> documents;
// }
//
// class WishlistProductAuditorModal {
//   WishlistProductAuditorModal({
//     required this.name,
//     required this.notes,
//     required this.link,
//   });
//
//   final String name;
//   final String notes;
//   final String link;
// }
//
// class WishlistProductDocumentModal {
//   WishlistProductDocumentModal({
//     required this.name,
//     required this.link,
//   });
//
//   final String name;
//   final String link;
// }
//
// class WishlistProductSdgElementModal {
//   WishlistProductSdgElementModal({
//     required this.sdg,
//     required this.details,
//     required this.fulFilled,
//   });
//
//   final String sdg;
//   final String details;
//   final bool fulFilled;
// }
//
//
// class WishlistProductStdMethodModal {
//   WishlistProductStdMethodModal({
//     required this.type,
//     required this.version,
//     required this.link,
//   });
//
//   final String type;
//   final String version;
//   final String link;
// }
//
// class WishlistProductPriceListModal {
//   WishlistProductPriceListModal({
//     required this.price,
//     required this.currency,
//     required this.oldPrice,
//     required this.currencySymbol,
//   });
//
//   final double price;
//   final String currency;
//   final double oldPrice;
//   final String currencySymbol;
// }
//
//
