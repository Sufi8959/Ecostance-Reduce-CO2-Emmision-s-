// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_controller_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppControllerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CountryModal countryModal) updateCountry,
    required TResult Function(String currency) updateCurrency,
    required TResult Function() fetchCountries,
    required TResult Function(bool newStatus) setNotificationStatus,
    required TResult Function(List<CountryModal> data) addListOfCountries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(UpdateCountry value) updateCountry,
    required TResult Function(AppControllerEventupdateCurrency value)
        updateCurrency,
    required TResult Function(AppControllerEventFetchCountries value)
        fetchCountries,
    required TResult Function(AppControllerEventSetNotificationStatus value)
        setNotificationStatus,
    required TResult Function(AppControllerEventaddListOfCountries value)
        addListOfCountries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppControllerEventCopyWith<$Res> {
  factory $AppControllerEventCopyWith(
          AppControllerEvent value, $Res Function(AppControllerEvent) then) =
      _$AppControllerEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppControllerEventCopyWithImpl<$Res>
    implements $AppControllerEventCopyWith<$Res> {
  _$AppControllerEventCopyWithImpl(this._value, this._then);

  final AppControllerEvent _value;
  // ignore: unused_field
  final $Res Function(AppControllerEvent) _then;
}

/// @nodoc
abstract class _$$StartedCopyWith<$Res> {
  factory _$$StartedCopyWith(_$Started value, $Res Function(_$Started) then) =
      __$$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedCopyWithImpl<$Res>
    extends _$AppControllerEventCopyWithImpl<$Res>
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
    return 'AppControllerEvent.started()';
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
    required TResult Function(CountryModal countryModal) updateCountry,
    required TResult Function(String currency) updateCurrency,
    required TResult Function() fetchCountries,
    required TResult Function(bool newStatus) setNotificationStatus,
    required TResult Function(List<CountryModal> data) addListOfCountries,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
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
    required TResult Function(UpdateCountry value) updateCountry,
    required TResult Function(AppControllerEventupdateCurrency value)
        updateCurrency,
    required TResult Function(AppControllerEventFetchCountries value)
        fetchCountries,
    required TResult Function(AppControllerEventSetNotificationStatus value)
        setNotificationStatus,
    required TResult Function(AppControllerEventaddListOfCountries value)
        addListOfCountries,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements AppControllerEvent {
  const factory Started() = _$Started;
}

/// @nodoc
abstract class _$$UpdateCountryCopyWith<$Res> {
  factory _$$UpdateCountryCopyWith(
          _$UpdateCountry value, $Res Function(_$UpdateCountry) then) =
      __$$UpdateCountryCopyWithImpl<$Res>;
  $Res call({CountryModal countryModal});
}

/// @nodoc
class __$$UpdateCountryCopyWithImpl<$Res>
    extends _$AppControllerEventCopyWithImpl<$Res>
    implements _$$UpdateCountryCopyWith<$Res> {
  __$$UpdateCountryCopyWithImpl(
      _$UpdateCountry _value, $Res Function(_$UpdateCountry) _then)
      : super(_value, (v) => _then(v as _$UpdateCountry));

  @override
  _$UpdateCountry get _value => super._value as _$UpdateCountry;

  @override
  $Res call({
    Object? countryModal = freezed,
  }) {
    return _then(_$UpdateCountry(
      countryModal: countryModal == freezed
          ? _value.countryModal
          : countryModal // ignore: cast_nullable_to_non_nullable
              as CountryModal,
    ));
  }
}

/// @nodoc

class _$UpdateCountry implements UpdateCountry {
  const _$UpdateCountry({required this.countryModal});

  @override
  final CountryModal countryModal;

  @override
  String toString() {
    return 'AppControllerEvent.updateCountry(countryModal: $countryModal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCountry &&
            const DeepCollectionEquality()
                .equals(other.countryModal, countryModal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(countryModal));

  @JsonKey(ignore: true)
  @override
  _$$UpdateCountryCopyWith<_$UpdateCountry> get copyWith =>
      __$$UpdateCountryCopyWithImpl<_$UpdateCountry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CountryModal countryModal) updateCountry,
    required TResult Function(String currency) updateCurrency,
    required TResult Function() fetchCountries,
    required TResult Function(bool newStatus) setNotificationStatus,
    required TResult Function(List<CountryModal> data) addListOfCountries,
  }) {
    return updateCountry(countryModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
  }) {
    return updateCountry?.call(countryModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
    required TResult orElse(),
  }) {
    if (updateCountry != null) {
      return updateCountry(countryModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(UpdateCountry value) updateCountry,
    required TResult Function(AppControllerEventupdateCurrency value)
        updateCurrency,
    required TResult Function(AppControllerEventFetchCountries value)
        fetchCountries,
    required TResult Function(AppControllerEventSetNotificationStatus value)
        setNotificationStatus,
    required TResult Function(AppControllerEventaddListOfCountries value)
        addListOfCountries,
  }) {
    return updateCountry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
  }) {
    return updateCountry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
    required TResult orElse(),
  }) {
    if (updateCountry != null) {
      return updateCountry(this);
    }
    return orElse();
  }
}

