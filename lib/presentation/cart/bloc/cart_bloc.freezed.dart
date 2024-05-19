// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res> implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  final CartEvent _value;
  // ignore: unused_field
  final $Res Function(CartEvent) _then;
}

/// @nodoc
abstract class _$$CartStartedCopyWith<$Res> {
  factory _$$CartStartedCopyWith(
          _$CartStarted value, $Res Function(_$CartStarted) then) =
      __$$CartStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartStartedCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartStartedCopyWith<$Res> {
  __$$CartStartedCopyWithImpl(
      _$CartStarted _value, $Res Function(_$CartStarted) _then)
      : super(_value, (v) => _then(v as _$CartStarted));

  @override
  _$CartStarted get _value => super._value as _$CartStarted;
}

/// @nodoc

class _$CartStarted implements CartStarted {
  const _$CartStarted();

  @override
  String toString() {
    return 'CartEvent.cartStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return cartStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return cartStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (cartStarted != null) {
      return cartStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return cartStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return cartStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (cartStarted != null) {
      return cartStarted(this);
    }
    return orElse();
  }
}

abstract class CartStarted implements CartEvent {
  const factory CartStarted() = _$CartStarted;
}

/// @nodoc
abstract class _$$CartCalculateTotalCopyWith<$Res> {
  factory _$$CartCalculateTotalCopyWith(_$CartCalculateTotal value,
          $Res Function(_$CartCalculateTotal) then) =
      __$$CartCalculateTotalCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartCalculateTotalCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartCalculateTotalCopyWith<$Res> {
  __$$CartCalculateTotalCopyWithImpl(
      _$CartCalculateTotal _value, $Res Function(_$CartCalculateTotal) _then)
      : super(_value, (v) => _then(v as _$CartCalculateTotal));

  @override
  _$CartCalculateTotal get _value => super._value as _$CartCalculateTotal;
}

/// @nodoc

class _$CartCalculateTotal implements CartCalculateTotal {
  const _$CartCalculateTotal();

  @override
  String toString() {
    return 'CartEvent.calculateTotal()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartCalculateTotal);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return calculateTotal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return calculateTotal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (calculateTotal != null) {
      return calculateTotal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return calculateTotal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return calculateTotal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (calculateTotal != null) {
      return calculateTotal(this);
    }
    return orElse();
  }
}

abstract class CartCalculateTotal implements CartEvent {
  const factory CartCalculateTotal() = _$CartCalculateTotal;
}

/// @nodoc
abstract class _$$AddItemCopyWith<$Res> {
  factory _$$AddItemCopyWith(_$AddItem value, $Res Function(_$AddItem) then) =
      __$$AddItemCopyWithImpl<$Res>;
  $Res call({ProductCartModal product});
}

/// @nodoc
class __$$AddItemCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$AddItemCopyWith<$Res> {
  __$$AddItemCopyWithImpl(_$AddItem _value, $Res Function(_$AddItem) _then)
      : super(_value, (v) => _then(v as _$AddItem));

  @override
  _$AddItem get _value => super._value as _$AddItem;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_$AddItem(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductCartModal,
    ));
  }
}

/// @nodoc

class _$AddItem implements AddItem {
  const _$AddItem({required this.product});

  @override
  final ProductCartModal product;

  @override
  String toString() {
    return 'CartEvent.addItem(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItem &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$$AddItemCopyWith<_$AddItem> get copyWith =>
      __$$AddItemCopyWithImpl<_$AddItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return addItem(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return addItem?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return addItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return addItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(this);
    }
    return orElse();
  }
}

abstract class AddItem implements CartEvent {
  const factory AddItem({required final ProductCartModal product}) = _$AddItem;

  ProductCartModal get product;
  @JsonKey(ignore: true)
  _$$AddItemCopyWith<_$AddItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlterItemCopyWith<$Res> {
  factory _$$AlterItemCopyWith(
          _$AlterItem value, $Res Function(_$AlterItem) then) =
      __$$AlterItemCopyWithImpl<$Res>;
  $Res call({ProductCartModal product, AlterItemAction action});
}

/// @nodoc
class __$$AlterItemCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$AlterItemCopyWith<$Res> {
  __$$AlterItemCopyWithImpl(
      _$AlterItem _value, $Res Function(_$AlterItem) _then)
      : super(_value, (v) => _then(v as _$AlterItem));

