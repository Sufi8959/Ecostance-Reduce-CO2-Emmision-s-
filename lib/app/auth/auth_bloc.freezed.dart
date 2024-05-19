// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        loggedIn,
    required TResult Function() statusChanged,
    required TResult Function() logoutRequested,
    required TResult Function() verifyCurrentStateToken,
    required TResult Function(String verificationStatus) setVerified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(AuthLoggedIn value) loggedIn,
    required TResult Function(AuthEventStatusChanged value) statusChanged,
    required TResult Function(AuthEventLogoutRequested value) logoutRequested,
    required TResult Function(AuthEventVerifyCurrentStateToken value)
        verifyCurrentStateToken,
    required TResult Function(AuthEventSetVerified value) setVerified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$$AppStartedCopyWith<$Res> {
  factory _$$AppStartedCopyWith(
          _$AppStarted value, $Res Function(_$AppStarted) then) =
      __$$AppStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppStartedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AppStartedCopyWith<$Res> {
  __$$AppStartedCopyWithImpl(
      _$AppStarted _value, $Res Function(_$AppStarted) _then)
      : super(_value, (v) => _then(v as _$AppStarted));

  @override
  _$AppStarted get _value => super._value as _$AppStarted;
}

/// @nodoc

class _$AppStarted implements AppStarted {
  const _$AppStarted();

  @override
  String toString() {
    return 'AuthEvent.appStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        loggedIn,
    required TResult Function() statusChanged,
    required TResult Function() logoutRequested,
    required TResult Function() verifyCurrentStateToken,
    required TResult Function(String verificationStatus) setVerified,
  }) {
    return appStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
  }) {
    return appStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
    required TResult orElse(),
  }) {
    if (appStarted != null) {
      return appStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(AuthLoggedIn value) loggedIn,
    required TResult Function(AuthEventStatusChanged value) statusChanged,
    required TResult Function(AuthEventLogoutRequested value) logoutRequested,
    required TResult Function(AuthEventVerifyCurrentStateToken value)
        verifyCurrentStateToken,
    required TResult Function(AuthEventSetVerified value) setVerified,
  }) {
    return appStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
  }) {
    return appStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
    required TResult orElse(),
  }) {
    if (appStarted != null) {
      return appStarted(this);
    }
    return orElse();
  }
}

abstract class AppStarted implements AuthEvent {
  const factory AppStarted() = _$AppStarted;
}

/// @nodoc
abstract class _$$AuthLoggedInCopyWith<$Res> {
  factory _$$AuthLoggedInCopyWith(
          _$AuthLoggedIn value, $Res Function(_$AuthLoggedIn) then) =
      __$$AuthLoggedInCopyWithImpl<$Res>;
  $Res call({AuthDataModal authDataModal, bool shouldSyncLocalCartToServer});
}

/// @nodoc
class __$$AuthLoggedInCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthLoggedInCopyWith<$Res> {
  __$$AuthLoggedInCopyWithImpl(
      _$AuthLoggedIn _value, $Res Function(_$AuthLoggedIn) _then)
      : super(_value, (v) => _then(v as _$AuthLoggedIn));

  @override
  _$AuthLoggedIn get _value => super._value as _$AuthLoggedIn;