abstract class UpdateCountry implements AppControllerEvent {
  const factory UpdateCountry({required final CountryModal countryModal}) =
      _$UpdateCountry;

  CountryModal get countryModal;
  @JsonKey(ignore: true)
  _$$UpdateCountryCopyWith<_$UpdateCountry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppControllerEventupdateCurrencyCopyWith<$Res> {
  factory _$$AppControllerEventupdateCurrencyCopyWith(
          _$AppControllerEventupdateCurrency value,
          $Res Function(_$AppControllerEventupdateCurrency) then) =
      __$$AppControllerEventupdateCurrencyCopyWithImpl<$Res>;
  $Res call({String currency});
}

/// @nodoc
class __$$AppControllerEventupdateCurrencyCopyWithImpl<$Res>
    extends _$AppControllerEventCopyWithImpl<$Res>
    implements _$$AppControllerEventupdateCurrencyCopyWith<$Res> {
  __$$AppControllerEventupdateCurrencyCopyWithImpl(
      _$AppControllerEventupdateCurrency _value,
      $Res Function(_$AppControllerEventupdateCurrency) _then)
      : super(_value, (v) => _then(v as _$AppControllerEventupdateCurrency));

  @override
  _$AppControllerEventupdateCurrency get _value =>
      super._value as _$AppControllerEventupdateCurrency;

  @override
  $Res call({
    Object? currency = freezed,
  }) {
    return _then(_$AppControllerEventupdateCurrency(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppControllerEventupdateCurrency
    implements AppControllerEventupdateCurrency {
  const _$AppControllerEventupdateCurrency({required this.currency});

  @override
  final String currency;

  @override
  String toString() {
    return 'AppControllerEvent.updateCurrency(currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppControllerEventupdateCurrency &&
            const DeepCollectionEquality().equals(other.currency, currency));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(currency));

  @JsonKey(ignore: true)
  @override
  _$$AppControllerEventupdateCurrencyCopyWith<
          _$AppControllerEventupdateCurrency>
      get copyWith => __$$AppControllerEventupdateCurrencyCopyWithImpl<
          _$AppControllerEventupdateCurrency>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CountryModal countryModal) updateCountry,
    required TResult Function(String currency) updateCurrency,
    required TResult Function() fetchCountries,
    required TResult Function(bool newStatus) setNotificationStatus,
    required TResult Function(List<CountryModal> data) addListOfCountries,
  }) {
    return updateCurrency(currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
  }) {
    return updateCurrency?.call(currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
    required TResult orElse(),
  }) {
    if (updateCurrency != null) {
      return updateCurrency(currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(UpdateCountry value) updateCountry,
    required TResult Function(AppControllerEventupdateCurrency value)
        updateCurrency,
    required TResult Function(AppControllerEventFetchCountries value)
        fetchCountries,
    required TResult Function(AppControllerEventSetNotificationStatus value)
        setNotificationStatus,
    required TResult Function(AppControllerEventaddListOfCountries value)
        addListOfCountries,
  }) {
    return updateCurrency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
  }) {
    return updateCurrency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
    required TResult orElse(),
  }) {
    if (updateCurrency != null) {
      return updateCurrency(this);
    }
    return orElse();
  }
}

