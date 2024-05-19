import 'Details.dart';

class Data {
  Data({
      this.id,
      this.id2,
      this.formalName, 
      this.tag, 
      this.name, 
      this.slug, 
      this.stock,
      this.category, 
      this.subCategory, 
      this.productType,
      this.productSubType, 
      this.state, 
      this.country, 
      this.sku, 
      this.thumbImage, 
      this.image, 
      this.video, 
      this.shortDescription, 
      this.longDescription, 
      this.details, 
      this.status, 
      this.discount, 
      this.actualStock, 
      this.avgRating, 
      this.ratingCount, 
      this.seller, 
      this.updatedAt, 
      this.docLinks,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    id2 = json['id'];
    formalName = json['formalName'];
    tag = json['tag'] != null ? json['tag'].cast<String>() : [];
    name = json['name'];
    slug = json['slug'];
    stock = json['stock'];
    category = json['category'];
    subCategory = json['subCategory'];
    productType = json['productType'];
    productSubType = json['productSubType'];
    state = json['state'];
    country = json['country'];
    sku = json['sku'];
    thumbImage = json['thumbImage'] != null ? json['thumbImage'].cast<String>() : [];
    image = json['image'] != null ? json['image'].cast<String>() : [];
    video = json['video'] != null ? json['video'].cast<String>() : [];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
    status = json['status'];
    discount = json['discount'];
    actualStock = json['actualStock'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    seller = json['seller'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? id2;
  String? formalName;
  List<String>? tag;
  String? name;
  String? slug;
  dynamic stock;
  String? category;
  String? subCategory;
  String? productType;
  String? productSubType;
  String? state;
  String? country;
  String? sku;
  List<String>? thumbImage;
  List<String>? image;
  List<String>? video;
  String? shortDescription;
  String? longDescription;
  Details? details;
  String? status;
  dynamic discount;
  dynamic actualStock;
  dynamic avgRating;
  dynamic ratingCount;
  String? seller;
  String? updatedAt;
  List<dynamic>? docLinks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['id'] = id;
    map['formalName'] = formalName;
    map['tag'] = tag;
    map['name'] = name;
    map['slug'] = slug;
    map['stock'] = stock;
    map['category'] = category;
    map['subCategory'] = subCategory;
    map['productType'] = productType;
    map['productSubType'] = productSubType;
    map['state'] = state;
    map['country'] = country;
    map['sku'] = sku;
    map['thumbImage'] = thumbImage;
    map['image'] = image;
    map['video'] = video;
    map['shortDescription'] = shortDescription;
    map['longDescription'] = longDescription;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    map['status'] = status;
    map['discount'] = discount;
    map['actualStock'] = actualStock;
    map['avgRating'] = avgRating;
    map['ratingCount'] = ratingCount;
    map['seller'] = seller;
    map['updatedAt'] = updatedAt;
    if (docLinks != null) {
      map['docLinks'] = docLinks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}