  @override
  $Res call({
    Object? authDataModal = freezed,
    Object? shouldSyncLocalCartToServer = freezed,
  }) {
    return _then(_$AuthLoggedIn(
      authDataModal: authDataModal == freezed
          ? _value.authDataModal
          : authDataModal // ignore: cast_nullable_to_non_nullable
              as AuthDataModal,
      shouldSyncLocalCartToServer: shouldSyncLocalCartToServer == freezed
          ? _value.shouldSyncLocalCartToServer
          : shouldSyncLocalCartToServer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthLoggedIn implements AuthLoggedIn {
  const _$AuthLoggedIn(
      {required this.authDataModal, required this.shouldSyncLocalCartToServer});

  @override
  final AuthDataModal authDataModal;
  @override
  final bool shouldSyncLocalCartToServer;

  @override
  String toString() {
    return 'AuthEvent.loggedIn(authDataModal: $authDataModal, shouldSyncLocalCartToServer: $shouldSyncLocalCartToServer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoggedIn &&
            const DeepCollectionEquality()
                .equals(other.authDataModal, authDataModal) &&
            const DeepCollectionEquality().equals(
                other.shouldSyncLocalCartToServer,
                shouldSyncLocalCartToServer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authDataModal),
      const DeepCollectionEquality().hash(shouldSyncLocalCartToServer));

  @JsonKey(ignore: true)
  @override
  _$$AuthLoggedInCopyWith<_$AuthLoggedIn> get copyWith =>
      __$$AuthLoggedInCopyWithImpl<_$AuthLoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        loggedIn,
    required TResult Function() statusChanged,
    required TResult Function() logoutRequested,
    required TResult Function() verifyCurrentStateToken,
    required TResult Function(String verificationStatus) setVerified,
  }) {
    return loggedIn(authDataModal, shouldSyncLocalCartToServer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
  }) {
    return loggedIn?.call(authDataModal, shouldSyncLocalCartToServer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(authDataModal, shouldSyncLocalCartToServer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(AuthLoggedIn value) loggedIn,
    required TResult Function(AuthEventStatusChanged value) statusChanged,
    required TResult Function(AuthEventLogoutRequested value) logoutRequested,
    required TResult Function(AuthEventVerifyCurrentStateToken value)
        verifyCurrentStateToken,
    required TResult Function(AuthEventSetVerified value) setVerified,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class AuthLoggedIn implements AuthEvent {
  const factory AuthLoggedIn(
      {required final AuthDataModal authDataModal,
      required final bool shouldSyncLocalCartToServer}) = _$AuthLoggedIn;

  AuthDataModal get authDataModal;
  bool get shouldSyncLocalCartToServer;
  @JsonKey(ignore: true)
  _$$AuthLoggedInCopyWith<_$AuthLoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventStatusChangedCopyWith<$Res> {
  factory _$$AuthEventStatusChangedCopyWith(_$AuthEventStatusChanged value,
          $Res Function(_$AuthEventStatusChanged) then) =
      __$$AuthEventStatusChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventStatusChangedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthEventStatusChangedCopyWith<$Res> {
  __$$AuthEventStatusChangedCopyWithImpl(_$AuthEventStatusChanged _value,
      $Res Function(_$AuthEventStatusChanged) _then)
      : super(_value, (v) => _then(v as _$AuthEventStatusChanged));

  @override
  _$AuthEventStatusChanged get _value =>
      super._value as _$AuthEventStatusChanged;
}

/// @nodoc

class _$AuthEventStatusChanged implements AuthEventStatusChanged {
  const _$AuthEventStatusChanged();

  @override
  String toString() {
    return 'AuthEvent.statusChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventStatusChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        loggedIn,
    required TResult Function() statusChanged,
    required TResult Function() logoutRequested,
    required TResult Function() verifyCurrentStateToken,
    required TResult Function(String verificationStatus) setVerified,
  }) {
    return statusChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
  }) {
    return statusChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(AuthLoggedIn value) loggedIn,
    required TResult Function(AuthEventStatusChanged value) statusChanged,
    required TResult Function(AuthEventLogoutRequested value) logoutRequested,
    required TResult Function(AuthEventVerifyCurrentStateToken value)
        verifyCurrentStateToken,
    required TResult Function(AuthEventSetVerified value) setVerified,
  }) {
    return statusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
  }) {
    return statusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(this);
    }
    return orElse();
  }
}

abstract class AuthEventStatusChanged implements AuthEvent {
  const factory AuthEventStatusChanged() = _$AuthEventStatusChanged;
}

/// @nodoc
abstract class _$$AuthEventLogoutRequestedCopyWith<$Res> {
  factory _$$AuthEventLogoutRequestedCopyWith(_$AuthEventLogoutRequested value,
          $Res Function(_$AuthEventLogoutRequested) then) =
      __$$AuthEventLogoutRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventLogoutRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthEventLogoutRequestedCopyWith<$Res> {
  __$$AuthEventLogoutRequestedCopyWithImpl(_$AuthEventLogoutRequested _value,
      $Res Function(_$AuthEventLogoutRequested) _then)
      : super(_value, (v) => _then(v as _$AuthEventLogoutRequested));

  @override
  _$AuthEventLogoutRequested get _value =>
      super._value as _$AuthEventLogoutRequested;
}

/// @nodoc

class _$AuthEventLogoutRequested implements AuthEventLogoutRequested {
  const _$AuthEventLogoutRequested();

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventLogoutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        loggedIn,
    required TResult Function() statusChanged,
    required TResult Function() logoutRequested,
    required TResult Function() verifyCurrentStateToken,
    required TResult Function(String verificationStatus) setVerified,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(AuthLoggedIn value) loggedIn,
    required TResult Function(AuthEventStatusChanged value) statusChanged,
    required TResult Function(AuthEventLogoutRequested value) logoutRequested,
    required TResult Function(AuthEventVerifyCurrentStateToken value)
        verifyCurrentStateToken,
    required TResult Function(AuthEventSetVerified value) setVerified,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class AuthEventLogoutRequested implements AuthEvent {
  const factory AuthEventLogoutRequested() = _$AuthEventLogoutRequested;
}

/// @nodoc
abstract class _$$AuthEventVerifyCurrentStateTokenCopyWith<$Res> {
  factory _$$AuthEventVerifyCurrentStateTokenCopyWith(
          _$AuthEventVerifyCurrentStateToken value,
          $Res Function(_$AuthEventVerifyCurrentStateToken) then) =
      __$$AuthEventVerifyCurrentStateTokenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventVerifyCurrentStateTokenCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthEventVerifyCurrentStateTokenCopyWith<$Res> {
  __$$AuthEventVerifyCurrentStateTokenCopyWithImpl(
      _$AuthEventVerifyCurrentStateToken _value,
      $Res Function(_$AuthEventVerifyCurrentStateToken) _then)
      : super(_value, (v) => _then(v as _$AuthEventVerifyCurrentStateToken));

  @override
  _$AuthEventVerifyCurrentStateToken get _value =>
      super._value as _$AuthEventVerifyCurrentStateToken;
}

/// @nodoc

class _$AuthEventVerifyCurrentStateToken
    implements AuthEventVerifyCurrentStateToken {
  const _$AuthEventVerifyCurrentStateToken();

  @override
  String toString() {
    return 'AuthEvent.verifyCurrentStateToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventVerifyCurrentStateToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        loggedIn,
    required TResult Function() statusChanged,
    required TResult Function() logoutRequested,
    required TResult Function() verifyCurrentStateToken,
    required TResult Function(String verificationStatus) setVerified,
  }) {
    return verifyCurrentStateToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
  }) {
    return verifyCurrentStateToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
    required TResult orElse(),
  }) {
    if (verifyCurrentStateToken != null) {
      return verifyCurrentStateToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(AuthLoggedIn value) loggedIn,
    required TResult Function(AuthEventStatusChanged value) statusChanged,
    required TResult Function(AuthEventLogoutRequested value) logoutRequested,
    required TResult Function(AuthEventVerifyCurrentStateToken value)
        verifyCurrentStateToken,
    required TResult Function(AuthEventSetVerified value) setVerified,
  }) {
    return verifyCurrentStateToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
  }) {
    return verifyCurrentStateToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
    required TResult orElse(),
  }) {
    if (verifyCurrentStateToken != null) {
      return verifyCurrentStateToken(this);
    }
    return orElse();
  }
}

abstract class AuthEventVerifyCurrentStateToken implements AuthEvent {
  const factory AuthEventVerifyCurrentStateToken() =
      _$AuthEventVerifyCurrentStateToken;
}

/// @nodoc
abstract class _$$AuthEventSetVerifiedCopyWith<$Res> {
  factory _$$AuthEventSetVerifiedCopyWith(_$AuthEventSetVerified value,
          $Res Function(_$AuthEventSetVerified) then) =
      __$$AuthEventSetVerifiedCopyWithImpl<$Res>;
  $Res call({String verificationStatus});
}

/// @nodoc
class __$$AuthEventSetVerifiedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthEventSetVerifiedCopyWith<$Res> {
  __$$AuthEventSetVerifiedCopyWithImpl(_$AuthEventSetVerified _value,
      $Res Function(_$AuthEventSetVerified) _then)
      : super(_value, (v) => _then(v as _$AuthEventSetVerified));

