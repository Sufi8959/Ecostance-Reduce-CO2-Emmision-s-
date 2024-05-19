
import 'package:net_carbons/data/affiliate_chart/trans_response/billing_address.dart';
import 'package:net_carbons/data/affiliate_chart/trans_response/customer.dart';

class OrderId {
  OrderId({
      this.id, 
      this.customer, 
      this.orderTotal, 
      this.billingAddress, 
      this.timezone, 
      this.timeAbbrevation, 
      this.createdAt,});

  OrderId.fromJson(dynamic json) {
    id = json['_id'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    orderTotal = json['orderTotal'];
    billingAddress = json['billingAddress'] != null ? BillingAddress.fromJson(json['billingAddress']) : null;
    timezone = json['timezone'];
    timeAbbrevation = json['timeAbbrevation'];
    createdAt = json['createdAt'];
  }
  String? id;
  Customer? customer;
  dynamic orderTotal;
  BillingAddress? billingAddress;
  int? timezone;
  String? timeAbbrevation;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    map['orderTotal'] = orderTotal;
    if (billingAddress != null) {
      map['billingAddress'] = billingAddress?.toJson();
    }
    map['timezone'] = timezone;
    map['timeAbbrevation'] = timeAbbrevation;
    map['createdAt'] = createdAt;
    return map;
  }

}