abstract class AppControllerEventupdateCurrency implements AppControllerEvent {
  const factory AppControllerEventupdateCurrency(
      {required final String currency}) = _$AppControllerEventupdateCurrency;

  String get currency;
  @JsonKey(ignore: true)
  _$$AppControllerEventupdateCurrencyCopyWith<
          _$AppControllerEventupdateCurrency>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppControllerEventFetchCountriesCopyWith<$Res> {
  factory _$$AppControllerEventFetchCountriesCopyWith(
          _$AppControllerEventFetchCountries value,
          $Res Function(_$AppControllerEventFetchCountries) then) =
      __$$AppControllerEventFetchCountriesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppControllerEventFetchCountriesCopyWithImpl<$Res>
    extends _$AppControllerEventCopyWithImpl<$Res>
    implements _$$AppControllerEventFetchCountriesCopyWith<$Res> {
  __$$AppControllerEventFetchCountriesCopyWithImpl(
      _$AppControllerEventFetchCountries _value,
      $Res Function(_$AppControllerEventFetchCountries) _then)
      : super(_value, (v) => _then(v as _$AppControllerEventFetchCountries));

  @override
  _$AppControllerEventFetchCountries get _value =>
      super._value as _$AppControllerEventFetchCountries;
}

/// @nodoc

class _$AppControllerEventFetchCountries
    implements AppControllerEventFetchCountries {
  const _$AppControllerEventFetchCountries();

  @override
  String toString() {
    return 'AppControllerEvent.fetchCountries()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppControllerEventFetchCountries);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CountryModal countryModal) updateCountry,
    required TResult Function(String currency) updateCurrency,
    required TResult Function() fetchCountries,
    required TResult Function(bool newStatus) setNotificationStatus,
    required TResult Function(List<CountryModal> data) addListOfCountries,
  }) {
    return fetchCountries();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
  }) {
    return fetchCountries?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
    required TResult orElse(),
  }) {
    if (fetchCountries != null) {
      return fetchCountries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(UpdateCountry value) updateCountry,
    required TResult Function(AppControllerEventupdateCurrency value)
        updateCurrency,
    required TResult Function(AppControllerEventFetchCountries value)
        fetchCountries,
    required TResult Function(AppControllerEventSetNotificationStatus value)
        setNotificationStatus,
    required TResult Function(AppControllerEventaddListOfCountries value)
        addListOfCountries,
  }) {
    return fetchCountries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
  }) {
    return fetchCountries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
    required TResult orElse(),
  }) {
    if (fetchCountries != null) {
      return fetchCountries(this);
    }
    return orElse();
  }
}

abstract class AppControllerEventFetchCountries implements AppControllerEvent {
  const factory AppControllerEventFetchCountries() =
      _$AppControllerEventFetchCountries;
}

/// @nodoc
abstract class _$$AppControllerEventSetNotificationStatusCopyWith<$Res> {
  factory _$$AppControllerEventSetNotificationStatusCopyWith(
          _$AppControllerEventSetNotificationStatus value,
          $Res Function(_$AppControllerEventSetNotificationStatus) then) =
      __$$AppControllerEventSetNotificationStatusCopyWithImpl<$Res>;
  $Res call({bool newStatus});
}

