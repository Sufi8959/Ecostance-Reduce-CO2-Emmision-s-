import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';

part 'cart_modal.g.dart';

class CartModal {
  CartModal(
      {required this.cartQuantity,
      required this.cartTotal,
      required this.products,
      required this.discount,
      required this.subTotal,
      required this.orderTotal});

  final Map<String, ProductCartModal> products;
  final double cartTotal;
  final int cartQuantity;
  double discount;
  double orderTotal;
  double subTotal;

  factory CartModal.empty() => CartModal(
      cartQuantity: 0,
      cartTotal: 00.00,
      products: {},
      discount: 0,
      subTotal: 0,
      orderTotal: 0);
}

@CopyWith()
class ProductCartModal {
  ProductCartModal(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.isExist,
      required this.productModal,
      required this.priceLocal,
      required this.priceInUsd,
      required this.priceList});

  final String id;
  final double price;

  final int quantity;
  final bool isExist;
  final ProductModal productModal;
  PriceListModal? priceLocal;
  PriceListModal priceInUsd;
  List<PriceListModal> priceList;

  // ProductCartModal  getPriceWithCurrency(String currency){
  //   return copyWith(
  //     price: priceList.firstWhere((element) => element.currency == currency).price,
  //     priceLocal: priceList.firstWhere((element) => element.currency == currency)
  //   );
  // }

  factory ProductCartModal.empty() => ProductCartModal(
      id: '',
      // sku: '',
      // name: '',
      price: 0.0,
      // discount: 0,
      // stock: 0,
      // image: [],
      // shortDescription: 'shortDescription',
      // status: '',
      quantity: 0,
      isExist: false,
      productModal: ProductModal.empty(),
      priceLocal: PriceListModal.empty(),
      priceInUsd: PriceListModal.empty(),
      priceList: []);
}

extension ProductCartModalgetPriceWithCurrency on ProductCartModal {
  ProductCartModal getPriceDataWithNewCurrency(String currency) {
    return ProductCartModal(
        price: priceList
            .firstWhere((element) => element.currency == currency,)
            .price,
        priceLocal: priceList.firstWhere(
            (element) => element.currency == currency,
            orElse: () =>
                priceList.firstWhere((element) => element.currency == "USD")),
        priceInUsd: priceInUsd,
        id: id,
        quantity: quantity,
        isExist: isExist,
        productModal: productModal,
        priceList: priceList);
  }
}

extension CartModalExtensionWithQuantity on ProductModal {
  ProductCartModal toProductCartModalWithQuantity(int q) {
    return ProductCartModal(
      id: id,
      // sku: sku,
      // name: formalName,
      //TODO price
      price: priceLocal?.price.toDouble() ?? priceInUsd.price.toDouble(),
      // discount: discount,
      // stock: stock,
      // image: image,
      // shortDescription: shortDescription,
      // status: status,
      productModal: this,
      isExist: true,
      quantity: q, priceLocal: priceLocal, priceInUsd: priceInUsd,
      priceList: priceList,
    );
  }
}

extension CartModalExtension on ProductModal {
  ProductCartModal toProductCartModal() {
    return ProductCartModal(
      id: id,
      // sku: sku,
      // name: formalName,
      //TODO price
      price: priceLocal?.price.toDouble() ?? priceInUsd.price.toDouble(),
      // discount: discount,
      // stock: stock,
      // image: image,
      // shortDescription: shortDescription,
      // status: status,
      productModal: this,
      isExist: true,
      quantity: 0, priceInUsd: priceInUsd, priceLocal: priceLocal,
      priceList: priceList,
    );
  }
}
