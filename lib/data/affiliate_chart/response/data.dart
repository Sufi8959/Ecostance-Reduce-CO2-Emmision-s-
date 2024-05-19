
class Data {
  Data({
      this.data,
      this.week, 
      this.totalUSDAmt,});

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    week = json['week'];
    totalUSDAmt = json['TotalUSDAmt'];
  }
  List<Data>? data;
  int? week;
  dynamic totalUSDAmt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['week'] = week;
    map['TotalUSDAmt'] = totalUSDAmt;
    return map;
  }

}