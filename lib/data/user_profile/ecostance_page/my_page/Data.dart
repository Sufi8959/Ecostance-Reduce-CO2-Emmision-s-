import 'Draft.dart';
import 'Published.dart';
import 'Previous.dart';

class Data {
  Data({
    this.isBusinessAccount,
    this.id,
    this.customer,
    this.status,
    this.isPublic,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.draft,
    this.published,
    this.previous,
  });

  Data.fromJson(dynamic json) {
    isBusinessAccount = json['isBusinessAccount'];
    id = json['_id'];
    customer = json['customer'];
    status = json['status'];
    isPublic = json['isPublic'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    draft = json['draft'] != null ? Draft.fromJson(json['draft']) : null;
    published = json['published'] != null
        ? Published.fromJson(json['published'])
        : null;
    previous =
        json['previous'] != null ? Previous.fromJson(json['previous']) : null;
  }
  bool? isBusinessAccount;
  String? id;
  String? customer;
  int? status;
  bool? isPublic;
  String? createdAt;
  String? updatedAt;
  int? v;
  Draft? draft;
  Published? published;
  Previous? previous;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isBusinessAccount'] = isBusinessAccount;
    map['_id'] = id;
    map['customer'] = customer;
    map['status'] = status;
    map['isPublic'] = isPublic;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    if (draft != null) {
      map['draft'] = draft!.toJson();
    }
    if (published != null) {
      map['published'] = published?.toJson();
    }
    if (previous != null) {
      map['previous'] = previous?.toJson();
    }
    return map;
  }
}
