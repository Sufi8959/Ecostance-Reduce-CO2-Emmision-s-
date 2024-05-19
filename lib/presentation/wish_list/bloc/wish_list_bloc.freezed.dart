// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wish_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WishListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ProductModal product) addItem,
    required TResult Function(ProductModal product) removeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModal product)? addItem,
    TResult Function(ProductModal product)? removeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModal product)? addItem,
    TResult Function(ProductModal product)? removeItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(AddItem value) addItem,
    required TResult Function(RemoveItem value) removeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(AddItem value)? addItem,
    TResult Function(RemoveItem value)? removeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(AddItem value)? addItem,
    TResult Function(RemoveItem value)? removeItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishListEventCopyWith<$Res> {
  factory $WishListEventCopyWith(
          WishListEvent value, $Res Function(WishListEvent) then) =
      _$WishListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WishListEventCopyWithImpl<$Res>
    implements $WishListEventCopyWith<$Res> {
  _$WishListEventCopyWithImpl(this._value, this._then);

  final WishListEvent _value;
  // ignore: unused_field
  final $Res Function(WishListEvent) _then;
}

/// @nodoc
abstract class _$$StartedCopyWith<$Res> {
  factory _$$StartedCopyWith(_$Started value, $Res Function(_$Started) then) =
      __$$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedCopyWithImpl<$Res> extends _$WishListEventCopyWithImpl<$Res>
    implements _$$StartedCopyWith<$Res> {
  __$$StartedCopyWithImpl(_$Started _value, $Res Function(_$Started) _then)
      : super(_value, (v) => _then(v as _$Started));

  @override
  _$Started get _value => super._value as _$Started;
}

/// @nodoc

class _$Started implements Started {
  const _$Started();

  @override
  String toString() {
    return 'WishListEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ProductModal product) addItem,
    required TResult Function(ProductModal product) removeItem,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModal product)? addItem,
    TResult Function(ProductModal product)? removeItem,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModal product)? addItem,
    TResult Function(ProductModal product)? removeItem,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(AddItem value) addItem,
    required TResult Function(RemoveItem value) removeItem,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(AddItem value)? addItem,
    TResult Function(RemoveItem value)? removeItem,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(AddItem value)? addItem,
    TResult Function(RemoveItem value)? removeItem,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements WishListEvent {
  const factory Started() = _$Started;
}

/// @nodoc
abstract class _$$AddItemCopyWith<$Res> {
  factory _$$AddItemCopyWith(_$AddItem value, $Res Function(_$AddItem) then) =
      __$$AddItemCopyWithImpl<$Res>;
  $Res call({ProductModal product});
}

/// @nodoc
class __$$AddItemCopyWithImpl<$Res> extends _$WishListEventCopyWithImpl<$Res>
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
              as ProductModal,
    ));
  }
}

/// @nodoc

class _$AddItem implements AddItem {
  const _$AddItem({required this.product});

  @override
  final ProductModal product;

  @override
  String toString() {
    return 'WishListEvent.addItem(product: $product)';
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
    required TResult Function() started,
    required TResult Function(ProductModal product) addItem,
    required TResult Function(ProductModal product) removeItem,
  }) {
    return addItem(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModal product)? addItem,
    TResult Function(ProductModal product)? removeItem,
  }) {
    return addItem?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModal product)? addItem,
    TResult Function(ProductModal product)? removeItem,
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
    required TResult Function(Started value) started,
    required TResult Function(AddItem value) addItem,
    required TResult Function(RemoveItem value) removeItem,
  }) {
    return addItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(AddItem value)? addItem,
    TResult Function(RemoveItem value)? removeItem,
  }) {
    return addItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(AddItem value)? addItem,
    TResult Function(RemoveItem value)? removeItem,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(this);
    }
    return orElse();
  }
}

abstract class AddItem implements WishListEvent {
  const factory AddItem({required final ProductModal product}) = _$AddItem;

