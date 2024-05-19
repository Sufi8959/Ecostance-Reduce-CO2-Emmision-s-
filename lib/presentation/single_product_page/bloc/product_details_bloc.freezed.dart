// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> productIds) started,
    required TResult Function(String productId) loadProductWithI,
    required TResult Function(int index) loadProductWithIndex,
    required TResult Function() viewComplete,
    required TResult Function(String productId) getReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsEventStarted value) started,
    required TResult Function(ProductDetailsEventLoadProductWithId value)
        loadProductWithI,
    required TResult Function(ProductDetailsEventLoadProductWithIndex value)
        loadProductWithIndex,
    required TResult Function(ProductDetailsEventViewComplete value)
        viewComplete,
    required TResult Function(ProductDetailsEventGetReviews value) getReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsEventCopyWith<$Res> {
  factory $ProductDetailsEventCopyWith(
          ProductDetailsEvent value, $Res Function(ProductDetailsEvent) then) =
      _$ProductDetailsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductDetailsEventCopyWithImpl<$Res>
    implements $ProductDetailsEventCopyWith<$Res> {
  _$ProductDetailsEventCopyWithImpl(this._value, this._then);

  final ProductDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(ProductDetailsEvent) _then;
}

/// @nodoc
abstract class _$$ProductDetailsEventStartedCopyWith<$Res> {
  factory _$$ProductDetailsEventStartedCopyWith(
          _$ProductDetailsEventStarted value,
          $Res Function(_$ProductDetailsEventStarted) then) =
      __$$ProductDetailsEventStartedCopyWithImpl<$Res>;
  $Res call({List<String> productIds});
}

/// @nodoc
class __$$ProductDetailsEventStartedCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res>
    implements _$$ProductDetailsEventStartedCopyWith<$Res> {
  __$$ProductDetailsEventStartedCopyWithImpl(
      _$ProductDetailsEventStarted _value,
      $Res Function(_$ProductDetailsEventStarted) _then)
      : super(_value, (v) => _then(v as _$ProductDetailsEventStarted));

  @override
  _$ProductDetailsEventStarted get _value =>
      super._value as _$ProductDetailsEventStarted;

  @override
  $Res call({
    Object? productIds = freezed,
  }) {
    return _then(_$ProductDetailsEventStarted(
      productIds: productIds == freezed
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ProductDetailsEventStarted implements ProductDetailsEventStarted {
  const _$ProductDetailsEventStarted({required final List<String> productIds})
      : _productIds = productIds;

  final List<String> _productIds;
  @override
  List<String> get productIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productIds);
  }

  @override
  String toString() {
    return 'ProductDetailsEvent.started(productIds: $productIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsEventStarted &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productIds));

  @JsonKey(ignore: true)
  @override
  _$$ProductDetailsEventStartedCopyWith<_$ProductDetailsEventStarted>
      get copyWith => __$$ProductDetailsEventStartedCopyWithImpl<
          _$ProductDetailsEventStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> productIds) started,
    required TResult Function(String productId) loadProductWithI,
    required TResult Function(int index) loadProductWithIndex,
    required TResult Function() viewComplete,
    required TResult Function(String productId) getReviews,
  }) {
    return started(productIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
  }) {
    return started?.call(productIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(productIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsEventStarted value) started,
    required TResult Function(ProductDetailsEventLoadProductWithId value)
        loadProductWithI,
    required TResult Function(ProductDetailsEventLoadProductWithIndex value)
        loadProductWithIndex,
    required TResult Function(ProductDetailsEventViewComplete value)
        viewComplete,
    required TResult Function(ProductDetailsEventGetReviews value) getReviews,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsEventStarted implements ProductDetailsEvent {
  const factory ProductDetailsEventStarted(
      {required final List<String> productIds}) = _$ProductDetailsEventStarted;

  List<String> get productIds;
  @JsonKey(ignore: true)
  _$$ProductDetailsEventStartedCopyWith<_$ProductDetailsEventStarted>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductDetailsEventLoadProductWithIdCopyWith<$Res> {
  factory _$$ProductDetailsEventLoadProductWithIdCopyWith(
          _$ProductDetailsEventLoadProductWithId value,
          $Res Function(_$ProductDetailsEventLoadProductWithId) then) =
      __$$ProductDetailsEventLoadProductWithIdCopyWithImpl<$Res>;
  $Res call({String productId});
}

/// @nodoc
class __$$ProductDetailsEventLoadProductWithIdCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res>
    implements _$$ProductDetailsEventLoadProductWithIdCopyWith<$Res> {
  __$$ProductDetailsEventLoadProductWithIdCopyWithImpl(
      _$ProductDetailsEventLoadProductWithId _value,
      $Res Function(_$ProductDetailsEventLoadProductWithId) _then)
      : super(
            _value, (v) => _then(v as _$ProductDetailsEventLoadProductWithId));

  @override
  _$ProductDetailsEventLoadProductWithId get _value =>
      super._value as _$ProductDetailsEventLoadProductWithId;

  @override
  $Res call({
    Object? productId = freezed,
  }) {
    return _then(_$ProductDetailsEventLoadProductWithId(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductDetailsEventLoadProductWithId
    implements ProductDetailsEventLoadProductWithId {
  const _$ProductDetailsEventLoadProductWithId({required this.productId});

  @override
  final String productId;

  @override
  String toString() {
    return 'ProductDetailsEvent.loadProductWithI(productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsEventLoadProductWithId &&
            const DeepCollectionEquality().equals(other.productId, productId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(productId));

  @JsonKey(ignore: true)
  @override
  _$$ProductDetailsEventLoadProductWithIdCopyWith<
          _$ProductDetailsEventLoadProductWithId>
      get copyWith => __$$ProductDetailsEventLoadProductWithIdCopyWithImpl<
          _$ProductDetailsEventLoadProductWithId>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> productIds) started,
    required TResult Function(String productId) loadProductWithI,
    required TResult Function(int index) loadProductWithIndex,
    required TResult Function() viewComplete,
    required TResult Function(String productId) getReviews,
  }) {
    return loadProductWithI(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
  }) {
    return loadProductWithI?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
    required TResult orElse(),
  }) {
    if (loadProductWithI != null) {
      return loadProductWithI(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsEventStarted value) started,
    required TResult Function(ProductDetailsEventLoadProductWithId value)
        loadProductWithI,
    required TResult Function(ProductDetailsEventLoadProductWithIndex value)
        loadProductWithIndex,
    required TResult Function(ProductDetailsEventViewComplete value)
        viewComplete,
    required TResult Function(ProductDetailsEventGetReviews value) getReviews,
  }) {
    return loadProductWithI(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
  }) {
    return loadProductWithI?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
    required TResult orElse(),
  }) {
    if (loadProductWithI != null) {
      return loadProductWithI(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsEventLoadProductWithId
    implements ProductDetailsEvent {
  const factory ProductDetailsEventLoadProductWithId(
          {required final String productId}) =
      _$ProductDetailsEventLoadProductWithId;

  String get productId;
  @JsonKey(ignore: true)
  _$$ProductDetailsEventLoadProductWithIdCopyWith<
          _$ProductDetailsEventLoadProductWithId>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductDetailsEventLoadProductWithIndexCopyWith<$Res> {
  factory _$$ProductDetailsEventLoadProductWithIndexCopyWith(
          _$ProductDetailsEventLoadProductWithIndex value,
          $Res Function(_$ProductDetailsEventLoadProductWithIndex) then) =
      __$$ProductDetailsEventLoadProductWithIndexCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$$ProductDetailsEventLoadProductWithIndexCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res>
    implements _$$ProductDetailsEventLoadProductWithIndexCopyWith<$Res> {
  __$$ProductDetailsEventLoadProductWithIndexCopyWithImpl(
      _$ProductDetailsEventLoadProductWithIndex _value,
      $Res Function(_$ProductDetailsEventLoadProductWithIndex) _then)
      : super(_value,
            (v) => _then(v as _$ProductDetailsEventLoadProductWithIndex));

  @override
  _$ProductDetailsEventLoadProductWithIndex get _value =>
      super._value as _$ProductDetailsEventLoadProductWithIndex;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$ProductDetailsEventLoadProductWithIndex(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProductDetailsEventLoadProductWithIndex
    implements ProductDetailsEventLoadProductWithIndex {
  const _$ProductDetailsEventLoadProductWithIndex({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'ProductDetailsEvent.loadProductWithIndex(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsEventLoadProductWithIndex &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$ProductDetailsEventLoadProductWithIndexCopyWith<
          _$ProductDetailsEventLoadProductWithIndex>
      get copyWith => __$$ProductDetailsEventLoadProductWithIndexCopyWithImpl<
          _$ProductDetailsEventLoadProductWithIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> productIds) started,
    required TResult Function(String productId) loadProductWithI,
    required TResult Function(int index) loadProductWithIndex,
    required TResult Function() viewComplete,
    required TResult Function(String productId) getReviews,
  }) {
    return loadProductWithIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
  }) {
    return loadProductWithIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
    required TResult orElse(),
  }) {
    if (loadProductWithIndex != null) {
      return loadProductWithIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsEventStarted value) started,
    required TResult Function(ProductDetailsEventLoadProductWithId value)
        loadProductWithI,
    required TResult Function(ProductDetailsEventLoadProductWithIndex value)
        loadProductWithIndex,
    required TResult Function(ProductDetailsEventViewComplete value)
        viewComplete,
    required TResult Function(ProductDetailsEventGetReviews value) getReviews,
  }) {
    return loadProductWithIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
  }) {
    return loadProductWithIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
    required TResult orElse(),
  }) {
    if (loadProductWithIndex != null) {
      return loadProductWithIndex(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsEventLoadProductWithIndex
    implements ProductDetailsEvent {
  const factory ProductDetailsEventLoadProductWithIndex(
      {required final int index}) = _$ProductDetailsEventLoadProductWithIndex;

  int get index;
  @JsonKey(ignore: true)
  _$$ProductDetailsEventLoadProductWithIndexCopyWith<
          _$ProductDetailsEventLoadProductWithIndex>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductDetailsEventViewCompleteCopyWith<$Res> {
  factory _$$ProductDetailsEventViewCompleteCopyWith(
          _$ProductDetailsEventViewComplete value,
          $Res Function(_$ProductDetailsEventViewComplete) then) =
      __$$ProductDetailsEventViewCompleteCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductDetailsEventViewCompleteCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res>
    implements _$$ProductDetailsEventViewCompleteCopyWith<$Res> {
  __$$ProductDetailsEventViewCompleteCopyWithImpl(
      _$ProductDetailsEventViewComplete _value,
      $Res Function(_$ProductDetailsEventViewComplete) _then)
      : super(_value, (v) => _then(v as _$ProductDetailsEventViewComplete));

  @override
  _$ProductDetailsEventViewComplete get _value =>
      super._value as _$ProductDetailsEventViewComplete;
}

/// @nodoc

class _$ProductDetailsEventViewComplete
    implements ProductDetailsEventViewComplete {
  const _$ProductDetailsEventViewComplete();

  @override
  String toString() {
    return 'ProductDetailsEvent.viewComplete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsEventViewComplete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> productIds) started,
    required TResult Function(String productId) loadProductWithI,
    required TResult Function(int index) loadProductWithIndex,
    required TResult Function() viewComplete,
    required TResult Function(String productId) getReviews,
  }) {
    return viewComplete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
  }) {
    return viewComplete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
    required TResult orElse(),
  }) {
    if (viewComplete != null) {
      return viewComplete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsEventStarted value) started,
    required TResult Function(ProductDetailsEventLoadProductWithId value)
        loadProductWithI,
    required TResult Function(ProductDetailsEventLoadProductWithIndex value)
        loadProductWithIndex,
    required TResult Function(ProductDetailsEventViewComplete value)
        viewComplete,
    required TResult Function(ProductDetailsEventGetReviews value) getReviews,
  }) {
    return viewComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
  }) {
    return viewComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
    required TResult orElse(),
  }) {
    if (viewComplete != null) {
      return viewComplete(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsEventViewComplete implements ProductDetailsEvent {
  const factory ProductDetailsEventViewComplete() =
      _$ProductDetailsEventViewComplete;
}

/// @nodoc
abstract class _$$ProductDetailsEventGetReviewsCopyWith<$Res> {
  factory _$$ProductDetailsEventGetReviewsCopyWith(
          _$ProductDetailsEventGetReviews value,
          $Res Function(_$ProductDetailsEventGetReviews) then) =
      __$$ProductDetailsEventGetReviewsCopyWithImpl<$Res>;
  $Res call({String productId});
}

/// @nodoc
class __$$ProductDetailsEventGetReviewsCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res>
    implements _$$ProductDetailsEventGetReviewsCopyWith<$Res> {
  __$$ProductDetailsEventGetReviewsCopyWithImpl(
      _$ProductDetailsEventGetReviews _value,
      $Res Function(_$ProductDetailsEventGetReviews) _then)
      : super(_value, (v) => _then(v as _$ProductDetailsEventGetReviews));

  @override
  _$ProductDetailsEventGetReviews get _value =>
      super._value as _$ProductDetailsEventGetReviews;

  @override
  $Res call({
    Object? productId = freezed,
  }) {
    return _then(_$ProductDetailsEventGetReviews(
      productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductDetailsEventGetReviews implements ProductDetailsEventGetReviews {
  const _$ProductDetailsEventGetReviews(this.productId);

  @override
  final String productId;

  @override
  String toString() {
    return 'ProductDetailsEvent.getReviews(productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsEventGetReviews &&
            const DeepCollectionEquality().equals(other.productId, productId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(productId));

  @JsonKey(ignore: true)
  @override
  _$$ProductDetailsEventGetReviewsCopyWith<_$ProductDetailsEventGetReviews>
      get copyWith => __$$ProductDetailsEventGetReviewsCopyWithImpl<
          _$ProductDetailsEventGetReviews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> productIds) started,
    required TResult Function(String productId) loadProductWithI,
    required TResult Function(int index) loadProductWithIndex,
    required TResult Function() viewComplete,
    required TResult Function(String productId) getReviews,
  }) {
    return getReviews(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
  }) {
    return getReviews?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> productIds)? started,
    TResult Function(String productId)? loadProductWithI,
    TResult Function(int index)? loadProductWithIndex,
    TResult Function()? viewComplete,
    TResult Function(String productId)? getReviews,
    required TResult orElse(),
  }) {
    if (getReviews != null) {
      return getReviews(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsEventStarted value) started,
    required TResult Function(ProductDetailsEventLoadProductWithId value)
        loadProductWithI,
    required TResult Function(ProductDetailsEventLoadProductWithIndex value)
        loadProductWithIndex,
    required TResult Function(ProductDetailsEventViewComplete value)
        viewComplete,
    required TResult Function(ProductDetailsEventGetReviews value) getReviews,
  }) {
    return getReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
  }) {
    return getReviews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsEventStarted value)? started,
    TResult Function(ProductDetailsEventLoadProductWithId value)?
        loadProductWithI,
    TResult Function(ProductDetailsEventLoadProductWithIndex value)?
        loadProductWithIndex,
    TResult Function(ProductDetailsEventViewComplete value)? viewComplete,
    TResult Function(ProductDetailsEventGetReviews value)? getReviews,
    required TResult orElse(),
  }) {
    if (getReviews != null) {
      return getReviews(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsEventGetReviews implements ProductDetailsEvent {
  const factory ProductDetailsEventGetReviews(final String productId) =
      _$ProductDetailsEventGetReviews;

  String get productId;
  @JsonKey(ignore: true)
  _$$ProductDetailsEventGetReviewsCopyWith<_$ProductDetailsEventGetReviews>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  ProductModal get productModal => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<String> get productIds => throw _privateConstructorUsedError;
  String get currentId => throw _privateConstructorUsedError;
  List<ReviewModal> get currentProductReviews =>
      throw _privateConstructorUsedError;
  bool get reviewHasError => throw _privateConstructorUsedError;
  bool get reviewLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            ProductModal productModal,
            bool hasError,
            List<String> productIds,
            String currentId,
            List<ReviewModal> currentProductReviews,
            bool reviewHasError,
            bool reviewLoading)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            ProductModal productModal,
            bool hasError,
            List<String> productIds,
            String currentId,
            List<ReviewModal> currentProductReviews,
            bool reviewHasError,
            bool reviewLoading)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            ProductModal productModal,
            bool hasError,
            List<String> productIds,
            String currentId,
            List<ReviewModal> currentProductReviews,
            bool reviewHasError,
            bool reviewLoading)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailsStateCopyWith<ProductDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      ProductModal productModal,
      bool hasError,
      List<String> productIds,
      String currentId,
      List<ReviewModal> currentProductReviews,
      bool reviewHasError,
      bool reviewLoading});
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  final ProductDetailsState _value;
  // ignore: unused_field
  final $Res Function(ProductDetailsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? productModal = freezed,
    Object? hasError = freezed,
    Object? productIds = freezed,
    Object? currentId = freezed,
    Object? currentProductReviews = freezed,
    Object? reviewHasError = freezed,
    Object? reviewLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productModal: productModal == freezed
          ? _value.productModal
          : productModal // ignore: cast_nullable_to_non_nullable
              as ProductModal,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      productIds: productIds == freezed
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentId: currentId == freezed
          ? _value.currentId
          : currentId // ignore: cast_nullable_to_non_nullable
              as String,
      currentProductReviews: currentProductReviews == freezed
          ? _value.currentProductReviews
          : currentProductReviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModal>,
      reviewHasError: reviewHasError == freezed
          ? _value.reviewHasError
          : reviewHasError // ignore: cast_nullable_to_non_nullable
              as bool,
      reviewLoading: reviewLoading == freezed
          ? _value.reviewLoading
          : reviewLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      ProductModal productModal,
      bool hasError,
      List<String> productIds,
      String currentId,
      List<ReviewModal> currentProductReviews,
      bool reviewHasError,
      bool reviewLoading});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? productModal = freezed,
    Object? hasError = freezed,
    Object? productIds = freezed,
    Object? currentId = freezed,
    Object? currentProductReviews = freezed,
    Object? reviewHasError = freezed,
    Object? reviewLoading = freezed,
  }) {
    return _then(_$_Initial(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productModal: productModal == freezed
          ? _value.productModal
          : productModal // ignore: cast_nullable_to_non_nullable
              as ProductModal,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      productIds: productIds == freezed
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentId: currentId == freezed
          ? _value.currentId
          : currentId // ignore: cast_nullable_to_non_nullable
              as String,
      currentProductReviews: currentProductReviews == freezed
          ? _value._currentProductReviews
          : currentProductReviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModal>,
      reviewHasError: reviewHasError == freezed
          ? _value.reviewHasError
          : reviewHasError // ignore: cast_nullable_to_non_nullable
              as bool,
      reviewLoading: reviewLoading == freezed
          ? _value.reviewLoading
          : reviewLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isLoading,
      required this.productModal,
      required this.hasError,
      required final List<String> productIds,
      required this.currentId,
      required final List<ReviewModal> currentProductReviews,
      required this.reviewHasError,
      required this.reviewLoading})
      : _productIds = productIds,
        _currentProductReviews = currentProductReviews;

  @override
  final bool isLoading;
  @override
  final ProductModal productModal;
  @override
  final bool hasError;
  final List<String> _productIds;
  @override
  List<String> get productIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productIds);
  }

  @override
  final String currentId;
  final List<ReviewModal> _currentProductReviews;
  @override
  List<ReviewModal> get currentProductReviews {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentProductReviews);
  }

  @override
  final bool reviewHasError;
  @override
  final bool reviewLoading;

  @override
  String toString() {
    return 'ProductDetailsState.initial(isLoading: $isLoading, productModal: $productModal, hasError: $hasError, productIds: $productIds, currentId: $currentId, currentProductReviews: $currentProductReviews, reviewHasError: $reviewHasError, reviewLoading: $reviewLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.productModal, productModal) &&
            const DeepCollectionEquality().equals(other.hasError, hasError) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds) &&
            const DeepCollectionEquality().equals(other.currentId, currentId) &&
            const DeepCollectionEquality()
                .equals(other._currentProductReviews, _currentProductReviews) &&
            const DeepCollectionEquality()
                .equals(other.reviewHasError, reviewHasError) &&
            const DeepCollectionEquality()
                .equals(other.reviewLoading, reviewLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(productModal),
      const DeepCollectionEquality().hash(hasError),
      const DeepCollectionEquality().hash(_productIds),
      const DeepCollectionEquality().hash(currentId),
      const DeepCollectionEquality().hash(_currentProductReviews),
      const DeepCollectionEquality().hash(reviewHasError),
      const DeepCollectionEquality().hash(reviewLoading));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            ProductModal productModal,
            bool hasError,
            List<String> productIds,
            String currentId,
            List<ReviewModal> currentProductReviews,
            bool reviewHasError,
            bool reviewLoading)
        initial,
  }) {
    return initial(isLoading, productModal, hasError, productIds, currentId,
        currentProductReviews, reviewHasError, reviewLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            ProductModal productModal,
            bool hasError,
            List<String> productIds,
            String currentId,
            List<ReviewModal> currentProductReviews,
            bool reviewHasError,
            bool reviewLoading)?
        initial,
  }) {
    return initial?.call(isLoading, productModal, hasError, productIds,
        currentId, currentProductReviews, reviewHasError, reviewLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            ProductModal productModal,
            bool hasError,
            List<String> productIds,
            String currentId,
            List<ReviewModal> currentProductReviews,
            bool reviewHasError,
            bool reviewLoading)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, productModal, hasError, productIds, currentId,
          currentProductReviews, reviewHasError, reviewLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductDetailsState {
  const factory _Initial(
      {required final bool isLoading,
      required final ProductModal productModal,
      required final bool hasError,
      required final List<String> productIds,
      required final String currentId,
      required final List<ReviewModal> currentProductReviews,
      required final bool reviewHasError,
      required final bool reviewLoading}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  ProductModal get productModal;
  @override
  bool get hasError;
  @override
  List<String> get productIds;
  @override
  String get currentId;
  @override
  List<ReviewModal> get currentProductReviews;
  @override
  bool get reviewHasError;
  @override
  bool get reviewLoading;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
