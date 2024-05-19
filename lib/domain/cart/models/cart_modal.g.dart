// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_modal.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductCartModalCWProxy {
  ProductCartModal id(String id);

  ProductCartModal isExist(bool isExist);

  ProductCartModal price(double price);

  ProductCartModal priceInUsd(PriceListModal priceInUsd);

  ProductCartModal priceList(List<PriceListModal> priceList);

  ProductCartModal priceLocal(PriceListModal? priceLocal);

  ProductCartModal productModal(ProductModal productModal);

  ProductCartModal quantity(int quantity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductCartModal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductCartModal(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductCartModal call({
    String? id,
    bool? isExist,
    double? price,
    PriceListModal? priceInUsd,
    List<PriceListModal>? priceList,
    PriceListModal? priceLocal,
    ProductModal? productModal,
    int? quantity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductCartModal.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductCartModal.copyWith.fieldName(...)`
class _$ProductCartModalCWProxyImpl implements _$ProductCartModalCWProxy {
  final ProductCartModal _value;

  const _$ProductCartModalCWProxyImpl(this._value);

  @override
  ProductCartModal id(String id) => this(id: id);

  @override
  ProductCartModal isExist(bool isExist) => this(isExist: isExist);

  @override
  ProductCartModal price(double price) => this(price: price);

  @override
  ProductCartModal priceInUsd(PriceListModal priceInUsd) =>
      this(priceInUsd: priceInUsd);

  @override
  ProductCartModal priceList(List<PriceListModal> priceList) =>
      this(priceList: priceList);

  @override
  ProductCartModal priceLocal(PriceListModal? priceLocal) =>
      this(priceLocal: priceLocal);

  @override
  ProductCartModal productModal(ProductModal productModal) =>
      this(productModal: productModal);

  @override
  ProductCartModal quantity(int quantity) => this(quantity: quantity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductCartModal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductCartModal(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductCartModal call({
    Object? id = const $CopyWithPlaceholder(),
    Object? isExist = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? priceInUsd = const $CopyWithPlaceholder(),
    Object? priceList = const $CopyWithPlaceholder(),
    Object? priceLocal = const $CopyWithPlaceholder(),
    Object? productModal = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
  }) {
    return ProductCartModal(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      isExist: isExist == const $CopyWithPlaceholder() || isExist == null
          ? _value.isExist
          // ignore: cast_nullable_to_non_nullable
          : isExist as bool,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double,
      priceInUsd:
          priceInUsd == const $CopyWithPlaceholder() || priceInUsd == null
              ? _value.priceInUsd
              // ignore: cast_nullable_to_non_nullable
              : priceInUsd as PriceListModal,
      priceList: priceList == const $CopyWithPlaceholder() || priceList == null
          ? _value.priceList
          // ignore: cast_nullable_to_non_nullable
          : priceList as List<PriceListModal>,
      priceLocal: priceLocal == const $CopyWithPlaceholder()
          ? _value.priceLocal
          // ignore: cast_nullable_to_non_nullable
          : priceLocal as PriceListModal?,
      productModal:
          productModal == const $CopyWithPlaceholder() || productModal == null
              ? _value.productModal
              // ignore: cast_nullable_to_non_nullable
              : productModal as ProductModal,
      quantity: quantity == const $CopyWithPlaceholder() || quantity == null
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int,
    );
  }
}

extension $ProductCartModalCopyWith on ProductCartModal {
  /// Returns a callable class that can be used as follows: `instanceOfProductCartModal.copyWith(...)` or like so:`instanceOfProductCartModal.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductCartModalCWProxy get copyWith => _$ProductCartModalCWProxyImpl(this);
}