  ProductModal get product;
  @JsonKey(ignore: true)
  _$$AddItemCopyWith<_$AddItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemCopyWith<$Res> {
  factory _$$RemoveItemCopyWith(
          _$RemoveItem value, $Res Function(_$RemoveItem) then) =
      __$$RemoveItemCopyWithImpl<$Res>;
  $Res call({ProductModal product});
}

/// @nodoc
class __$$RemoveItemCopyWithImpl<$Res> extends _$WishListEventCopyWithImpl<$Res>
    implements _$$RemoveItemCopyWith<$Res> {
  __$$RemoveItemCopyWithImpl(
      _$RemoveItem _value, $Res Function(_$RemoveItem) _then)
      : super(_value, (v) => _then(v as _$RemoveItem));

  @override
  _$RemoveItem get _value => super._value as _$RemoveItem;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_$RemoveItem(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModal,
    ));
  }
}

/// @nodoc

class _$RemoveItem implements RemoveItem {
  const _$RemoveItem({required this.product});

  @override
  final ProductModal product;

  @override
  String toString() {
    return 'WishListEvent.removeItem(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItem &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$$RemoveItemCopyWith<_$RemoveItem> get copyWith =>
      __$$RemoveItemCopyWithImpl<_$RemoveItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ProductModal product) addItem,
    required TResult Function(ProductModal product) removeItem,
  }) {
    return removeItem(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModal product)? addItem,
    TResult Function(ProductModal product)? removeItem,
  }) {
    return removeItem?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProductModal product)? addItem,
    TResult Function(ProductModal product)? removeItem,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(AddItem value) addItem,
    required TResult Function(RemoveItem value) removeItem,
  }) {
    return removeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(AddItem value)? addItem,
    TResult Function(RemoveItem value)? removeItem,
  }) {
    return removeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(AddItem value)? addItem,
    TResult Function(RemoveItem value)? removeItem,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(this);
    }
    return orElse();
  }
}

abstract class RemoveItem implements WishListEvent {
  const factory RemoveItem({required final ProductModal product}) =
      _$RemoveItem;

  ProductModal get product;
  @JsonKey(ignore: true)
  _$$RemoveItemCopyWith<_$RemoveItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WishListState {
  List<ProductModal> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WishListStateCopyWith<WishListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishListStateCopyWith<$Res> {
  factory $WishListStateCopyWith(
          WishListState value, $Res Function(WishListState) then) =
      _$WishListStateCopyWithImpl<$Res>;
  $Res call({List<ProductModal> items, bool isLoading});
}

/// @nodoc
class _$WishListStateCopyWithImpl<$Res>
    implements $WishListStateCopyWith<$Res> {
  _$WishListStateCopyWithImpl(this._value, this._then);

  final WishListState _value;
  // ignore: unused_field
  final $Res Function(WishListState) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductModal>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_WishListStateCopyWith<$Res>
    implements $WishListStateCopyWith<$Res> {
  factory _$$_WishListStateCopyWith(
          _$_WishListState value, $Res Function(_$_WishListState) then) =
      __$$_WishListStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ProductModal> items, bool isLoading});
}

/// @nodoc
class __$$_WishListStateCopyWithImpl<$Res>
    extends _$WishListStateCopyWithImpl<$Res>
    implements _$$_WishListStateCopyWith<$Res> {
  __$$_WishListStateCopyWithImpl(
      _$_WishListState _value, $Res Function(_$_WishListState) _then)
      : super(_value, (v) => _then(v as _$_WishListState));

  @override
  _$_WishListState get _value => super._value as _$_WishListState;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_WishListState(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductModal>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WishListState implements _WishListState {
  const _$_WishListState(
      {required final List<ProductModal> items, required this.isLoading})
      : _items = items;

  final List<ProductModal> _items;
  @override
  List<ProductModal> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'WishListState(items: $items, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WishListState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_WishListStateCopyWith<_$_WishListState> get copyWith =>
      __$$_WishListStateCopyWithImpl<_$_WishListState>(this, _$identity);
}

abstract class _WishListState implements WishListState {
  const factory _WishListState(
      {required final List<ProductModal> items,
      required final bool isLoading}) = _$_WishListState;

  @override
  List<ProductModal> get items;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_WishListStateCopyWith<_$_WishListState> get copyWith =>
      throw _privateConstructorUsedError;
}
