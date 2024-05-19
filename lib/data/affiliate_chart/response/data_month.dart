
class DataMonth {
  DataMonth({
      this.data,
      this.month,
      this.totalUSDAmt,});

  DataMonth.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataMonth.fromJson(v));
      });
    }
    month = json['month'];
    totalUSDAmt = json['TotalUSDAmt'];
  }
  List<DataMonth>? data;
  int? month;
  dynamic totalUSDAmt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['month'] = month;
    map['TotalUSDAmt'] = totalUSDAmt;
    return map;
  }

}