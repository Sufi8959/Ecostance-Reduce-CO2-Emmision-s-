
import 'package:net_carbons/data/affiliate_chart/trans_response/user.dart';

class Customer {
  Customer({
      this.id, 
      this.user,});

  Customer.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? id;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}