/// @nodoc
class __$$AppControllerEventSetNotificationStatusCopyWithImpl<$Res>
    extends _$AppControllerEventCopyWithImpl<$Res>
    implements _$$AppControllerEventSetNotificationStatusCopyWith<$Res> {
  __$$AppControllerEventSetNotificationStatusCopyWithImpl(
      _$AppControllerEventSetNotificationStatus _value,
      $Res Function(_$AppControllerEventSetNotificationStatus) _then)
      : super(_value,
            (v) => _then(v as _$AppControllerEventSetNotificationStatus));

  @override
  _$AppControllerEventSetNotificationStatus get _value =>
      super._value as _$AppControllerEventSetNotificationStatus;

  @override
  $Res call({
    Object? newStatus = freezed,
  }) {
    return _then(_$AppControllerEventSetNotificationStatus(
      newStatus == freezed
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppControllerEventSetNotificationStatus
    implements AppControllerEventSetNotificationStatus {
  const _$AppControllerEventSetNotificationStatus(this.newStatus);

  @override
  final bool newStatus;

  @override
  String toString() {
    return 'AppControllerEvent.setNotificationStatus(newStatus: $newStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppControllerEventSetNotificationStatus &&
            const DeepCollectionEquality().equals(other.newStatus, newStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newStatus));

  @JsonKey(ignore: true)
  @override
  _$$AppControllerEventSetNotificationStatusCopyWith<
          _$AppControllerEventSetNotificationStatus>
      get copyWith => __$$AppControllerEventSetNotificationStatusCopyWithImpl<
          _$AppControllerEventSetNotificationStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CountryModal countryModal) updateCountry,
    required TResult Function(String currency) updateCurrency,
    required TResult Function() fetchCountries,
    required TResult Function(bool newStatus) setNotificationStatus,
    required TResult Function(List<CountryModal> data) addListOfCountries,
  }) {
    return setNotificationStatus(newStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
  }) {
    return setNotificationStatus?.call(newStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
    required TResult orElse(),
  }) {
    if (setNotificationStatus != null) {
      return setNotificationStatus(newStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(UpdateCountry value) updateCountry,
    required TResult Function(AppControllerEventupdateCurrency value)
        updateCurrency,
    required TResult Function(AppControllerEventFetchCountries value)
        fetchCountries,
    required TResult Function(AppControllerEventSetNotificationStatus value)
        setNotificationStatus,
    required TResult Function(AppControllerEventaddListOfCountries value)
        addListOfCountries,
  }) {
    return setNotificationStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
  }) {
    return setNotificationStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
    required TResult orElse(),
  }) {
    if (setNotificationStatus != null) {
      return setNotificationStatus(this);
    }
    return orElse();
  }
}

abstract class AppControllerEventSetNotificationStatus
    implements AppControllerEvent {
  const factory AppControllerEventSetNotificationStatus(final bool newStatus) =
      _$AppControllerEventSetNotificationStatus;

  bool get newStatus;
  @JsonKey(ignore: true)
  _$$AppControllerEventSetNotificationStatusCopyWith<
          _$AppControllerEventSetNotificationStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppControllerEventaddListOfCountriesCopyWith<$Res> {
  factory _$$AppControllerEventaddListOfCountriesCopyWith(
          _$AppControllerEventaddListOfCountries value,
          $Res Function(_$AppControllerEventaddListOfCountries) then) =
      __$$AppControllerEventaddListOfCountriesCopyWithImpl<$Res>;
  $Res call({List<CountryModal> data});
}

/// @nodoc
class __$$AppControllerEventaddListOfCountriesCopyWithImpl<$Res>
    extends _$AppControllerEventCopyWithImpl<$Res>
    implements _$$AppControllerEventaddListOfCountriesCopyWith<$Res> {
  __$$AppControllerEventaddListOfCountriesCopyWithImpl(
      _$AppControllerEventaddListOfCountries _value,
      $Res Function(_$AppControllerEventaddListOfCountries) _then)
      : super(
            _value, (v) => _then(v as _$AppControllerEventaddListOfCountries));

  @override
  _$AppControllerEventaddListOfCountries get _value =>
      super._value as _$AppControllerEventaddListOfCountries;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AppControllerEventaddListOfCountries(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountryModal>,
    ));
  }
}

