import 'package:net_carbons/data/affiliate_chart/trans_response/data.dart';
import 'package:net_carbons/data/affiliate_chart/trans_response/metadata.dart';

class TransactionResponse {
  TransactionResponse({
      this.success, 
      this.metadata, 
      this.data,});

  TransactionResponse.fromJson(dynamic json) {
    success = json['success'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  Metadata? metadata;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}