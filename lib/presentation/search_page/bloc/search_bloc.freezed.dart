// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyWord) search,
    required TResult Function() loadMore,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyWord)? search,
    TResult Function()? loadMore,
    TResult Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyWord)? search,
    TResult Function()? loadMore,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Search value) search,
    required TResult Function(SearchEventLoadMore value) loadMore,
    required TResult Function(SearchEventClear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(SearchEventLoadMore value)? loadMore,
    TResult Function(SearchEventClear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(SearchEventLoadMore value)? loadMore,
    TResult Function(SearchEventClear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res> implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  final SearchEvent _value;
  // ignore: unused_field
  final $Res Function(SearchEvent) _then;
}

/// @nodoc
abstract class _$$SearchCopyWith<$Res> {
  factory _$$SearchCopyWith(_$Search value, $Res Function(_$Search) then) =
      __$$SearchCopyWithImpl<$Res>;
  $Res call({String keyWord});
}

/// @nodoc
class __$$SearchCopyWithImpl<$Res> extends _$SearchEventCopyWithImpl<$Res>
    implements _$$SearchCopyWith<$Res> {
  __$$SearchCopyWithImpl(_$Search _value, $Res Function(_$Search) _then)
      : super(_value, (v) => _then(v as _$Search));

  @override
  _$Search get _value => super._value as _$Search;

  @override
  $Res call({
    Object? keyWord = freezed,
  }) {
    return _then(_$Search(
      keyWord: keyWord == freezed
          ? _value.keyWord
          : keyWord // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Search implements Search {
  const _$Search({required this.keyWord});

  @override
  final String keyWord;

  @override
  String toString() {
    return 'SearchEvent.search(keyWord: $keyWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Search &&
            const DeepCollectionEquality().equals(other.keyWord, keyWord));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keyWord));

  @JsonKey(ignore: true)
  @override
  _$$SearchCopyWith<_$Search> get copyWith =>
      __$$SearchCopyWithImpl<_$Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyWord) search,
    required TResult Function() loadMore,
    required TResult Function() clear,
  }) {
    return search(keyWord);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyWord)? search,
    TResult Function()? loadMore,
    TResult Function()? clear,
  }) {
    return search?.call(keyWord);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyWord)? search,
    TResult Function()? loadMore,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(keyWord);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Search value) search,
    required TResult Function(SearchEventLoadMore value) loadMore,
    required TResult Function(SearchEventClear value) clear,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(SearchEventLoadMore value)? loadMore,
    TResult Function(SearchEventClear value)? clear,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(SearchEventLoadMore value)? loadMore,
    TResult Function(SearchEventClear value)? clear,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Search implements SearchEvent {
  const factory Search({required final String keyWord}) = _$Search;

  String get keyWord;
  @JsonKey(ignore: true)
  _$$SearchCopyWith<_$Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventLoadMoreCopyWith<$Res> {
  factory _$$SearchEventLoadMoreCopyWith(_$SearchEventLoadMore value,
          $Res Function(_$SearchEventLoadMore) then) =
      __$$SearchEventLoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchEventLoadMoreCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$SearchEventLoadMoreCopyWith<$Res> {
  __$$SearchEventLoadMoreCopyWithImpl(
      _$SearchEventLoadMore _value, $Res Function(_$SearchEventLoadMore) _then)
      : super(_value, (v) => _then(v as _$SearchEventLoadMore));

  @override
  _$SearchEventLoadMore get _value => super._value as _$SearchEventLoadMore;
}

/// @nodoc

class _$SearchEventLoadMore implements SearchEventLoadMore {
  const _$SearchEventLoadMore();

  @override
  String toString() {
    return 'SearchEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchEventLoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyWord) search,
    required TResult Function() loadMore,
    required TResult Function() clear,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyWord)? search,
    TResult Function()? loadMore,
    TResult Function()? clear,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyWord)? search,
    TResult Function()? loadMore,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Search value) search,
    required TResult Function(SearchEventLoadMore value) loadMore,
    required TResult Function(SearchEventClear value) clear,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(SearchEventLoadMore value)? loadMore,
    TResult Function(SearchEventClear value)? clear,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(SearchEventLoadMore value)? loadMore,
    TResult Function(SearchEventClear value)? clear,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class SearchEventLoadMore implements SearchEvent {
  const factory SearchEventLoadMore() = _$SearchEventLoadMore;
}

/// @nodoc
abstract class _$$SearchEventClearCopyWith<$Res> {
  factory _$$SearchEventClearCopyWith(
          _$SearchEventClear value, $Res Function(_$SearchEventClear) then) =
      __$$SearchEventClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchEventClearCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$SearchEventClearCopyWith<$Res> {
  __$$SearchEventClearCopyWithImpl(
      _$SearchEventClear _value, $Res Function(_$SearchEventClear) _then)
      : super(_value, (v) => _then(v as _$SearchEventClear));

  @override
  _$SearchEventClear get _value => super._value as _$SearchEventClear;
}

/// @nodoc

class _$SearchEventClear implements SearchEventClear {
  const _$SearchEventClear();

  @override
  String toString() {
    return 'SearchEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchEventClear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyWord) search,
    required TResult Function() loadMore,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyWord)? search,
    TResult Function()? loadMore,
    TResult Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyWord)? search,
    TResult Function()? loadMore,
    TResult Function()? clear,
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
    required TResult Function(Search value) search,
    required TResult Function(SearchEventLoadMore value) loadMore,
    required TResult Function(SearchEventClear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(SearchEventLoadMore value)? loadMore,
    TResult Function(SearchEventClear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(SearchEventLoadMore value)? loadMore,
    TResult Function(SearchEventClear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class SearchEventClear implements SearchEvent {
  const factory SearchEventClear() = _$SearchEventClear;
}

/// @nodoc
mixin _$SearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String get keyWord => throw _privateConstructorUsedError;
  List<ProductModal> get products => throw _privateConstructorUsedError;
  ProductSortModes get sortMode => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  ProductsMetadata get metadata => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      int currentPage,
      bool hasMore,
      String keyWord,
      List<ProductModal> products,
      ProductSortModes sortMode,
      bool hasError,
      ProductsMetadata metadata});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? currentPage = freezed,
    Object? hasMore = freezed,
    Object? keyWord = freezed,
    Object? products = freezed,
    Object? sortMode = freezed,
    Object? hasError = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: hasMore == freezed
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      keyWord: keyWord == freezed
          ? _value.keyWord
          : keyWord // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModal>,
      sortMode: sortMode == freezed
          ? _value.sortMode
          : sortMode // ignore: cast_nullable_to_non_nullable
              as ProductSortModes,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ProductsMetadata,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      int currentPage,
      bool hasMore,
      String keyWord,
      List<ProductModal> products,
      ProductSortModes sortMode,
      bool hasError,
      ProductsMetadata metadata});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, (v) => _then(v as _$_SearchState));

  @override
  _$_SearchState get _value => super._value as _$_SearchState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? currentPage = freezed,
    Object? hasMore = freezed,
    Object? keyWord = freezed,
    Object? products = freezed,
    Object? sortMode = freezed,
    Object? hasError = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$_SearchState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: hasMore == freezed
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      keyWord: keyWord == freezed
          ? _value.keyWord
          : keyWord // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModal>,
      sortMode: sortMode == freezed
          ? _value.sortMode
          : sortMode // ignore: cast_nullable_to_non_nullable
              as ProductSortModes,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ProductsMetadata,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required this.isLoading,
      required this.isMoreLoading,
      required this.currentPage,
      required this.hasMore,
      required this.keyWord,
      required final List<ProductModal> products,
      required this.sortMode,
      required this.hasError,
      required this.metadata})
      : _products = products;

  @override
  final bool isLoading;
  @override
  final bool isMoreLoading;
  @override
  final int currentPage;
  @override
  final bool hasMore;
  @override
  final String keyWord;
  final List<ProductModal> _products;
  @override
  List<ProductModal> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final ProductSortModes sortMode;
  @override
  final bool hasError;
  @override
  final ProductsMetadata metadata;

  @override
  String toString() {
    return 'SearchState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, currentPage: $currentPage, hasMore: $hasMore, keyWord: $keyWord, products: $products, sortMode: $sortMode, hasError: $hasError, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isMoreLoading, isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore) &&
            const DeepCollectionEquality().equals(other.keyWord, keyWord) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other.sortMode, sortMode) &&
            const DeepCollectionEquality().equals(other.hasError, hasError) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(hasMore),
      const DeepCollectionEquality().hash(keyWord),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(sortMode),
      const DeepCollectionEquality().hash(hasError),
      const DeepCollectionEquality().hash(metadata));

  @JsonKey(ignore: true)
  @override
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final bool isLoading,
      required final bool isMoreLoading,
      required final int currentPage,
      required final bool hasMore,
      required final String keyWord,
      required final List<ProductModal> products,
      required final ProductSortModes sortMode,
      required final bool hasError,
      required final ProductsMetadata metadata}) = _$_SearchState;

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  int get currentPage;
  @override
  bool get hasMore;
  @override
  String get keyWord;
  @override
  List<ProductModal> get products;
  @override
  ProductSortModes get sortMode;
  @override
  bool get hasError;
  @override
  ProductsMetadata get metadata;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
