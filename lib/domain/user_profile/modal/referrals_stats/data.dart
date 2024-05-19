import 'data.dart';
import 'total_amt.dart';
import 'convert_usd_amt.dart';
import 'total_sub_amt.dart';
import 'convert_sub_usd_amt.dart';

class Data {
  Data({
      this.totOrderCount, 
      this.totProductCount, 
      this.data, 
      this.month, 
      this.totalUSDAmt, 
      this.totalAmt, 
      this.convertUSDAmt, 
      this.totalSubUSDAmt, 
      this.totalSubAmt, 
      this.convertSubUSDAmt,});

  Data.fromJson(dynamic json) {
    totOrderCount = json['tot_order_count'];
    totProductCount = json['tot_product_count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    month = json['month'];
    totalUSDAmt = json['TotalUSDAmt'];
    totalAmt = json['totalAmt'] != null ? TotalAmt.fromJson(json['totalAmt']) : null;
    convertUSDAmt = json['convertUSDAmt'] != null ? ConvertUsdAmt.fromJson(json['convertUSDAmt']) : null;
    totalSubUSDAmt = json['TotalSubUSDAmt'];
    totalSubAmt = json['totalSubAmt'] != null ? TotalSubAmt.fromJson(json['totalSubAmt']) : null;
    convertSubUSDAmt = json['convertSubUSDAmt'] != null ? ConvertSubUsdAmt.fromJson(json['convertSubUSDAmt']) : null;
  }
  int? totOrderCount;
  int? totProductCount;
  List<Data>? data;
  int? month;
  double? totalUSDAmt;
  TotalAmt? totalAmt;
  ConvertUsdAmt? convertUSDAmt;
  double? totalSubUSDAmt;
  TotalSubAmt? totalSubAmt;
  ConvertSubUsdAmt? convertSubUSDAmt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tot_order_count'] = totOrderCount;
    map['tot_product_count'] = totProductCount;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['month'] = month;
    map['TotalUSDAmt'] = totalUSDAmt;
    if (totalAmt != null) {
      map['totalAmt'] = totalAmt?.toJson();
    }
    if (convertUSDAmt != null) {
      map['convertUSDAmt'] = convertUSDAmt?.toJson();
    }
    map['TotalSubUSDAmt'] = totalSubUSDAmt;
    if (totalSubAmt != null) {
      map['totalSubAmt'] = totalSubAmt?.toJson();
    }
    if (convertSubUSDAmt != null) {
      map['convertSubUSDAmt'] = convertSubUSDAmt?.toJson();
    }
    return map;
  }

}