/// @nodoc

class _$AppControllerEventaddListOfCountries
    implements AppControllerEventaddListOfCountries {
  const _$AppControllerEventaddListOfCountries(final List<CountryModal> data)
      : _data = data;

  final List<CountryModal> _data;
  @override
  List<CountryModal> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AppControllerEvent.addListOfCountries(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppControllerEventaddListOfCountries &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$AppControllerEventaddListOfCountriesCopyWith<
          _$AppControllerEventaddListOfCountries>
      get copyWith => __$$AppControllerEventaddListOfCountriesCopyWithImpl<
          _$AppControllerEventaddListOfCountries>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CountryModal countryModal) updateCountry,
    required TResult Function(String currency) updateCurrency,
    required TResult Function() fetchCountries,
    required TResult Function(bool newStatus) setNotificationStatus,
    required TResult Function(List<CountryModal> data) addListOfCountries,
  }) {
    return addListOfCountries(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
  }) {
    return addListOfCountries?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CountryModal countryModal)? updateCountry,
    TResult Function(String currency)? updateCurrency,
    TResult Function()? fetchCountries,
    TResult Function(bool newStatus)? setNotificationStatus,
    TResult Function(List<CountryModal> data)? addListOfCountries,
    required TResult orElse(),
  }) {
    if (addListOfCountries != null) {
      return addListOfCountries(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(UpdateCountry value) updateCountry,
    required TResult Function(AppControllerEventupdateCurrency value)
        updateCurrency,
    required TResult Function(AppControllerEventFetchCountries value)
        fetchCountries,
    required TResult Function(AppControllerEventSetNotificationStatus value)
        setNotificationStatus,
    required TResult Function(AppControllerEventaddListOfCountries value)
        addListOfCountries,
  }) {
    return addListOfCountries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
  }) {
    return addListOfCountries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(UpdateCountry value)? updateCountry,
    TResult Function(AppControllerEventupdateCurrency value)? updateCurrency,
    TResult Function(AppControllerEventFetchCountries value)? fetchCountries,
    TResult Function(AppControllerEventSetNotificationStatus value)?
        setNotificationStatus,
    TResult Function(AppControllerEventaddListOfCountries value)?
        addListOfCountries,
    required TResult orElse(),
  }) {
    if (addListOfCountries != null) {
      return addListOfCountries(this);
    }
    return orElse();
  }
}

abstract class AppControllerEventaddListOfCountries
    implements AppControllerEvent {
  const factory AppControllerEventaddListOfCountries(
      final List<CountryModal> data) = _$AppControllerEventaddListOfCountries;

  List<CountryModal> get data;
  @JsonKey(ignore: true)
  _$$AppControllerEventaddListOfCountriesCopyWith<
          _$AppControllerEventaddListOfCountries>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppControllerState {
  CountryModal? get countryModal => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  List<CountryModal> get countries => throw _privateConstructorUsedError;
  AppControllerEventsType? get appControllerEventsType =>
      throw _privateConstructorUsedError;
  List<CurrencyAndSymbol> get currencyList =>
      throw _privateConstructorUsedError;
  AppCustomSettings get appCustomSettings => throw _privateConstructorUsedError;
  bool get buildApp => throw _privateConstructorUsedError;
  bool get showSnackBar => throw _privateConstructorUsedError;
  AppLevelSnackBar get appLevelSnackBar => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CountryModal? countryModal,
            bool isLoading,
            String currency,
            List<CountryModal> countries,
            AppControllerEventsType? appControllerEventsType,
            List<CurrencyAndSymbol> currencyList,
            AppCustomSettings appCustomSettings,
            bool buildApp,
            bool showSnackBar,
            AppLevelSnackBar appLevelSnackBar)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CountryModal? countryModal,
            bool isLoading,
            String currency,
            List<CountryModal> countries,
            AppControllerEventsType? appControllerEventsType,
            List<CurrencyAndSymbol> currencyList,
            AppCustomSettings appCustomSettings,
            bool buildApp,
            bool showSnackBar,
            AppLevelSnackBar appLevelSnackBar)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CountryModal? countryModal,
            bool isLoading,
            String currency,
            List<CountryModal> countries,
            AppControllerEventsType? appControllerEventsType,
            List<CurrencyAndSymbol> currencyList,
            AppCustomSettings appCustomSettings,
            bool buildApp,
            bool showSnackBar,
            AppLevelSnackBar appLevelSnackBar)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAppControllerState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAppControllerState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAppControllerState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppControllerStateCopyWith<AppControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppControllerStateCopyWith<$Res> {
  factory $AppControllerStateCopyWith(
          AppControllerState value, $Res Function(AppControllerState) then) =
      _$AppControllerStateCopyWithImpl<$Res>;
  $Res call(
      {CountryModal? countryModal,
      bool isLoading,
      String currency,
      List<CountryModal> countries,
      AppControllerEventsType? appControllerEventsType,
      List<CurrencyAndSymbol> currencyList,
      AppCustomSettings appCustomSettings,
      bool buildApp,
      bool showSnackBar,
      AppLevelSnackBar appLevelSnackBar});
}

