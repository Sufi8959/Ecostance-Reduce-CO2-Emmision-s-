import 'data.dart';

class ReferralStatsResponse {
  ReferralStatsResponse({
      this.success, 
      this.peroid, 
      this.count, 
      this.data,});

  ReferralStatsResponse.fromJson(dynamic json) {
    success = json['success'];
    peroid = json['peroid'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  int? peroid;
  int? count;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['peroid'] = peroid;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}