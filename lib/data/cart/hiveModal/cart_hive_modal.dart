import 'package:hive_flutter/hive_flutter.dart';

part 'cart_hive_modal.g.dart';

@HiveType(typeId: 1)
class HiveCartModal {
  @HiveField(1)
  String id;

  @HiveField(2)
  int quantity;

  HiveCartModal(this.id, this.quantity);
}