/// @nodoc
class _$AppControllerStateCopyWithImpl<$Res>
    implements $AppControllerStateCopyWith<$Res> {
  _$AppControllerStateCopyWithImpl(this._value, this._then);

  final AppControllerState _value;
  // ignore: unused_field
  final $Res Function(AppControllerState) _then;

  @override
  $Res call({
    Object? countryModal = freezed,
    Object? isLoading = freezed,
    Object? currency = freezed,
    Object? countries = freezed,
    Object? appControllerEventsType = freezed,
    Object? currencyList = freezed,
    Object? appCustomSettings = freezed,
    Object? buildApp = freezed,
    Object? showSnackBar = freezed,
    Object? appLevelSnackBar = freezed,
  }) {
    return _then(_value.copyWith(
      countryModal: countryModal == freezed
          ? _value.countryModal
          : countryModal // ignore: cast_nullable_to_non_nullable
              as CountryModal?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      countries: countries == freezed
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModal>,
      appControllerEventsType: appControllerEventsType == freezed
          ? _value.appControllerEventsType
          : appControllerEventsType // ignore: cast_nullable_to_non_nullable
              as AppControllerEventsType?,
      currencyList: currencyList == freezed
          ? _value.currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<CurrencyAndSymbol>,
      appCustomSettings: appCustomSettings == freezed
          ? _value.appCustomSettings
          : appCustomSettings // ignore: cast_nullable_to_non_nullable
              as AppCustomSettings,
      buildApp: buildApp == freezed
          ? _value.buildApp
          : buildApp // ignore: cast_nullable_to_non_nullable
              as bool,
      showSnackBar: showSnackBar == freezed
          ? _value.showSnackBar
          : showSnackBar // ignore: cast_nullable_to_non_nullable
              as bool,
      appLevelSnackBar: appLevelSnackBar == freezed
          ? _value.appLevelSnackBar
          : appLevelSnackBar // ignore: cast_nullable_to_non_nullable
              as AppLevelSnackBar,
    ));
  }
}

/// @nodoc
abstract class _$$InitialAppControllerStateCopyWith<$Res>
    implements $AppControllerStateCopyWith<$Res> {
  factory _$$InitialAppControllerStateCopyWith(
          _$InitialAppControllerState value,
          $Res Function(_$InitialAppControllerState) then) =
      __$$InitialAppControllerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CountryModal? countryModal,
      bool isLoading,
      String currency,
      List<CountryModal> countries,
      AppControllerEventsType? appControllerEventsType,
      List<CurrencyAndSymbol> currencyList,
      AppCustomSettings appCustomSettings,
      bool buildApp,
      bool showSnackBar,
      AppLevelSnackBar appLevelSnackBar});
}

