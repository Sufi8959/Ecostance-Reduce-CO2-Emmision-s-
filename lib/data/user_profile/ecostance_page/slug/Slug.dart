class Slug {
  Slug({
      this.isBusinessAccount, 
      this.id, 
      this.customer, 
      this.firstName, 
      this.lastName, 
      this.slug, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Slug.fromJson(dynamic json) {
    isBusinessAccount = json['isBusinessAccount'];
    id = json['_id'];
    customer = json['customer'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  bool? isBusinessAccount;
  String? id;
  String? customer;
  String? firstName;
  String? lastName;
  String? slug;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isBusinessAccount'] = isBusinessAccount;
    map['_id'] = id;
    map['customer'] = customer;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['slug'] = slug;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}