// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(InternetState internetState) connectionChanged,
    required TResult Function(AuthState authState) authStateChanged,
    required TResult Function(bool newState) setPageState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SplashEventConnectionChange value)
        connectionChanged,
    required TResult Function(SplashEventAuthChange value) authStateChanged,
    required TResult Function(SplashEventSetPageState value) setPageState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashEventCopyWith<$Res> {
  factory $SplashEventCopyWith(
          SplashEvent value, $Res Function(SplashEvent) then) =
      _$SplashEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SplashEventCopyWithImpl<$Res> implements $SplashEventCopyWith<$Res> {
  _$SplashEventCopyWithImpl(this._value, this._then);

  final SplashEvent _value;
  // ignore: unused_field
  final $Res Function(SplashEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$SplashEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'SplashEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(InternetState internetState) connectionChanged,
    required TResult Function(AuthState authState) authStateChanged,
    required TResult Function(bool newState) setPageState,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
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
    required TResult Function(_Started value) started,
    required TResult Function(SplashEventConnectionChange value)
        connectionChanged,
    required TResult Function(SplashEventAuthChange value) authStateChanged,
    required TResult Function(SplashEventSetPageState value) setPageState,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SplashEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$SplashEventConnectionChangeCopyWith<$Res> {
  factory _$$SplashEventConnectionChangeCopyWith(
          _$SplashEventConnectionChange value,
          $Res Function(_$SplashEventConnectionChange) then) =
      __$$SplashEventConnectionChangeCopyWithImpl<$Res>;
  $Res call({InternetState internetState});
}

/// @nodoc
class __$$SplashEventConnectionChangeCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res>
    implements _$$SplashEventConnectionChangeCopyWith<$Res> {
  __$$SplashEventConnectionChangeCopyWithImpl(
      _$SplashEventConnectionChange _value,
      $Res Function(_$SplashEventConnectionChange) _then)
      : super(_value, (v) => _then(v as _$SplashEventConnectionChange));

  @override
  _$SplashEventConnectionChange get _value =>
      super._value as _$SplashEventConnectionChange;

  @override
  $Res call({
    Object? internetState = freezed,
  }) {
    return _then(_$SplashEventConnectionChange(
      internetState: internetState == freezed
          ? _value.internetState
          : internetState // ignore: cast_nullable_to_non_nullable
              as InternetState,
    ));
  }
}

/// @nodoc

class _$SplashEventConnectionChange implements SplashEventConnectionChange {
  const _$SplashEventConnectionChange({required this.internetState});

  @override
  final InternetState internetState;

  @override
  String toString() {
    return 'SplashEvent.connectionChanged(internetState: $internetState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashEventConnectionChange &&
            const DeepCollectionEquality()
                .equals(other.internetState, internetState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(internetState));

  @JsonKey(ignore: true)
  @override
  _$$SplashEventConnectionChangeCopyWith<_$SplashEventConnectionChange>
      get copyWith => __$$SplashEventConnectionChangeCopyWithImpl<
          _$SplashEventConnectionChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(InternetState internetState) connectionChanged,
    required TResult Function(AuthState authState) authStateChanged,
    required TResult Function(bool newState) setPageState,
  }) {
    return connectionChanged(internetState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
  }) {
    return connectionChanged?.call(internetState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
    required TResult orElse(),
  }) {
    if (connectionChanged != null) {
      return connectionChanged(internetState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SplashEventConnectionChange value)
        connectionChanged,
    required TResult Function(SplashEventAuthChange value) authStateChanged,
    required TResult Function(SplashEventSetPageState value) setPageState,
  }) {
    return connectionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
  }) {
    return connectionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
    required TResult orElse(),
  }) {
    if (connectionChanged != null) {
      return connectionChanged(this);
    }
    return orElse();
  }
}

abstract class SplashEventConnectionChange implements SplashEvent {
  const factory SplashEventConnectionChange(
          {required final InternetState internetState}) =
      _$SplashEventConnectionChange;