/// @nodoc
class __$$InitialAppControllerStateCopyWithImpl<$Res>
    extends _$AppControllerStateCopyWithImpl<$Res>
    implements _$$InitialAppControllerStateCopyWith<$Res> {
  __$$InitialAppControllerStateCopyWithImpl(_$InitialAppControllerState _value,
      $Res Function(_$InitialAppControllerState) _then)
      : super(_value, (v) => _then(v as _$InitialAppControllerState));

  @override
  _$InitialAppControllerState get _value =>
      super._value as _$InitialAppControllerState;

  @override
  $Res call({
    Object? countryModal = freezed,
    Object? isLoading = freezed,
    Object? currency = freezed,
    Object? countries = freezed,
    Object? appControllerEventsType = freezed,
    Object? currencyList = freezed,
    Object? appCustomSettings = freezed,
    Object? buildApp = freezed,
    Object? showSnackBar = freezed,
    Object? appLevelSnackBar = freezed,
  }) {
    return _then(_$InitialAppControllerState(
      countryModal: countryModal == freezed
          ? _value.countryModal
          : countryModal // ignore: cast_nullable_to_non_nullable
              as CountryModal?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      countries: countries == freezed
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModal>,
      appControllerEventsType: appControllerEventsType == freezed
          ? _value.appControllerEventsType
          : appControllerEventsType // ignore: cast_nullable_to_non_nullable
              as AppControllerEventsType?,
      currencyList: currencyList == freezed
          ? _value._currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<CurrencyAndSymbol>,
      appCustomSettings: appCustomSettings == freezed
          ? _value.appCustomSettings
          : appCustomSettings // ignore: cast_nullable_to_non_nullable
              as AppCustomSettings,
      buildApp: buildApp == freezed
          ? _value.buildApp
          : buildApp // ignore: cast_nullable_to_non_nullable
              as bool,
      showSnackBar: showSnackBar == freezed
          ? _value.showSnackBar
          : showSnackBar // ignore: cast_nullable_to_non_nullable
              as bool,
      appLevelSnackBar: appLevelSnackBar == freezed
          ? _value.appLevelSnackBar
          : appLevelSnackBar // ignore: cast_nullable_to_non_nullable
              as AppLevelSnackBar,
    ));
  }
}

/// @nodoc

class _$InitialAppControllerState implements InitialAppControllerState {
  const _$InitialAppControllerState(
      {this.countryModal,
      required this.isLoading,
      required this.currency,
      required final List<CountryModal> countries,
      this.appControllerEventsType,
      required final List<CurrencyAndSymbol> currencyList,
      required this.appCustomSettings,
      required this.buildApp,
      required this.showSnackBar,
      required this.appLevelSnackBar})
      : _countries = countries,
        _currencyList = currencyList;