  @override
  _$AuthEventSetVerified get _value => super._value as _$AuthEventSetVerified;

  @override
  $Res call({
    Object? verificationStatus = freezed,
  }) {
    return _then(_$AuthEventSetVerified(
      verificationStatus: verificationStatus == freezed
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthEventSetVerified implements AuthEventSetVerified {
  const _$AuthEventSetVerified({required this.verificationStatus});

  @override
  final String verificationStatus;

  @override
  String toString() {
    return 'AuthEvent.setVerified(verificationStatus: $verificationStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventSetVerified &&
            const DeepCollectionEquality()
                .equals(other.verificationStatus, verificationStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(verificationStatus));

  @JsonKey(ignore: true)
  @override
  _$$AuthEventSetVerifiedCopyWith<_$AuthEventSetVerified> get copyWith =>
      __$$AuthEventSetVerifiedCopyWithImpl<_$AuthEventSetVerified>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        loggedIn,
    required TResult Function() statusChanged,
    required TResult Function() logoutRequested,
    required TResult Function() verifyCurrentStateToken,
    required TResult Function(String verificationStatus) setVerified,
  }) {
    return setVerified(verificationStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
  }) {
    return setVerified?.call(verificationStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        loggedIn,
    TResult Function()? statusChanged,
    TResult Function()? logoutRequested,
    TResult Function()? verifyCurrentStateToken,
    TResult Function(String verificationStatus)? setVerified,
    required TResult orElse(),
  }) {
    if (setVerified != null) {
      return setVerified(verificationStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted value) appStarted,
    required TResult Function(AuthLoggedIn value) loggedIn,
    required TResult Function(AuthEventStatusChanged value) statusChanged,
    required TResult Function(AuthEventLogoutRequested value) logoutRequested,
    required TResult Function(AuthEventVerifyCurrentStateToken value)
        verifyCurrentStateToken,
    required TResult Function(AuthEventSetVerified value) setVerified,
  }) {
    return setVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
  }) {
    return setVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted value)? appStarted,
    TResult Function(AuthLoggedIn value)? loggedIn,
    TResult Function(AuthEventStatusChanged value)? statusChanged,
    TResult Function(AuthEventLogoutRequested value)? logoutRequested,
    TResult Function(AuthEventVerifyCurrentStateToken value)?
        verifyCurrentStateToken,
    TResult Function(AuthEventSetVerified value)? setVerified,
    required TResult orElse(),
  }) {
    if (setVerified != null) {
      return setVerified(this);
    }
    return orElse();
  }
}

abstract class AuthEventSetVerified implements AuthEvent {
  const factory AuthEventSetVerified(
      {required final String verificationStatus}) = _$AuthEventSetVerified;

