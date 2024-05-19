import 'Id.dart';

class Data {
  Data({
      this.id, 
      this.ghgReduced, 
      this.treesPlanted,});

  Data.fromJson(dynamic json) {
    id = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    ghgReduced = json['ghgReduced'];
    treesPlanted = json['treesPlanted'];
  }
  Id? id;
  dynamic ghgReduced;
  dynamic treesPlanted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['_id'] = id?.toJson();
    }
    map['ghgReduced'] = ghgReduced;
    map['treesPlanted'] = treesPlanted;
    return map;
  }

}