  @override
  final CountryModal? countryModal;
  @override
  final bool isLoading;
  @override
  final String currency;
  final List<CountryModal> _countries;
  @override
  List<CountryModal> get countries {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  final AppControllerEventsType? appControllerEventsType;
  final List<CurrencyAndSymbol> _currencyList;
  @override
  List<CurrencyAndSymbol> get currencyList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencyList);
  }

  @override
  final AppCustomSettings appCustomSettings;
  @override
  final bool buildApp;
  @override
  final bool showSnackBar;
  @override
  final AppLevelSnackBar appLevelSnackBar;

  @override
  String toString() {
    return 'AppControllerState.initial(countryModal: $countryModal, isLoading: $isLoading, currency: $currency, countries: $countries, appControllerEventsType: $appControllerEventsType, currencyList: $currencyList, appCustomSettings: $appCustomSettings, buildApp: $buildApp, showSnackBar: $showSnackBar, appLevelSnackBar: $appLevelSnackBar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialAppControllerState &&
            const DeepCollectionEquality()
                .equals(other.countryModal, countryModal) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality().equals(
                other.appControllerEventsType, appControllerEventsType) &&
            const DeepCollectionEquality()
                .equals(other._currencyList, _currencyList) &&
            const DeepCollectionEquality()
                .equals(other.appCustomSettings, appCustomSettings) &&
            const DeepCollectionEquality().equals(other.buildApp, buildApp) &&
            const DeepCollectionEquality()
                .equals(other.showSnackBar, showSnackBar) &&
            const DeepCollectionEquality()
                .equals(other.appLevelSnackBar, appLevelSnackBar));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(countryModal),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(appControllerEventsType),
      const DeepCollectionEquality().hash(_currencyList),
      const DeepCollectionEquality().hash(appCustomSettings),
      const DeepCollectionEquality().hash(buildApp),
      const DeepCollectionEquality().hash(showSnackBar),
      const DeepCollectionEquality().hash(appLevelSnackBar));

  @JsonKey(ignore: true)
  @override
  _$$InitialAppControllerStateCopyWith<_$InitialAppControllerState>
      get copyWith => __$$InitialAppControllerStateCopyWithImpl<
          _$InitialAppControllerState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CountryModal? countryModal,
            bool isLoading,
            String currency,
            List<CountryModal> countries,
            AppControllerEventsType? appControllerEventsType,
            List<CurrencyAndSymbol> currencyList,
            AppCustomSettings appCustomSettings,
            bool buildApp,
            bool showSnackBar,
            AppLevelSnackBar appLevelSnackBar)
        initial,
  }) {
    return initial(
        countryModal,
        isLoading,
        currency,
        countries,
        appControllerEventsType,
        currencyList,
        appCustomSettings,
        buildApp,
        showSnackBar,
        appLevelSnackBar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CountryModal? countryModal,
            bool isLoading,
            String currency,
            List<CountryModal> countries,
            AppControllerEventsType? appControllerEventsType,
            List<CurrencyAndSymbol> currencyList,
            AppCustomSettings appCustomSettings,
            bool buildApp,
            bool showSnackBar,
            AppLevelSnackBar appLevelSnackBar)?
        initial,
  }) {
    return initial?.call(
        countryModal,
        isLoading,
        currency,
        countries,
        appControllerEventsType,
        currencyList,
        appCustomSettings,
        buildApp,
        showSnackBar,
        appLevelSnackBar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CountryModal? countryModal,
            bool isLoading,
            String currency,
            List<CountryModal> countries,
            AppControllerEventsType? appControllerEventsType,
            List<CurrencyAndSymbol> currencyList,
            AppCustomSettings appCustomSettings,
            bool buildApp,
            bool showSnackBar,
            AppLevelSnackBar appLevelSnackBar)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          countryModal,
          isLoading,
          currency,
          countries,
          appControllerEventsType,
          currencyList,
          appCustomSettings,
          buildApp,
          showSnackBar,
          appLevelSnackBar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAppControllerState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAppControllerState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAppControllerState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAppControllerState implements AppControllerState {
  const factory InitialAppControllerState(
          {final CountryModal? countryModal,
          required final bool isLoading,
          required final String currency,
          required final List<CountryModal> countries,
          final AppControllerEventsType? appControllerEventsType,
          required final List<CurrencyAndSymbol> currencyList,
          required final AppCustomSettings appCustomSettings,
          required final bool buildApp,
          required final bool showSnackBar,
          required final AppLevelSnackBar appLevelSnackBar}) =
      _$InitialAppControllerState;

  @override
  CountryModal? get countryModal;
  @override
  bool get isLoading;
  @override
  String get currency;
  @override
  List<CountryModal> get countries;
  @override
  AppControllerEventsType? get appControllerEventsType;
  @override
  List<CurrencyAndSymbol> get currencyList;
  @override
  AppCustomSettings get appCustomSettings;
  @override
  bool get buildApp;
  @override
  bool get showSnackBar;
  @override
  AppLevelSnackBar get appLevelSnackBar;
  @override
  @JsonKey(ignore: true)
  _$$InitialAppControllerStateCopyWith<_$InitialAppControllerState>
      get copyWith => throw _privateConstructorUsedError;
}