  String get verificationStatus;
  @JsonKey(ignore: true)
  _$$AuthEventSetVerifiedCopyWith<_$AuthEventSetVerified> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthUnknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, (v) => _then(v as _$_AuthState));

  @override
  _$_AuthState get _value => super._value as _$_AuthState;
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState();

  @override
  String toString() {
    return 'AuthState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() unknown,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthUnknown value) unknown,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AuthState implements AuthState {
  const factory _AuthState() = _$_AuthState;
}

/// @nodoc
abstract class _$$AuthenticatedCopyWith<$Res> {
  factory _$$AuthenticatedCopyWith(
          _$Authenticated value, $Res Function(_$Authenticated) then) =
      __$$AuthenticatedCopyWithImpl<$Res>;
  $Res call({AuthDataModal authDataModal, bool shouldSyncLocalCartToServer});
}

/// @nodoc
class __$$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthenticatedCopyWith<$Res> {
  __$$AuthenticatedCopyWithImpl(
      _$Authenticated _value, $Res Function(_$Authenticated) _then)
      : super(_value, (v) => _then(v as _$Authenticated));

  @override
  _$Authenticated get _value => super._value as _$Authenticated;

  @override
  $Res call({
    Object? authDataModal = freezed,
    Object? shouldSyncLocalCartToServer = freezed,
  }) {
    return _then(_$Authenticated(
      authDataModal: authDataModal == freezed
          ? _value.authDataModal
          : authDataModal // ignore: cast_nullable_to_non_nullable
              as AuthDataModal,
      shouldSyncLocalCartToServer: shouldSyncLocalCartToServer == freezed
          ? _value.shouldSyncLocalCartToServer
          : shouldSyncLocalCartToServer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Authenticated implements Authenticated {
  const _$Authenticated(
      {required this.authDataModal, required this.shouldSyncLocalCartToServer});

  @override
  final AuthDataModal authDataModal;
  @override
  final bool shouldSyncLocalCartToServer;

  @override
  String toString() {
    return 'AuthState.authenticated(authDataModal: $authDataModal, shouldSyncLocalCartToServer: $shouldSyncLocalCartToServer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Authenticated &&
            const DeepCollectionEquality()
                .equals(other.authDataModal, authDataModal) &&
            const DeepCollectionEquality().equals(
                other.shouldSyncLocalCartToServer,
                shouldSyncLocalCartToServer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authDataModal),
      const DeepCollectionEquality().hash(shouldSyncLocalCartToServer));

  @JsonKey(ignore: true)
  @override
  _$$AuthenticatedCopyWith<_$Authenticated> get copyWith =>
      __$$AuthenticatedCopyWithImpl<_$Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() unknown,
  }) {
    return authenticated(authDataModal, shouldSyncLocalCartToServer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
  }) {
    return authenticated?.call(authDataModal, shouldSyncLocalCartToServer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(authDataModal, shouldSyncLocalCartToServer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthUnknown value) unknown,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated(
      {required final AuthDataModal authDataModal,
      required final bool shouldSyncLocalCartToServer}) = _$Authenticated;

  AuthDataModal get authDataModal;
  bool get shouldSyncLocalCartToServer;
  @JsonKey(ignore: true)
  _$$AuthenticatedCopyWith<_$Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedCopyWith<$Res> {
  factory _$$UnauthenticatedCopyWith(
          _$Unauthenticated value, $Res Function(_$Unauthenticated) then) =
      __$$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$UnauthenticatedCopyWith<$Res> {
  __$$UnauthenticatedCopyWithImpl(
      _$Unauthenticated _value, $Res Function(_$Unauthenticated) _then)
      : super(_value, (v) => _then(v as _$Unauthenticated));

  @override
  _$Unauthenticated get _value => super._value as _$Unauthenticated;
}

/// @nodoc

class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() unknown,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthUnknown value) unknown,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$Unauthenticated;
}

/// @nodoc
abstract class _$$AuthLoadingCopyWith<$Res> {
  factory _$$AuthLoadingCopyWith(
          _$AuthLoading value, $Res Function(_$AuthLoading) then) =
      __$$AuthLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthLoadingCopyWith<$Res> {
  __$$AuthLoadingCopyWithImpl(
      _$AuthLoading _value, $Res Function(_$AuthLoading) _then)
      : super(_value, (v) => _then(v as _$AuthLoading));

  @override
  _$AuthLoading get _value => super._value as _$AuthLoading;
}

/// @nodoc

class _$AuthLoading implements AuthLoading {
  const _$AuthLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() unknown,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthUnknown value) unknown,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  const factory AuthLoading() = _$AuthLoading;
}

/// @nodoc
abstract class _$$AuthUnknownCopyWith<$Res> {
  factory _$$AuthUnknownCopyWith(
          _$AuthUnknown value, $Res Function(_$AuthUnknown) then) =
      __$$AuthUnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnknownCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthUnknownCopyWith<$Res> {
  __$$AuthUnknownCopyWithImpl(
      _$AuthUnknown _value, $Res Function(_$AuthUnknown) _then)
      : super(_value, (v) => _then(v as _$AuthUnknown));

  @override
  _$AuthUnknown get _value => super._value as _$AuthUnknown;
}

/// @nodoc

class _$AuthUnknown implements AuthUnknown {
  const _$AuthUnknown();

  @override
  String toString() {
    return 'AuthState.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthUnknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            AuthDataModal authDataModal, bool shouldSyncLocalCartToServer)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthUnknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class AuthUnknown implements AuthState {
  const factory AuthUnknown() = _$AuthUnknown;
}
