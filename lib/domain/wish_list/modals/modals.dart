import 'package:net_carbons/domain/home_products/modal/models.dart';

class WishListLocalModal {
  final List<String> list;

  WishListLocalModal({required this.list});
}

class WishListSaveModal {
  WishListSaveModal({
    required this.wishlist,
  });

  WishlistModal wishlist;
}

class WishListServerModal {
  WishListServerModal({
    required this.id,
    required this.customer,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String customer;
  List<WishlistProductModal> products;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
}

class WishlistModal {
  WishlistModal({
    required this.id,
    required this.customer,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String customer;
  List<WishlistProductModal> products;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory WishlistModal.empty() => WishlistModal(
      id: '',
      customer: '',
      products: [],
      createdAt: DateTime.fromMicrosecondsSinceEpoch(1),
      updatedAt: DateTime.fromMicrosecondsSinceEpoch(1),
      v: 0);
}

class WishlistProductModal {
  WishlistProductModal({
    required this.product,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  String product;
  String id;
  DateTime updatedAt;
  DateTime createdAt;
}

class WishlistProductDataElementModal {
  WishlistProductDataElementModal({
    required this.product,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  ProductModal product;
  String id;
  DateTime updatedAt;
  DateTime createdAt;
}
