import 'package:net_carbons/data/affiliate_chart/response/data_month.dart';

import 'data.dart';

class ReferralStatsMonthResponse {
  ReferralStatsMonthResponse({
      this.success, 
      this.peroid, 
      this.count, 
      this.data,});

  ReferralStatsMonthResponse.fromJson(dynamic json) {
    success = json['success'];
    peroid = json['peroid'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataMonth.fromJson(v));
      });
    }
  }
  bool? success;
  int? peroid;
  int? count;
  List<DataMonth>? data;

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