  InternetState get internetState;
  @JsonKey(ignore: true)
  _$$SplashEventConnectionChangeCopyWith<_$SplashEventConnectionChange>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SplashEventAuthChangeCopyWith<$Res> {
  factory _$$SplashEventAuthChangeCopyWith(_$SplashEventAuthChange value,
          $Res Function(_$SplashEventAuthChange) then) =
      __$$SplashEventAuthChangeCopyWithImpl<$Res>;
  $Res call({AuthState authState});

  $AuthStateCopyWith<$Res> get authState;
}

/// @nodoc
class __$$SplashEventAuthChangeCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res>
    implements _$$SplashEventAuthChangeCopyWith<$Res> {
  __$$SplashEventAuthChangeCopyWithImpl(_$SplashEventAuthChange _value,
      $Res Function(_$SplashEventAuthChange) _then)
      : super(_value, (v) => _then(v as _$SplashEventAuthChange));

  @override
  _$SplashEventAuthChange get _value => super._value as _$SplashEventAuthChange;

  @override
  $Res call({
    Object? authState = freezed,
  }) {
    return _then(_$SplashEventAuthChange(
      authState: authState == freezed
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState,
    ));
  }

  @override
  $AuthStateCopyWith<$Res> get authState {
    return $AuthStateCopyWith<$Res>(_value.authState, (value) {
      return _then(_value.copyWith(authState: value));
    });
  }
}

/// @nodoc

class _$SplashEventAuthChange implements SplashEventAuthChange {
  const _$SplashEventAuthChange({required this.authState});

  @override
  final AuthState authState;

  @override
  String toString() {
    return 'SplashEvent.authStateChanged(authState: $authState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashEventAuthChange &&
            const DeepCollectionEquality().equals(other.authState, authState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(authState));

  @JsonKey(ignore: true)
  @override
  _$$SplashEventAuthChangeCopyWith<_$SplashEventAuthChange> get copyWith =>
      __$$SplashEventAuthChangeCopyWithImpl<_$SplashEventAuthChange>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(InternetState internetState) connectionChanged,
    required TResult Function(AuthState authState) authStateChanged,
    required TResult Function(bool newState) setPageState,
  }) {
    return authStateChanged(authState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
  }) {
    return authStateChanged?.call(authState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(authState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SplashEventConnectionChange value)
        connectionChanged,
    required TResult Function(SplashEventAuthChange value) authStateChanged,
    required TResult Function(SplashEventSetPageState value) setPageState,
  }) {
    return authStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
  }) {
    return authStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(this);
    }
    return orElse();
  }
}

abstract class SplashEventAuthChange implements SplashEvent {
  const factory SplashEventAuthChange({required final AuthState authState}) =
      _$SplashEventAuthChange;

  AuthState get authState;
  @JsonKey(ignore: true)
  _$$SplashEventAuthChangeCopyWith<_$SplashEventAuthChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SplashEventSetPageStateCopyWith<$Res> {
  factory _$$SplashEventSetPageStateCopyWith(_$SplashEventSetPageState value,
          $Res Function(_$SplashEventSetPageState) then) =
      __$$SplashEventSetPageStateCopyWithImpl<$Res>;
  $Res call({bool newState});
}

/// @nodoc
class __$$SplashEventSetPageStateCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res>
    implements _$$SplashEventSetPageStateCopyWith<$Res> {
  __$$SplashEventSetPageStateCopyWithImpl(_$SplashEventSetPageState _value,
      $Res Function(_$SplashEventSetPageState) _then)
      : super(_value, (v) => _then(v as _$SplashEventSetPageState));

  @override
  _$SplashEventSetPageState get _value =>
      super._value as _$SplashEventSetPageState;

  @override
  $Res call({
    Object? newState = freezed,
  }) {
    return _then(_$SplashEventSetPageState(
      newState: newState == freezed
          ? _value.newState
          : newState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SplashEventSetPageState implements SplashEventSetPageState {
  const _$SplashEventSetPageState({required this.newState});

  @override
  final bool newState;

  @override
  String toString() {
    return 'SplashEvent.setPageState(newState: $newState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashEventSetPageState &&
            const DeepCollectionEquality().equals(other.newState, newState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newState));

  @JsonKey(ignore: true)
  @override
  _$$SplashEventSetPageStateCopyWith<_$SplashEventSetPageState> get copyWith =>
      __$$SplashEventSetPageStateCopyWithImpl<_$SplashEventSetPageState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(InternetState internetState) connectionChanged,
    required TResult Function(AuthState authState) authStateChanged,
    required TResult Function(bool newState) setPageState,
  }) {
    return setPageState(newState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
  }) {
    return setPageState?.call(newState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(InternetState internetState)? connectionChanged,
    TResult Function(AuthState authState)? authStateChanged,
    TResult Function(bool newState)? setPageState,
    required TResult orElse(),
  }) {
    if (setPageState != null) {
      return setPageState(newState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SplashEventConnectionChange value)
        connectionChanged,
    required TResult Function(SplashEventAuthChange value) authStateChanged,
    required TResult Function(SplashEventSetPageState value) setPageState,
  }) {
    return setPageState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
  }) {
    return setPageState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SplashEventConnectionChange value)? connectionChanged,
    TResult Function(SplashEventAuthChange value)? authStateChanged,
    TResult Function(SplashEventSetPageState value)? setPageState,
    required TResult orElse(),
  }) {
    if (setPageState != null) {
      return setPageState(this);
    }
    return orElse();
  }
}

