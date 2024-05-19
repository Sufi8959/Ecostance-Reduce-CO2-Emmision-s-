
import 'package:net_carbons/data/affiliate_chart/trans_response/order_id.dart';

class Data {
  Data({
      this.id, 
      this.txnType, 
      this.currencySymbol, 
      this.currency, 
      this.amount, 
      this.orderId, 
      this.referalUserId, 
      this.comment, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    txnType = json['txnType'];
    currencySymbol = json['currencySymbol'];
    currency = json['currency'];
    amount = json['amount'];
    orderId = json['orderId'] != null ? OrderId.fromJson(json['orderId']) : null;
    referalUserId = json['referalUserId'];
    comment = json['comment'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? txnType;
  String? currencySymbol;
  String? currency;
  dynamic amount;
  OrderId? orderId;
  String? referalUserId;
  String? comment;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['txnType'] = txnType;
    map['currencySymbol'] = currencySymbol;
    map['currency'] = currency;
    map['amount'] = amount;
    if (orderId != null) {
      map['orderId'] = orderId?.toJson();
    }
    map['referalUserId'] = referalUserId;
    map['comment'] = comment;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}