  @override
  _$AlterItem get _value => super._value as _$AlterItem;

  @override
  $Res call({
    Object? product = freezed,
    Object? action = freezed,
  }) {
    return _then(_$AlterItem(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductCartModal,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as AlterItemAction,
    ));
  }
}

/// @nodoc

class _$AlterItem implements AlterItem {
  const _$AlterItem({required this.product, required this.action});

  @override
  final ProductCartModal product;
  @override
  final AlterItemAction action;

  @override
  String toString() {
    return 'CartEvent.alterItem(product: $product, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlterItem &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$$AlterItemCopyWith<_$AlterItem> get copyWith =>
      __$$AlterItemCopyWithImpl<_$AlterItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return alterItem(product, action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return alterItem?.call(product, action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (alterItem != null) {
      return alterItem(product, action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return alterItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return alterItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (alterItem != null) {
      return alterItem(this);
    }
    return orElse();
  }
}

abstract class AlterItem implements CartEvent {
  const factory AlterItem(
      {required final ProductCartModal product,
      required final AlterItemAction action}) = _$AlterItem;

  ProductCartModal get product;
  AlterItemAction get action;
  @JsonKey(ignore: true)
  _$$AlterItemCopyWith<_$AlterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartClearCopyWith<$Res> {
  factory _$$CartClearCopyWith(
          _$CartClear value, $Res Function(_$CartClear) then) =
      __$$CartClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartClearCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartClearCopyWith<$Res> {
  __$$CartClearCopyWithImpl(
      _$CartClear _value, $Res Function(_$CartClear) _then)
      : super(_value, (v) => _then(v as _$CartClear));

  @override
  _$CartClear get _value => super._value as _$CartClear;
}

/// @nodoc

class _$CartClear implements CartClear {
  const _$CartClear();

  @override
  String toString() {
    return 'CartEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartClear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class CartClear implements CartEvent {
  const factory CartClear() = _$CartClear;
}

/// @nodoc
abstract class _$$CartApplyCouponCopyWith<$Res> {
  factory _$$CartApplyCouponCopyWith(
          _$CartApplyCoupon value, $Res Function(_$CartApplyCoupon) then) =
      __$$CartApplyCouponCopyWithImpl<$Res>;
  $Res call({String code});
}

/// @nodoc
class __$$CartApplyCouponCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartApplyCouponCopyWith<$Res> {
  __$$CartApplyCouponCopyWithImpl(
      _$CartApplyCoupon _value, $Res Function(_$CartApplyCoupon) _then)
      : super(_value, (v) => _then(v as _$CartApplyCoupon));

  @override
  _$CartApplyCoupon get _value => super._value as _$CartApplyCoupon;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_$CartApplyCoupon(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartApplyCoupon implements CartApplyCoupon {
  const _$CartApplyCoupon(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'CartEvent.applyCoupon(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartApplyCoupon &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$$CartApplyCouponCopyWith<_$CartApplyCoupon> get copyWith =>
      __$$CartApplyCouponCopyWithImpl<_$CartApplyCoupon>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return applyCoupon(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return applyCoupon?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (applyCoupon != null) {
      return applyCoupon(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return applyCoupon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return applyCoupon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (applyCoupon != null) {
      return applyCoupon(this);
    }
    return orElse();
  }
}

abstract class CartApplyCoupon implements CartEvent {
  const factory CartApplyCoupon(final String code) = _$CartApplyCoupon;

  String get code;
  @JsonKey(ignore: true)
  _$$CartApplyCouponCopyWith<_$CartApplyCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartRemoveCouponCopyWith<$Res> {
  factory _$$CartRemoveCouponCopyWith(
          _$CartRemoveCoupon value, $Res Function(_$CartRemoveCoupon) then) =
      __$$CartRemoveCouponCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartRemoveCouponCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartRemoveCouponCopyWith<$Res> {
  __$$CartRemoveCouponCopyWithImpl(
      _$CartRemoveCoupon _value, $Res Function(_$CartRemoveCoupon) _then)
      : super(_value, (v) => _then(v as _$CartRemoveCoupon));

  @override
  _$CartRemoveCoupon get _value => super._value as _$CartRemoveCoupon;
}

/// @nodoc

class _$CartRemoveCoupon implements CartRemoveCoupon {
  const _$CartRemoveCoupon();

  @override
  String toString() {
    return 'CartEvent.removeCoupon()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartRemoveCoupon);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return removeCoupon();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return removeCoupon?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (removeCoupon != null) {
      return removeCoupon();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return removeCoupon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return removeCoupon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (removeCoupon != null) {
      return removeCoupon(this);
    }
    return orElse();
  }
}

abstract class CartRemoveCoupon implements CartEvent {
  const factory CartRemoveCoupon() = _$CartRemoveCoupon;
}

/// @nodoc
abstract class _$$CartchangeCurrencyCopyWith<$Res> {
  factory _$$CartchangeCurrencyCopyWith(_$CartchangeCurrency value,
          $Res Function(_$CartchangeCurrency) then) =
      __$$CartchangeCurrencyCopyWithImpl<$Res>;
  $Res call({String currency});
}

/// @nodoc
class __$$CartchangeCurrencyCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartchangeCurrencyCopyWith<$Res> {
  __$$CartchangeCurrencyCopyWithImpl(
      _$CartchangeCurrency _value, $Res Function(_$CartchangeCurrency) _then)
      : super(_value, (v) => _then(v as _$CartchangeCurrency));

  @override
  _$CartchangeCurrency get _value => super._value as _$CartchangeCurrency;

  @override
  $Res call({
    Object? currency = freezed,
  }) {
    return _then(_$CartchangeCurrency(
      currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartchangeCurrency implements CartchangeCurrency {
  const _$CartchangeCurrency(this.currency);

  @override
  final String currency;

  @override
  String toString() {
    return 'CartEvent.changeCurrency(currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartchangeCurrency &&
            const DeepCollectionEquality().equals(other.currency, currency));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(currency));

  @JsonKey(ignore: true)
  @override
  _$$CartchangeCurrencyCopyWith<_$CartchangeCurrency> get copyWith =>
      __$$CartchangeCurrencyCopyWithImpl<_$CartchangeCurrency>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return changeCurrency(currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return changeCurrency?.call(currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (changeCurrency != null) {
      return changeCurrency(currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return changeCurrency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return changeCurrency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (changeCurrency != null) {
      return changeCurrency(this);
    }
    return orElse();
  }
}

abstract class CartchangeCurrency implements CartEvent {
  const factory CartchangeCurrency(final String currency) =
      _$CartchangeCurrency;

  String get currency;
  @JsonKey(ignore: true)
  _$$CartchangeCurrencyCopyWith<_$CartchangeCurrency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartsetCartSyncedToServerCopyWith<$Res> {
  factory _$$CartsetCartSyncedToServerCopyWith(
          _$CartsetCartSyncedToServer value,
          $Res Function(_$CartsetCartSyncedToServer) then) =
      __$$CartsetCartSyncedToServerCopyWithImpl<$Res>;
  $Res call({CartSyncedToServerOnAuth cartSyncedToServerOnAuth});
}

/// @nodoc
class __$$CartsetCartSyncedToServerCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartsetCartSyncedToServerCopyWith<$Res> {
  __$$CartsetCartSyncedToServerCopyWithImpl(_$CartsetCartSyncedToServer _value,
      $Res Function(_$CartsetCartSyncedToServer) _then)
      : super(_value, (v) => _then(v as _$CartsetCartSyncedToServer));

  @override
  _$CartsetCartSyncedToServer get _value =>
      super._value as _$CartsetCartSyncedToServer;

  @override
  $Res call({
    Object? cartSyncedToServerOnAuth = freezed,
  }) {
    return _then(_$CartsetCartSyncedToServer(
      cartSyncedToServerOnAuth == freezed
          ? _value.cartSyncedToServerOnAuth
          : cartSyncedToServerOnAuth // ignore: cast_nullable_to_non_nullable
              as CartSyncedToServerOnAuth,
    ));
  }
}

/// @nodoc

class _$CartsetCartSyncedToServer implements CartsetCartSyncedToServer {
  const _$CartsetCartSyncedToServer(this.cartSyncedToServerOnAuth);

  @override
  final CartSyncedToServerOnAuth cartSyncedToServerOnAuth;

  @override
  String toString() {
    return 'CartEvent.setCartSyncedToServer(cartSyncedToServerOnAuth: $cartSyncedToServerOnAuth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartsetCartSyncedToServer &&
            const DeepCollectionEquality().equals(
                other.cartSyncedToServerOnAuth, cartSyncedToServerOnAuth));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(cartSyncedToServerOnAuth));

  @JsonKey(ignore: true)
  @override
  _$$CartsetCartSyncedToServerCopyWith<_$CartsetCartSyncedToServer>
      get copyWith => __$$CartsetCartSyncedToServerCopyWithImpl<
          _$CartsetCartSyncedToServer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return setCartSyncedToServer(cartSyncedToServerOnAuth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return setCartSyncedToServer?.call(cartSyncedToServerOnAuth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (setCartSyncedToServer != null) {
      return setCartSyncedToServer(cartSyncedToServerOnAuth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return setCartSyncedToServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return setCartSyncedToServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (setCartSyncedToServer != null) {
      return setCartSyncedToServer(this);
    }
    return orElse();
  }
}

abstract class CartsetCartSyncedToServer implements CartEvent {
  const factory CartsetCartSyncedToServer(
          final CartSyncedToServerOnAuth cartSyncedToServerOnAuth) =
      _$CartsetCartSyncedToServer;

  CartSyncedToServerOnAuth get cartSyncedToServerOnAuth;
  @JsonKey(ignore: true)
  _$$CartsetCartSyncedToServerCopyWith<_$CartsetCartSyncedToServer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartSaveCartCopyWith<$Res> {
  factory _$$CartSaveCartCopyWith(
          _$CartSaveCart value, $Res Function(_$CartSaveCart) then) =
      __$$CartSaveCartCopyWithImpl<$Res>;
  $Res call(
      {Map<String, ProductCartModal> products,
      String currency,
      bool itemsPreLogin,
      SaveActionType saveActionType,
      ProductCartModal productCartModal});
}

/// @nodoc
class __$$CartSaveCartCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartSaveCartCopyWith<$Res> {
  __$$CartSaveCartCopyWithImpl(
      _$CartSaveCart _value, $Res Function(_$CartSaveCart) _then)
      : super(_value, (v) => _then(v as _$CartSaveCart));

  @override
  _$CartSaveCart get _value => super._value as _$CartSaveCart;

  @override
  $Res call({
    Object? products = freezed,
    Object? currency = freezed,
    Object? itemsPreLogin = freezed,
    Object? saveActionType = freezed,
    Object? productCartModal = freezed,
  }) {
    return _then(_$CartSaveCart(
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, ProductCartModal>,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      itemsPreLogin: itemsPreLogin == freezed
          ? _value.itemsPreLogin
          : itemsPreLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      saveActionType: saveActionType == freezed
          ? _value.saveActionType
          : saveActionType // ignore: cast_nullable_to_non_nullable
              as SaveActionType,
      productCartModal: productCartModal == freezed
          ? _value.productCartModal
          : productCartModal // ignore: cast_nullable_to_non_nullable
              as ProductCartModal,
    ));
  }
}

/// @nodoc

class _$CartSaveCart implements CartSaveCart {
  const _$CartSaveCart(
      {required final Map<String, ProductCartModal> products,
      required this.currency,
      required this.itemsPreLogin,
      required this.saveActionType,
      required this.productCartModal})
      : _products = products;

  final Map<String, ProductCartModal> _products;
  @override
  Map<String, ProductCartModal> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_products);
  }

  @override
  final String currency;
  @override
  final bool itemsPreLogin;
  @override
  final SaveActionType saveActionType;
  @override
  final ProductCartModal productCartModal;

  @override
  String toString() {
    return 'CartEvent.saveCart(products: $products, currency: $currency, itemsPreLogin: $itemsPreLogin, saveActionType: $saveActionType, productCartModal: $productCartModal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartSaveCart &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality()
                .equals(other.itemsPreLogin, itemsPreLogin) &&
            const DeepCollectionEquality()
                .equals(other.saveActionType, saveActionType) &&
            const DeepCollectionEquality()
                .equals(other.productCartModal, productCartModal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(itemsPreLogin),
      const DeepCollectionEquality().hash(saveActionType),
      const DeepCollectionEquality().hash(productCartModal));

  @JsonKey(ignore: true)
  @override
  _$$CartSaveCartCopyWith<_$CartSaveCart> get copyWith =>
      __$$CartSaveCartCopyWithImpl<_$CartSaveCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return saveCart(
        products, currency, itemsPreLogin, saveActionType, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return saveCart?.call(
        products, currency, itemsPreLogin, saveActionType, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (saveCart != null) {
      return saveCart(
          products, currency, itemsPreLogin, saveActionType, productCartModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return saveCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return saveCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (saveCart != null) {
      return saveCart(this);
    }
    return orElse();
  }
}

abstract class CartSaveCart implements CartEvent {
  const factory CartSaveCart(
      {required final Map<String, ProductCartModal> products,
      required final String currency,
      required final bool itemsPreLogin,
      required final SaveActionType saveActionType,
      required final ProductCartModal productCartModal}) = _$CartSaveCart;

  Map<String, ProductCartModal> get products;
  String get currency;
  bool get itemsPreLogin;
  SaveActionType get saveActionType;
  ProductCartModal get productCartModal;
  @JsonKey(ignore: true)
  _$$CartSaveCartCopyWith<_$CartSaveCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartSaveCartOnCheckoutCopyWith<$Res> {
  factory _$$CartSaveCartOnCheckoutCopyWith(_$CartSaveCartOnCheckout value,
          $Res Function(_$CartSaveCartOnCheckout) then) =
      __$$CartSaveCartOnCheckoutCopyWithImpl<$Res>;
  $Res call(
      {Map<String, ProductCartModal> products,
      ProductCartModal productCartModal});
}

/// @nodoc
class __$$CartSaveCartOnCheckoutCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res>
    implements _$$CartSaveCartOnCheckoutCopyWith<$Res> {
  __$$CartSaveCartOnCheckoutCopyWithImpl(_$CartSaveCartOnCheckout _value,
      $Res Function(_$CartSaveCartOnCheckout) _then)
      : super(_value, (v) => _then(v as _$CartSaveCartOnCheckout));

  @override
  _$CartSaveCartOnCheckout get _value =>
      super._value as _$CartSaveCartOnCheckout;

  @override
  $Res call({
    Object? products = freezed,
    Object? productCartModal = freezed,
  }) {
    return _then(_$CartSaveCartOnCheckout(
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, ProductCartModal>,
      productCartModal: productCartModal == freezed
          ? _value.productCartModal
          : productCartModal // ignore: cast_nullable_to_non_nullable
              as ProductCartModal,
    ));
  }
}

/// @nodoc

class _$CartSaveCartOnCheckout implements CartSaveCartOnCheckout {
  const _$CartSaveCartOnCheckout(
      {required final Map<String, ProductCartModal> products,
      required this.productCartModal})
      : _products = products;

  final Map<String, ProductCartModal> _products;
  @override
  Map<String, ProductCartModal> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_products);
  }

  @override
  final ProductCartModal productCartModal;

  @override
  String toString() {
    return 'CartEvent.saveCartOnCheckout(products: $products, productCartModal: $productCartModal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartSaveCartOnCheckout &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.productCartModal, productCartModal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(productCartModal));

  @JsonKey(ignore: true)
  @override
  _$$CartSaveCartOnCheckoutCopyWith<_$CartSaveCartOnCheckout> get copyWith =>
      __$$CartSaveCartOnCheckoutCopyWithImpl<_$CartSaveCartOnCheckout>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartStarted,
    required TResult Function() calculateTotal,
    required TResult Function(ProductCartModal product) addItem,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function() clear,
    required TResult Function(String code) applyCoupon,
    required TResult Function() removeCoupon,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)
        setCartSyncedToServer,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)
        saveCartOnCheckout,
  }) {
    return saveCartOnCheckout(products, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
  }) {
    return saveCartOnCheckout?.call(products, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartStarted,
    TResult Function()? calculateTotal,
    TResult Function(ProductCartModal product)? addItem,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function()? clear,
    TResult Function(String code)? applyCoupon,
    TResult Function()? removeCoupon,
    TResult Function(String currency)? changeCurrency,
    TResult Function(CartSyncedToServerOnAuth cartSyncedToServerOnAuth)?
        setCartSyncedToServer,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(Map<String, ProductCartModal> products,
            ProductCartModal productCartModal)?
        saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (saveCartOnCheckout != null) {
      return saveCartOnCheckout(products, productCartModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStarted value) cartStarted,
    required TResult Function(CartCalculateTotal value) calculateTotal,
    required TResult Function(AddItem value) addItem,
    required TResult Function(AlterItem value) alterItem,
    required TResult Function(CartClear value) clear,
    required TResult Function(CartApplyCoupon value) applyCoupon,
    required TResult Function(CartRemoveCoupon value) removeCoupon,
    required TResult Function(CartchangeCurrency value) changeCurrency,
    required TResult Function(CartsetCartSyncedToServer value)
        setCartSyncedToServer,
    required TResult Function(CartSaveCart value) saveCart,
    required TResult Function(CartSaveCartOnCheckout value) saveCartOnCheckout,
  }) {
    return saveCartOnCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
  }) {
    return saveCartOnCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStarted value)? cartStarted,
    TResult Function(CartCalculateTotal value)? calculateTotal,
    TResult Function(AddItem value)? addItem,
    TResult Function(AlterItem value)? alterItem,
    TResult Function(CartClear value)? clear,
    TResult Function(CartApplyCoupon value)? applyCoupon,
    TResult Function(CartRemoveCoupon value)? removeCoupon,
    TResult Function(CartchangeCurrency value)? changeCurrency,
    TResult Function(CartsetCartSyncedToServer value)? setCartSyncedToServer,
    TResult Function(CartSaveCart value)? saveCart,
    TResult Function(CartSaveCartOnCheckout value)? saveCartOnCheckout,
    required TResult orElse(),
  }) {
    if (saveCartOnCheckout != null) {
      return saveCartOnCheckout(this);
    }
    return orElse();
  }
}

abstract class CartSaveCartOnCheckout implements CartEvent {
  const factory CartSaveCartOnCheckout(
          {required final Map<String, ProductCartModal> products,
          required final ProductCartModal productCartModal}) =
      _$CartSaveCartOnCheckout;

  Map<String, ProductCartModal> get products;
  ProductCartModal get productCartModal;
  @JsonKey(ignore: true)
  _$$CartSaveCartOnCheckoutCopyWith<_$CartSaveCartOnCheckout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCouponLoading => throw _privateConstructorUsedError;
  bool get isTotalsLoading => throw _privateConstructorUsedError;
  bool get couponHasError => throw _privateConstructorUsedError;
  int get cartQuantity => throw _privateConstructorUsedError;
  double get cartTotal => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get orderTotal => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;
  Map<String, ProductCartModal> get products =>
      throw _privateConstructorUsedError;
  CouponStateModal? get couponStateModal => throw _privateConstructorUsedError;
  bool get cartSavedManually => throw _privateConstructorUsedError;
  CartSyncedToServerOnAuth get cartSyncedToServer =>
      throw _privateConstructorUsedError;
  String? get couponMessage => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isCouponLoading,
      bool isTotalsLoading,
      bool couponHasError,
      int cartQuantity,
      double cartTotal,
      double discount,
      double orderTotal,
      double subTotal,
      Map<String, ProductCartModal> products,
      CouponStateModal? couponStateModal,
      bool cartSavedManually,
      CartSyncedToServerOnAuth cartSyncedToServer,
      String? couponMessage,
      String currency});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isCouponLoading = freezed,
    Object? isTotalsLoading = freezed,
    Object? couponHasError = freezed,
    Object? cartQuantity = freezed,
    Object? cartTotal = freezed,
    Object? discount = freezed,
    Object? orderTotal = freezed,
    Object? subTotal = freezed,
    Object? products = freezed,
    Object? couponStateModal = freezed,
    Object? cartSavedManually = freezed,
    Object? cartSyncedToServer = freezed,
    Object? couponMessage = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponLoading: isCouponLoading == freezed
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTotalsLoading: isTotalsLoading == freezed
          ? _value.isTotalsLoading
          : isTotalsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      couponHasError: couponHasError == freezed
          ? _value.couponHasError
          : couponHasError // ignore: cast_nullable_to_non_nullable
              as bool,
      cartQuantity: cartQuantity == freezed
          ? _value.cartQuantity
          : cartQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      orderTotal: orderTotal == freezed
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, ProductCartModal>,
      couponStateModal: couponStateModal == freezed
          ? _value.couponStateModal
          : couponStateModal // ignore: cast_nullable_to_non_nullable
              as CouponStateModal?,
      cartSavedManually: cartSavedManually == freezed
          ? _value.cartSavedManually
          : cartSavedManually // ignore: cast_nullable_to_non_nullable
              as bool,
      cartSyncedToServer: cartSyncedToServer == freezed
          ? _value.cartSyncedToServer
          : cartSyncedToServer // ignore: cast_nullable_to_non_nullable
              as CartSyncedToServerOnAuth,
      couponMessage: couponMessage == freezed
          ? _value.couponMessage
          : couponMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_CartStateCopyWith(
          _$_CartState value, $Res Function(_$_CartState) then) =
      __$$_CartStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isCouponLoading,
      bool isTotalsLoading,
      bool couponHasError,
      int cartQuantity,
      double cartTotal,
      double discount,
      double orderTotal,
      double subTotal,
      Map<String, ProductCartModal> products,
      CouponStateModal? couponStateModal,
      bool cartSavedManually,
      CartSyncedToServerOnAuth cartSyncedToServer,
      String? couponMessage,
      String currency});
}

/// @nodoc
class __$$_CartStateCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$_CartStateCopyWith<$Res> {
  __$$_CartStateCopyWithImpl(
      _$_CartState _value, $Res Function(_$_CartState) _then)
      : super(_value, (v) => _then(v as _$_CartState));

  @override
  _$_CartState get _value => super._value as _$_CartState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isCouponLoading = freezed,
    Object? isTotalsLoading = freezed,
    Object? couponHasError = freezed,
    Object? cartQuantity = freezed,
    Object? cartTotal = freezed,
    Object? discount = freezed,
    Object? orderTotal = freezed,
    Object? subTotal = freezed,
    Object? products = freezed,
    Object? couponStateModal = freezed,
    Object? cartSavedManually = freezed,
    Object? cartSyncedToServer = freezed,
    Object? couponMessage = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$_CartState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponLoading: isCouponLoading == freezed
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTotalsLoading: isTotalsLoading == freezed
          ? _value.isTotalsLoading
          : isTotalsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      couponHasError: couponHasError == freezed
          ? _value.couponHasError
          : couponHasError // ignore: cast_nullable_to_non_nullable
              as bool,
      cartQuantity: cartQuantity == freezed
          ? _value.cartQuantity
          : cartQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      orderTotal: orderTotal == freezed
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, ProductCartModal>,
      couponStateModal: couponStateModal == freezed
          ? _value.couponStateModal
          : couponStateModal // ignore: cast_nullable_to_non_nullable
              as CouponStateModal?,
      cartSavedManually: cartSavedManually == freezed
          ? _value.cartSavedManually
          : cartSavedManually // ignore: cast_nullable_to_non_nullable
              as bool,
      cartSyncedToServer: cartSyncedToServer == freezed
          ? _value.cartSyncedToServer
          : cartSyncedToServer // ignore: cast_nullable_to_non_nullable
              as CartSyncedToServerOnAuth,
      couponMessage: couponMessage == freezed
          ? _value.couponMessage
          : couponMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CartState implements _CartState {
  const _$_CartState(
      {required this.isLoading,
      required this.isCouponLoading,
      required this.isTotalsLoading,
      required this.couponHasError,
      required this.cartQuantity,
      required this.cartTotal,
      required this.discount,
      required this.orderTotal,
      required this.subTotal,
      required final Map<String, ProductCartModal> products,
      this.couponStateModal,
      required this.cartSavedManually,
      required this.cartSyncedToServer,
      this.couponMessage,
      required this.currency})
      : _products = products;

  @override
  final bool isLoading;
  @override
  final bool isCouponLoading;
  @override
  final bool isTotalsLoading;
  @override
  final bool couponHasError;
  @override
  final int cartQuantity;
  @override
  final double cartTotal;
  @override
  final double discount;
  @override
  final double orderTotal;
  @override
  final double subTotal;
  final Map<String, ProductCartModal> _products;
  @override
  Map<String, ProductCartModal> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_products);
  }

  @override
  final CouponStateModal? couponStateModal;
  @override
  final bool cartSavedManually;
  @override
  final CartSyncedToServerOnAuth cartSyncedToServer;
  @override
  final String? couponMessage;
  @override
  final String currency;

  @override
  String toString() {
    return 'CartState(isLoading: $isLoading, isCouponLoading: $isCouponLoading, isTotalsLoading: $isTotalsLoading, couponHasError: $couponHasError, cartQuantity: $cartQuantity, cartTotal: $cartTotal, discount: $discount, orderTotal: $orderTotal, subTotal: $subTotal, products: $products, couponStateModal: $couponStateModal, cartSavedManually: $cartSavedManually, cartSyncedToServer: $cartSyncedToServer, couponMessage: $couponMessage, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isCouponLoading, isCouponLoading) &&
            const DeepCollectionEquality()
                .equals(other.isTotalsLoading, isTotalsLoading) &&
            const DeepCollectionEquality()
                .equals(other.couponHasError, couponHasError) &&
            const DeepCollectionEquality()
                .equals(other.cartQuantity, cartQuantity) &&
            const DeepCollectionEquality().equals(other.cartTotal, cartTotal) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality()
                .equals(other.orderTotal, orderTotal) &&
            const DeepCollectionEquality().equals(other.subTotal, subTotal) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.couponStateModal, couponStateModal) &&
            const DeepCollectionEquality()
                .equals(other.cartSavedManually, cartSavedManually) &&
            const DeepCollectionEquality()
                .equals(other.cartSyncedToServer, cartSyncedToServer) &&
            const DeepCollectionEquality()
                .equals(other.couponMessage, couponMessage) &&
            const DeepCollectionEquality().equals(other.currency, currency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isCouponLoading),
      const DeepCollectionEquality().hash(isTotalsLoading),
      const DeepCollectionEquality().hash(couponHasError),
      const DeepCollectionEquality().hash(cartQuantity),
      const DeepCollectionEquality().hash(cartTotal),
      const DeepCollectionEquality().hash(discount),
      const DeepCollectionEquality().hash(orderTotal),
      const DeepCollectionEquality().hash(subTotal),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(couponStateModal),
      const DeepCollectionEquality().hash(cartSavedManually),
      const DeepCollectionEquality().hash(cartSyncedToServer),
      const DeepCollectionEquality().hash(couponMessage),
      const DeepCollectionEquality().hash(currency));

  @JsonKey(ignore: true)
  @override
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {required final bool isLoading,
      required final bool isCouponLoading,
      required final bool isTotalsLoading,
      required final bool couponHasError,
      required final int cartQuantity,
      required final double cartTotal,
      required final double discount,
      required final double orderTotal,
      required final double subTotal,
      required final Map<String, ProductCartModal> products,
      final CouponStateModal? couponStateModal,
      required final bool cartSavedManually,
      required final CartSyncedToServerOnAuth cartSyncedToServer,
      final String? couponMessage,
      required final String currency}) = _$_CartState;

  @override
  bool get isLoading;
  @override
  bool get isCouponLoading;
  @override
  bool get isTotalsLoading;
  @override
  bool get couponHasError;
  @override
  int get cartQuantity;
  @override
  double get cartTotal;
  @override
  double get discount;
  @override
  double get orderTotal;
  @override
  double get subTotal;
  @override
  Map<String, ProductCartModal> get products;
  @override
  CouponStateModal? get couponStateModal;
  @override
  bool get cartSavedManually;
  @override
  CartSyncedToServerOnAuth get cartSyncedToServer;
  @override
  String? get couponMessage;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