abstract class SplashEventSetPageState implements SplashEvent {
  const factory SplashEventSetPageState({required final bool newState}) =
      _$SplashEventSetPageState;

  bool get newState;
  @JsonKey(ignore: true)
  _$$SplashEventSetPageStateCopyWith<_$SplashEventSetPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SplashState {
  AuthState get authState => throw _privateConstructorUsedError;
  InternetState get internetState => throw _privateConstructorUsedError;
  bool get isPageActive => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            AuthState authState, InternetState internetState, bool isPageActive)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthState authState, InternetState internetState,
            bool isPageActive)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthState authState, InternetState internetState,
            bool isPageActive)?
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
  $SplashStateCopyWith<SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res>;
  $Res call(
      {AuthState authState, InternetState internetState, bool isPageActive});

  $AuthStateCopyWith<$Res> get authState;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res> implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  final SplashState _value;
  // ignore: unused_field
  final $Res Function(SplashState) _then;

  @override
  $Res call({
    Object? authState = freezed,
    Object? internetState = freezed,
    Object? isPageActive = freezed,
  }) {
    return _then(_value.copyWith(
      authState: authState == freezed
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState,
      internetState: internetState == freezed
          ? _value.internetState
          : internetState // ignore: cast_nullable_to_non_nullable
              as InternetState,
      isPageActive: isPageActive == freezed
          ? _value.isPageActive
          : isPageActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AuthStateCopyWith<$Res> get authState {
    return $AuthStateCopyWith<$Res>(_value.authState, (value) {
      return _then(_value.copyWith(authState: value));
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthState authState, InternetState internetState, bool isPageActive});

  @override
  $AuthStateCopyWith<$Res> get authState;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? authState = freezed,
    Object? internetState = freezed,
    Object? isPageActive = freezed,
  }) {
    return _then(_$_Initial(
      authState: authState == freezed
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState,
      internetState: internetState == freezed
          ? _value.internetState
          : internetState // ignore: cast_nullable_to_non_nullable
              as InternetState,
      isPageActive: isPageActive == freezed
          ? _value.isPageActive
          : isPageActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.authState,
      required this.internetState,
      required this.isPageActive});

  @override
  final AuthState authState;
  @override
  final InternetState internetState;
  @override
  final bool isPageActive;

  @override
  String toString() {
    return 'SplashState.initial(authState: $authState, internetState: $internetState, isPageActive: $isPageActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.authState, authState) &&
            const DeepCollectionEquality()
                .equals(other.internetState, internetState) &&
            const DeepCollectionEquality()
                .equals(other.isPageActive, isPageActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authState),
      const DeepCollectionEquality().hash(internetState),
      const DeepCollectionEquality().hash(isPageActive));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            AuthState authState, InternetState internetState, bool isPageActive)
        initial,
  }) {
    return initial(authState, internetState, isPageActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthState authState, InternetState internetState,
            bool isPageActive)?
        initial,
  }) {
    return initial?.call(authState, internetState, isPageActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthState authState, InternetState internetState,
            bool isPageActive)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(authState, internetState, isPageActive);
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

abstract class _Initial implements SplashState {
  const factory _Initial(
      {required final AuthState authState,
      required final InternetState internetState,
      required final bool isPageActive}) = _$_Initial;

  @override
  AuthState get authState;
  @override
  InternetState get internetState;
  @override
  bool get isPageActive;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
