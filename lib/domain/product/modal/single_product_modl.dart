// class SingleProductModal {
//   SingleProductModal({
//     required this.id,
//     required this.seller,
//     required this.standards,
//     required this.sdgs,
//     required this.sku,
//     required this.name,
//     required this.slug,
//     required this.price,
//     required this.singleProductModalNew,
//     required this.rating,
//     required this.ratingCount,
//     required this.saleCount,
//     required this.category,
//     required this.tag,
//     required this.thumbImage,
//     required this.image,
//     required this.shortDescription,
//     required this.fullDescription,
//     required this.docLinks,
//     required this.status,
//     required this.v,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   String id;
//   String seller;
//   List<String> standards;
//   List<SdgElement> sdgs;
//   String sku;
//   String name;
//   String slug;
//   int price;
//   bool singleProductModalNew;
//   int rating;
//   int ratingCount;
//   int saleCount;
//   List<String> category;
//   List<String> tag;
//   List<String> thumbImage;
//   List<String> image;
//   String shortDescription;
//   String fullDescription;
//   List<dynamic> docLinks;
//   String status;
//   int v;
//   DateTime createdAt;
//   DateTime updatedAt;
// }
//
// class SdgElement {
//   SdgElement({
//     required this.sdg,
//     required this.fullFilled,
//   });
//
//   SdgModal sdg;
//   bool fullFilled;
// }
//
// class SdgModal {
//   SdgModal({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.image,
//     required this.imageInvert,
//     required this.v,
//     required this.index,
//   });
//
//   String id;
//   String name;
//   String description;
//   String image;
//   String imageInvert;
//   int v;
//   int index;
//   factory SdgModal.empty() => SdgModal(
//       description: '',
//       id: '',
//       image: '',
//       imageInvert: '',
//       index: 0,
//       name: '',
//       v: 0);
// }
