// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest registerRequest)
        registerButtonPressed,
    required TResult Function(bool newVal) setNewsLetter,
    required TResult Function(bool newVal) setTerms,
    required TResult Function(String text, int strength) setPasswordStrength,
    required TResult Function(RegCurrentPage regCurrentPage) changePage,
    required TResult Function() setToInitial,
    required TResult Function() removeSnack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBlocEventregisterButtonPressed value)
        registerButtonPressed,
    required TResult Function(RegisterBlocEventsetNewsLetter value)
        setNewsLetter,
    required TResult Function(RegisterBlocEventsetTerms value) setTerms,
    required TResult Function(RegisterBlocEventsetPasswordStrength value)
        setPasswordStrength,
    required TResult Function(RegisterBlocEventchangePage value) changePage,
    required TResult Function(RegisterBlocEventsetToInitial value) setToInitial,
    required TResult Function(RegisterBlocEventremoveSnack value) removeSnack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterBlocEventCopyWith<$Res> {
  factory $RegisterBlocEventCopyWith(
          RegisterBlocEvent value, $Res Function(RegisterBlocEvent) then) =
      _$RegisterBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterBlocEventCopyWithImpl<$Res>
    implements $RegisterBlocEventCopyWith<$Res> {
  _$RegisterBlocEventCopyWithImpl(this._value, this._then);

  final RegisterBlocEvent _value;
  // ignore: unused_field
  final $Res Function(RegisterBlocEvent) _then;
}

/// @nodoc
abstract class _$$RegisterBlocEventregisterButtonPressedCopyWith<$Res> {
  factory _$$RegisterBlocEventregisterButtonPressedCopyWith(
          _$RegisterBlocEventregisterButtonPressed value,
          $Res Function(_$RegisterBlocEventregisterButtonPressed) then) =
      __$$RegisterBlocEventregisterButtonPressedCopyWithImpl<$Res>;
  $Res call({RegisterRequest registerRequest});
}

/// @nodoc
class __$$RegisterBlocEventregisterButtonPressedCopyWithImpl<$Res>
    extends _$RegisterBlocEventCopyWithImpl<$Res>
    implements _$$RegisterBlocEventregisterButtonPressedCopyWith<$Res> {
  __$$RegisterBlocEventregisterButtonPressedCopyWithImpl(
      _$RegisterBlocEventregisterButtonPressed _value,
      $Res Function(_$RegisterBlocEventregisterButtonPressed) _then)
      : super(_value,
            (v) => _then(v as _$RegisterBlocEventregisterButtonPressed));

  @override
  _$RegisterBlocEventregisterButtonPressed get _value =>
      super._value as _$RegisterBlocEventregisterButtonPressed;

  @override
  $Res call({
    Object? registerRequest = freezed,
  }) {
    return _then(_$RegisterBlocEventregisterButtonPressed(
      registerRequest: registerRequest == freezed
          ? _value.registerRequest
          : registerRequest // ignore: cast_nullable_to_non_nullable
              as RegisterRequest,
    ));
  }
}

/// @nodoc

class _$RegisterBlocEventregisterButtonPressed
    implements RegisterBlocEventregisterButtonPressed {
  const _$RegisterBlocEventregisterButtonPressed(
      {required this.registerRequest});

  @override
  final RegisterRequest registerRequest;

  @override
  String toString() {
    return 'RegisterBlocEvent.registerButtonPressed(registerRequest: $registerRequest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterBlocEventregisterButtonPressed &&
            const DeepCollectionEquality()
                .equals(other.registerRequest, registerRequest));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(registerRequest));

  @JsonKey(ignore: true)
  @override
  _$$RegisterBlocEventregisterButtonPressedCopyWith<
          _$RegisterBlocEventregisterButtonPressed>
      get copyWith => __$$RegisterBlocEventregisterButtonPressedCopyWithImpl<
          _$RegisterBlocEventregisterButtonPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest registerRequest)
        registerButtonPressed,
    required TResult Function(bool newVal) setNewsLetter,
    required TResult Function(bool newVal) setTerms,
    required TResult Function(String text, int strength) setPasswordStrength,
    required TResult Function(RegCurrentPage regCurrentPage) changePage,
    required TResult Function() setToInitial,
    required TResult Function() removeSnack,
  }) {
    return registerButtonPressed(registerRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
  }) {
    return registerButtonPressed?.call(registerRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
    required TResult orElse(),
  }) {
    if (registerButtonPressed != null) {
      return registerButtonPressed(registerRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBlocEventregisterButtonPressed value)
        registerButtonPressed,
    required TResult Function(RegisterBlocEventsetNewsLetter value)
        setNewsLetter,
    required TResult Function(RegisterBlocEventsetTerms value) setTerms,
    required TResult Function(RegisterBlocEventsetPasswordStrength value)
        setPasswordStrength,
    required TResult Function(RegisterBlocEventchangePage value) changePage,
    required TResult Function(RegisterBlocEventsetToInitial value) setToInitial,
    required TResult Function(RegisterBlocEventremoveSnack value) removeSnack,
  }) {
    return registerButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
  }) {
    return registerButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
    required TResult orElse(),
  }) {
    if (registerButtonPressed != null) {
      return registerButtonPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterBlocEventregisterButtonPressed
    implements RegisterBlocEvent {
  const factory RegisterBlocEventregisterButtonPressed(
          {required final RegisterRequest registerRequest}) =
      _$RegisterBlocEventregisterButtonPressed;

  RegisterRequest get registerRequest;
  @JsonKey(ignore: true)
  _$$RegisterBlocEventregisterButtonPressedCopyWith<
          _$RegisterBlocEventregisterButtonPressed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterBlocEventsetNewsLetterCopyWith<$Res> {
  factory _$$RegisterBlocEventsetNewsLetterCopyWith(
          _$RegisterBlocEventsetNewsLetter value,
          $Res Function(_$RegisterBlocEventsetNewsLetter) then) =
      __$$RegisterBlocEventsetNewsLetterCopyWithImpl<$Res>;
  $Res call({bool newVal});
}

/// @nodoc
class __$$RegisterBlocEventsetNewsLetterCopyWithImpl<$Res>
    extends _$RegisterBlocEventCopyWithImpl<$Res>
    implements _$$RegisterBlocEventsetNewsLetterCopyWith<$Res> {
  __$$RegisterBlocEventsetNewsLetterCopyWithImpl(
      _$RegisterBlocEventsetNewsLetter _value,
      $Res Function(_$RegisterBlocEventsetNewsLetter) _then)
      : super(_value, (v) => _then(v as _$RegisterBlocEventsetNewsLetter));

  @override
  _$RegisterBlocEventsetNewsLetter get _value =>
      super._value as _$RegisterBlocEventsetNewsLetter;

  @override
  $Res call({
    Object? newVal = freezed,
  }) {
    return _then(_$RegisterBlocEventsetNewsLetter(
      newVal == freezed
          ? _value.newVal
          : newVal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterBlocEventsetNewsLetter
    implements RegisterBlocEventsetNewsLetter {
  const _$RegisterBlocEventsetNewsLetter(this.newVal);

  @override
  final bool newVal;

  @override
  String toString() {
    return 'RegisterBlocEvent.setNewsLetter(newVal: $newVal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterBlocEventsetNewsLetter &&
            const DeepCollectionEquality().equals(other.newVal, newVal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newVal));

  @JsonKey(ignore: true)
  @override
  _$$RegisterBlocEventsetNewsLetterCopyWith<_$RegisterBlocEventsetNewsLetter>
      get copyWith => __$$RegisterBlocEventsetNewsLetterCopyWithImpl<
          _$RegisterBlocEventsetNewsLetter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest registerRequest)
        registerButtonPressed,
    required TResult Function(bool newVal) setNewsLetter,
    required TResult Function(bool newVal) setTerms,
    required TResult Function(String text, int strength) setPasswordStrength,
    required TResult Function(RegCurrentPage regCurrentPage) changePage,
    required TResult Function() setToInitial,
    required TResult Function() removeSnack,
  }) {
    return setNewsLetter(newVal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
  }) {
    return setNewsLetter?.call(newVal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
    required TResult orElse(),
  }) {
    if (setNewsLetter != null) {
      return setNewsLetter(newVal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBlocEventregisterButtonPressed value)
        registerButtonPressed,
    required TResult Function(RegisterBlocEventsetNewsLetter value)
        setNewsLetter,
    required TResult Function(RegisterBlocEventsetTerms value) setTerms,
    required TResult Function(RegisterBlocEventsetPasswordStrength value)
        setPasswordStrength,
    required TResult Function(RegisterBlocEventchangePage value) changePage,
    required TResult Function(RegisterBlocEventsetToInitial value) setToInitial,
    required TResult Function(RegisterBlocEventremoveSnack value) removeSnack,
  }) {
    return setNewsLetter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
  }) {
    return setNewsLetter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
    required TResult orElse(),
  }) {
    if (setNewsLetter != null) {
      return setNewsLetter(this);
    }
    return orElse();
  }
}

abstract class RegisterBlocEventsetNewsLetter implements RegisterBlocEvent {
  const factory RegisterBlocEventsetNewsLetter(final bool newVal) =
      _$RegisterBlocEventsetNewsLetter;

  bool get newVal;
  @JsonKey(ignore: true)
  _$$RegisterBlocEventsetNewsLetterCopyWith<_$RegisterBlocEventsetNewsLetter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterBlocEventsetTermsCopyWith<$Res> {
  factory _$$RegisterBlocEventsetTermsCopyWith(
          _$RegisterBlocEventsetTerms value,
          $Res Function(_$RegisterBlocEventsetTerms) then) =
      __$$RegisterBlocEventsetTermsCopyWithImpl<$Res>;
  $Res call({bool newVal});
}

/// @nodoc
class __$$RegisterBlocEventsetTermsCopyWithImpl<$Res>
    extends _$RegisterBlocEventCopyWithImpl<$Res>
    implements _$$RegisterBlocEventsetTermsCopyWith<$Res> {
  __$$RegisterBlocEventsetTermsCopyWithImpl(_$RegisterBlocEventsetTerms _value,
      $Res Function(_$RegisterBlocEventsetTerms) _then)
      : super(_value, (v) => _then(v as _$RegisterBlocEventsetTerms));

  @override
  _$RegisterBlocEventsetTerms get _value =>
      super._value as _$RegisterBlocEventsetTerms;

  @override
  $Res call({
    Object? newVal = freezed,
  }) {
    return _then(_$RegisterBlocEventsetTerms(
      newVal == freezed
          ? _value.newVal
          : newVal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterBlocEventsetTerms implements RegisterBlocEventsetTerms {
  const _$RegisterBlocEventsetTerms(this.newVal);

  @override
  final bool newVal;

  @override
  String toString() {
    return 'RegisterBlocEvent.setTerms(newVal: $newVal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterBlocEventsetTerms &&
            const DeepCollectionEquality().equals(other.newVal, newVal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newVal));

  @JsonKey(ignore: true)
  @override
  _$$RegisterBlocEventsetTermsCopyWith<_$RegisterBlocEventsetTerms>
      get copyWith => __$$RegisterBlocEventsetTermsCopyWithImpl<
          _$RegisterBlocEventsetTerms>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest registerRequest)
        registerButtonPressed,
    required TResult Function(bool newVal) setNewsLetter,
    required TResult Function(bool newVal) setTerms,
    required TResult Function(String text, int strength) setPasswordStrength,
    required TResult Function(RegCurrentPage regCurrentPage) changePage,
    required TResult Function() setToInitial,
    required TResult Function() removeSnack,
  }) {
    return setTerms(newVal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
  }) {
    return setTerms?.call(newVal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
    required TResult orElse(),
  }) {
    if (setTerms != null) {
      return setTerms(newVal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBlocEventregisterButtonPressed value)
        registerButtonPressed,
    required TResult Function(RegisterBlocEventsetNewsLetter value)
        setNewsLetter,
    required TResult Function(RegisterBlocEventsetTerms value) setTerms,
    required TResult Function(RegisterBlocEventsetPasswordStrength value)
        setPasswordStrength,
    required TResult Function(RegisterBlocEventchangePage value) changePage,
    required TResult Function(RegisterBlocEventsetToInitial value) setToInitial,
    required TResult Function(RegisterBlocEventremoveSnack value) removeSnack,
  }) {
    return setTerms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
  }) {
    return setTerms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
    required TResult orElse(),
  }) {
    if (setTerms != null) {
      return setTerms(this);
    }
    return orElse();
  }
}

abstract class RegisterBlocEventsetTerms implements RegisterBlocEvent {
  const factory RegisterBlocEventsetTerms(final bool newVal) =
      _$RegisterBlocEventsetTerms;

  bool get newVal;
  @JsonKey(ignore: true)
  _$$RegisterBlocEventsetTermsCopyWith<_$RegisterBlocEventsetTerms>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterBlocEventsetPasswordStrengthCopyWith<$Res> {
  factory _$$RegisterBlocEventsetPasswordStrengthCopyWith(
          _$RegisterBlocEventsetPasswordStrength value,
          $Res Function(_$RegisterBlocEventsetPasswordStrength) then) =
      __$$RegisterBlocEventsetPasswordStrengthCopyWithImpl<$Res>;
  $Res call({String text, int strength});
}

/// @nodoc
class __$$RegisterBlocEventsetPasswordStrengthCopyWithImpl<$Res>
    extends _$RegisterBlocEventCopyWithImpl<$Res>
    implements _$$RegisterBlocEventsetPasswordStrengthCopyWith<$Res> {
  __$$RegisterBlocEventsetPasswordStrengthCopyWithImpl(
      _$RegisterBlocEventsetPasswordStrength _value,
      $Res Function(_$RegisterBlocEventsetPasswordStrength) _then)
      : super(
            _value, (v) => _then(v as _$RegisterBlocEventsetPasswordStrength));

  @override
  _$RegisterBlocEventsetPasswordStrength get _value =>
      super._value as _$RegisterBlocEventsetPasswordStrength;

  @override
  $Res call({
    Object? text = freezed,
    Object? strength = freezed,
  }) {
    return _then(_$RegisterBlocEventsetPasswordStrength(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      strength: strength == freezed
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RegisterBlocEventsetPasswordStrength
    implements RegisterBlocEventsetPasswordStrength {
  const _$RegisterBlocEventsetPasswordStrength(
      {required this.text, required this.strength});

  @override
  final String text;
  @override
  final int strength;

  @override
  String toString() {
    return 'RegisterBlocEvent.setPasswordStrength(text: $text, strength: $strength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterBlocEventsetPasswordStrength &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.strength, strength));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(strength));

  @JsonKey(ignore: true)
  @override
  _$$RegisterBlocEventsetPasswordStrengthCopyWith<
          _$RegisterBlocEventsetPasswordStrength>
      get copyWith => __$$RegisterBlocEventsetPasswordStrengthCopyWithImpl<
          _$RegisterBlocEventsetPasswordStrength>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest registerRequest)
        registerButtonPressed,
    required TResult Function(bool newVal) setNewsLetter,
    required TResult Function(bool newVal) setTerms,
    required TResult Function(String text, int strength) setPasswordStrength,
    required TResult Function(RegCurrentPage regCurrentPage) changePage,
    required TResult Function() setToInitial,
    required TResult Function() removeSnack,
  }) {
    return setPasswordStrength(text, strength);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
  }) {
    return setPasswordStrength?.call(text, strength);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
    required TResult orElse(),
  }) {
    if (setPasswordStrength != null) {
      return setPasswordStrength(text, strength);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBlocEventregisterButtonPressed value)
        registerButtonPressed,
    required TResult Function(RegisterBlocEventsetNewsLetter value)
        setNewsLetter,
    required TResult Function(RegisterBlocEventsetTerms value) setTerms,
    required TResult Function(RegisterBlocEventsetPasswordStrength value)
        setPasswordStrength,
    required TResult Function(RegisterBlocEventchangePage value) changePage,
    required TResult Function(RegisterBlocEventsetToInitial value) setToInitial,
    required TResult Function(RegisterBlocEventremoveSnack value) removeSnack,
  }) {
    return setPasswordStrength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
  }) {
    return setPasswordStrength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
    required TResult orElse(),
  }) {
    if (setPasswordStrength != null) {
      return setPasswordStrength(this);
    }
    return orElse();
  }
}

abstract class RegisterBlocEventsetPasswordStrength
    implements RegisterBlocEvent {
  const factory RegisterBlocEventsetPasswordStrength(
      {required final String text,
      required final int strength}) = _$RegisterBlocEventsetPasswordStrength;

  String get text;
  int get strength;
  @JsonKey(ignore: true)
  _$$RegisterBlocEventsetPasswordStrengthCopyWith<
          _$RegisterBlocEventsetPasswordStrength>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterBlocEventchangePageCopyWith<$Res> {
  factory _$$RegisterBlocEventchangePageCopyWith(
          _$RegisterBlocEventchangePage value,
          $Res Function(_$RegisterBlocEventchangePage) then) =
      __$$RegisterBlocEventchangePageCopyWithImpl<$Res>;
  $Res call({RegCurrentPage regCurrentPage});
}

/// @nodoc
class __$$RegisterBlocEventchangePageCopyWithImpl<$Res>
    extends _$RegisterBlocEventCopyWithImpl<$Res>
    implements _$$RegisterBlocEventchangePageCopyWith<$Res> {
  __$$RegisterBlocEventchangePageCopyWithImpl(
      _$RegisterBlocEventchangePage _value,
      $Res Function(_$RegisterBlocEventchangePage) _then)
      : super(_value, (v) => _then(v as _$RegisterBlocEventchangePage));

  @override
  _$RegisterBlocEventchangePage get _value =>
      super._value as _$RegisterBlocEventchangePage;

  @override
  $Res call({
    Object? regCurrentPage = freezed,
  }) {
    return _then(_$RegisterBlocEventchangePage(
      regCurrentPage == freezed
          ? _value.regCurrentPage
          : regCurrentPage // ignore: cast_nullable_to_non_nullable
              as RegCurrentPage,
    ));
  }
}

/// @nodoc

class _$RegisterBlocEventchangePage implements RegisterBlocEventchangePage {
  const _$RegisterBlocEventchangePage(this.regCurrentPage);

  @override
  final RegCurrentPage regCurrentPage;

  @override
  String toString() {
    return 'RegisterBlocEvent.changePage(regCurrentPage: $regCurrentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterBlocEventchangePage &&
            const DeepCollectionEquality()
                .equals(other.regCurrentPage, regCurrentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(regCurrentPage));

  @JsonKey(ignore: true)
  @override
  _$$RegisterBlocEventchangePageCopyWith<_$RegisterBlocEventchangePage>
      get copyWith => __$$RegisterBlocEventchangePageCopyWithImpl<
          _$RegisterBlocEventchangePage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest registerRequest)
        registerButtonPressed,
    required TResult Function(bool newVal) setNewsLetter,
    required TResult Function(bool newVal) setTerms,
    required TResult Function(String text, int strength) setPasswordStrength,
    required TResult Function(RegCurrentPage regCurrentPage) changePage,
    required TResult Function() setToInitial,
    required TResult Function() removeSnack,
  }) {
    return changePage(regCurrentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
  }) {
    return changePage?.call(regCurrentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(regCurrentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBlocEventregisterButtonPressed value)
        registerButtonPressed,
    required TResult Function(RegisterBlocEventsetNewsLetter value)
        setNewsLetter,
    required TResult Function(RegisterBlocEventsetTerms value) setTerms,
    required TResult Function(RegisterBlocEventsetPasswordStrength value)
        setPasswordStrength,
    required TResult Function(RegisterBlocEventchangePage value) changePage,
    required TResult Function(RegisterBlocEventsetToInitial value) setToInitial,
    required TResult Function(RegisterBlocEventremoveSnack value) removeSnack,
  }) {
    return changePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
  }) {
    return changePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(this);
    }
    return orElse();
  }
}

abstract class RegisterBlocEventchangePage implements RegisterBlocEvent {
  const factory RegisterBlocEventchangePage(
      final RegCurrentPage regCurrentPage) = _$RegisterBlocEventchangePage;

  RegCurrentPage get regCurrentPage;
  @JsonKey(ignore: true)
  _$$RegisterBlocEventchangePageCopyWith<_$RegisterBlocEventchangePage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterBlocEventsetToInitialCopyWith<$Res> {
  factory _$$RegisterBlocEventsetToInitialCopyWith(
          _$RegisterBlocEventsetToInitial value,
          $Res Function(_$RegisterBlocEventsetToInitial) then) =
      __$$RegisterBlocEventsetToInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterBlocEventsetToInitialCopyWithImpl<$Res>
    extends _$RegisterBlocEventCopyWithImpl<$Res>
    implements _$$RegisterBlocEventsetToInitialCopyWith<$Res> {
  __$$RegisterBlocEventsetToInitialCopyWithImpl(
      _$RegisterBlocEventsetToInitial _value,
      $Res Function(_$RegisterBlocEventsetToInitial) _then)
      : super(_value, (v) => _then(v as _$RegisterBlocEventsetToInitial));

  @override
  _$RegisterBlocEventsetToInitial get _value =>
      super._value as _$RegisterBlocEventsetToInitial;
}

/// @nodoc

class _$RegisterBlocEventsetToInitial implements RegisterBlocEventsetToInitial {
  const _$RegisterBlocEventsetToInitial();

  @override
  String toString() {
    return 'RegisterBlocEvent.setToInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterBlocEventsetToInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest registerRequest)
        registerButtonPressed,
    required TResult Function(bool newVal) setNewsLetter,
    required TResult Function(bool newVal) setTerms,
    required TResult Function(String text, int strength) setPasswordStrength,
    required TResult Function(RegCurrentPage regCurrentPage) changePage,
    required TResult Function() setToInitial,
    required TResult Function() removeSnack,
  }) {
    return setToInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
  }) {
    return setToInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
    required TResult orElse(),
  }) {
    if (setToInitial != null) {
      return setToInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBlocEventregisterButtonPressed value)
        registerButtonPressed,
    required TResult Function(RegisterBlocEventsetNewsLetter value)
        setNewsLetter,
    required TResult Function(RegisterBlocEventsetTerms value) setTerms,
    required TResult Function(RegisterBlocEventsetPasswordStrength value)
        setPasswordStrength,
    required TResult Function(RegisterBlocEventchangePage value) changePage,
    required TResult Function(RegisterBlocEventsetToInitial value) setToInitial,
    required TResult Function(RegisterBlocEventremoveSnack value) removeSnack,
  }) {
    return setToInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
  }) {
    return setToInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
    required TResult orElse(),
  }) {
    if (setToInitial != null) {
      return setToInitial(this);
    }
    return orElse();
  }
}

abstract class RegisterBlocEventsetToInitial implements RegisterBlocEvent {
  const factory RegisterBlocEventsetToInitial() =
      _$RegisterBlocEventsetToInitial;
}

/// @nodoc
abstract class _$$RegisterBlocEventremoveSnackCopyWith<$Res> {
  factory _$$RegisterBlocEventremoveSnackCopyWith(
          _$RegisterBlocEventremoveSnack value,
          $Res Function(_$RegisterBlocEventremoveSnack) then) =
      __$$RegisterBlocEventremoveSnackCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterBlocEventremoveSnackCopyWithImpl<$Res>
    extends _$RegisterBlocEventCopyWithImpl<$Res>
    implements _$$RegisterBlocEventremoveSnackCopyWith<$Res> {
  __$$RegisterBlocEventremoveSnackCopyWithImpl(
      _$RegisterBlocEventremoveSnack _value,
      $Res Function(_$RegisterBlocEventremoveSnack) _then)
      : super(_value, (v) => _then(v as _$RegisterBlocEventremoveSnack));

  @override
  _$RegisterBlocEventremoveSnack get _value =>
      super._value as _$RegisterBlocEventremoveSnack;
}

/// @nodoc

class _$RegisterBlocEventremoveSnack implements RegisterBlocEventremoveSnack {
  const _$RegisterBlocEventremoveSnack();

  @override
  String toString() {
    return 'RegisterBlocEvent.removeSnack()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterBlocEventremoveSnack);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest registerRequest)
        registerButtonPressed,
    required TResult Function(bool newVal) setNewsLetter,
    required TResult Function(bool newVal) setTerms,
    required TResult Function(String text, int strength) setPasswordStrength,
    required TResult Function(RegCurrentPage regCurrentPage) changePage,
    required TResult Function() setToInitial,
    required TResult Function() removeSnack,
  }) {
    return removeSnack();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
  }) {
    return removeSnack?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest registerRequest)? registerButtonPressed,
    TResult Function(bool newVal)? setNewsLetter,
    TResult Function(bool newVal)? setTerms,
    TResult Function(String text, int strength)? setPasswordStrength,
    TResult Function(RegCurrentPage regCurrentPage)? changePage,
    TResult Function()? setToInitial,
    TResult Function()? removeSnack,
    required TResult orElse(),
  }) {
    if (removeSnack != null) {
      return removeSnack();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBlocEventregisterButtonPressed value)
        registerButtonPressed,
    required TResult Function(RegisterBlocEventsetNewsLetter value)
        setNewsLetter,
    required TResult Function(RegisterBlocEventsetTerms value) setTerms,
    required TResult Function(RegisterBlocEventsetPasswordStrength value)
        setPasswordStrength,
    required TResult Function(RegisterBlocEventchangePage value) changePage,
    required TResult Function(RegisterBlocEventsetToInitial value) setToInitial,
    required TResult Function(RegisterBlocEventremoveSnack value) removeSnack,
  }) {
    return removeSnack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
  }) {
    return removeSnack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBlocEventregisterButtonPressed value)?
        registerButtonPressed,
    TResult Function(RegisterBlocEventsetNewsLetter value)? setNewsLetter,
    TResult Function(RegisterBlocEventsetTerms value)? setTerms,
    TResult Function(RegisterBlocEventsetPasswordStrength value)?
        setPasswordStrength,
    TResult Function(RegisterBlocEventchangePage value)? changePage,
    TResult Function(RegisterBlocEventsetToInitial value)? setToInitial,
    TResult Function(RegisterBlocEventremoveSnack value)? removeSnack,
    required TResult orElse(),
  }) {
    if (removeSnack != null) {
      return removeSnack(this);
    }
    return orElse();
  }
}

abstract class RegisterBlocEventremoveSnack implements RegisterBlocEvent {
  const factory RegisterBlocEventremoveSnack() = _$RegisterBlocEventremoveSnack;
}

/// @nodoc
mixin _$RegisterBlocState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get strengthText => throw _privateConstructorUsedError;
  int get strengthNumber => throw _privateConstructorUsedError;
  bool get newsLetter => throw _privateConstructorUsedError;
  bool get terms => throw _privateConstructorUsedError;
  bool get registrationSuccessful => throw _privateConstructorUsedError;
  bool get otpSuccessful => throw _privateConstructorUsedError;
  RegCurrentPage get regCurrentPage => throw _privateConstructorUsedError;
  bool? get showASnackBar => throw _privateConstructorUsedError;
  String? get snackMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String strengthText,
            int strengthNumber,
            bool newsLetter,
            bool terms,
            bool registrationSuccessful,
            bool otpSuccessful,
            RegCurrentPage regCurrentPage,
            bool? showASnackBar,
            String? snackMessage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            String strengthText,
            int strengthNumber,
            bool newsLetter,
            bool terms,
            bool registrationSuccessful,
            bool otpSuccessful,
            RegCurrentPage regCurrentPage,
            bool? showASnackBar,
            String? snackMessage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            String strengthText,
            int strengthNumber,
            bool newsLetter,
            bool terms,
            bool registrationSuccessful,
            bool otpSuccessful,
            RegCurrentPage regCurrentPage,
            bool? showASnackBar,
            String? snackMessage)?
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
  $RegisterBlocStateCopyWith<RegisterBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterBlocStateCopyWith<$Res> {
  factory $RegisterBlocStateCopyWith(
          RegisterBlocState value, $Res Function(RegisterBlocState) then) =
      _$RegisterBlocStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String strengthText,
      int strengthNumber,
      bool newsLetter,
      bool terms,
      bool registrationSuccessful,
      bool otpSuccessful,
      RegCurrentPage regCurrentPage,
      bool? showASnackBar,
      String? snackMessage});
}

/// @nodoc
class _$RegisterBlocStateCopyWithImpl<$Res>
    implements $RegisterBlocStateCopyWith<$Res> {
  _$RegisterBlocStateCopyWithImpl(this._value, this._then);

  final RegisterBlocState _value;
  // ignore: unused_field
  final $Res Function(RegisterBlocState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? strengthText = freezed,
    Object? strengthNumber = freezed,
    Object? newsLetter = freezed,
    Object? terms = freezed,
    Object? registrationSuccessful = freezed,
    Object? otpSuccessful = freezed,
    Object? regCurrentPage = freezed,
    Object? showASnackBar = freezed,
    Object? snackMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      strengthText: strengthText == freezed
          ? _value.strengthText
          : strengthText // ignore: cast_nullable_to_non_nullable
              as String,
      strengthNumber: strengthNumber == freezed
          ? _value.strengthNumber
          : strengthNumber // ignore: cast_nullable_to_non_nullable
              as int,
      newsLetter: newsLetter == freezed
          ? _value.newsLetter
          : newsLetter // ignore: cast_nullable_to_non_nullable
              as bool,
      terms: terms == freezed
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationSuccessful: registrationSuccessful == freezed
          ? _value.registrationSuccessful
          : registrationSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      otpSuccessful: otpSuccessful == freezed
          ? _value.otpSuccessful
          : otpSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      regCurrentPage: regCurrentPage == freezed
          ? _value.regCurrentPage
          : regCurrentPage // ignore: cast_nullable_to_non_nullable
              as RegCurrentPage,
      showASnackBar: showASnackBar == freezed
          ? _value.showASnackBar
          : showASnackBar // ignore: cast_nullable_to_non_nullable
              as bool?,
      snackMessage: snackMessage == freezed
          ? _value.snackMessage
          : snackMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $RegisterBlocStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      String strengthText,
      int strengthNumber,
      bool newsLetter,
      bool terms,
      bool registrationSuccessful,
      bool otpSuccessful,
      RegCurrentPage regCurrentPage,
      bool? showASnackBar,
      String? snackMessage});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RegisterBlocStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? strengthText = freezed,
    Object? strengthNumber = freezed,
    Object? newsLetter = freezed,
    Object? terms = freezed,
    Object? registrationSuccessful = freezed,
    Object? otpSuccessful = freezed,
    Object? regCurrentPage = freezed,
    Object? showASnackBar = freezed,
    Object? snackMessage = freezed,
  }) {
    return _then(_$_Initial(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      strengthText: strengthText == freezed
          ? _value.strengthText
          : strengthText // ignore: cast_nullable_to_non_nullable
              as String,
      strengthNumber: strengthNumber == freezed
          ? _value.strengthNumber
          : strengthNumber // ignore: cast_nullable_to_non_nullable
              as int,
      newsLetter: newsLetter == freezed
          ? _value.newsLetter
          : newsLetter // ignore: cast_nullable_to_non_nullable
              as bool,
      terms: terms == freezed
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationSuccessful: registrationSuccessful == freezed
          ? _value.registrationSuccessful
          : registrationSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      otpSuccessful: otpSuccessful == freezed
          ? _value.otpSuccessful
          : otpSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      regCurrentPage: regCurrentPage == freezed
          ? _value.regCurrentPage
          : regCurrentPage // ignore: cast_nullable_to_non_nullable
              as RegCurrentPage,
      showASnackBar: showASnackBar == freezed
          ? _value.showASnackBar
          : showASnackBar // ignore: cast_nullable_to_non_nullable
              as bool?,
      snackMessage: snackMessage == freezed
          ? _value.snackMessage
          : snackMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isLoading,
      required this.strengthText,
      required this.strengthNumber,
      required this.newsLetter,
      required this.terms,
      required this.registrationSuccessful,
      required this.otpSuccessful,
      required this.regCurrentPage,
      this.showASnackBar,
      this.snackMessage});

  @override
  final bool isLoading;
  @override
  final String strengthText;
  @override
  final int strengthNumber;
  @override
  final bool newsLetter;
  @override
  final bool terms;
  @override
  final bool registrationSuccessful;
  @override
  final bool otpSuccessful;
  @override
  final RegCurrentPage regCurrentPage;
  @override
  final bool? showASnackBar;
  @override
  final String? snackMessage;

  @override
  String toString() {
    return 'RegisterBlocState.initial(isLoading: $isLoading, strengthText: $strengthText, strengthNumber: $strengthNumber, newsLetter: $newsLetter, terms: $terms, registrationSuccessful: $registrationSuccessful, otpSuccessful: $otpSuccessful, regCurrentPage: $regCurrentPage, showASnackBar: $showASnackBar, snackMessage: $snackMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.strengthText, strengthText) &&
            const DeepCollectionEquality()
                .equals(other.strengthNumber, strengthNumber) &&
            const DeepCollectionEquality()
                .equals(other.newsLetter, newsLetter) &&
            const DeepCollectionEquality().equals(other.terms, terms) &&
            const DeepCollectionEquality()
                .equals(other.registrationSuccessful, registrationSuccessful) &&
            const DeepCollectionEquality()
                .equals(other.otpSuccessful, otpSuccessful) &&
            const DeepCollectionEquality()
                .equals(other.regCurrentPage, regCurrentPage) &&
            const DeepCollectionEquality()
                .equals(other.showASnackBar, showASnackBar) &&
            const DeepCollectionEquality()
                .equals(other.snackMessage, snackMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(strengthText),
      const DeepCollectionEquality().hash(strengthNumber),
      const DeepCollectionEquality().hash(newsLetter),
      const DeepCollectionEquality().hash(terms),
      const DeepCollectionEquality().hash(registrationSuccessful),
      const DeepCollectionEquality().hash(otpSuccessful),
      const DeepCollectionEquality().hash(regCurrentPage),
      const DeepCollectionEquality().hash(showASnackBar),
      const DeepCollectionEquality().hash(snackMessage));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String strengthText,
            int strengthNumber,
            bool newsLetter,
            bool terms,
            bool registrationSuccessful,
            bool otpSuccessful,
            RegCurrentPage regCurrentPage,
            bool? showASnackBar,
            String? snackMessage)
        initial,
  }) {
    return initial(
        isLoading,
        strengthText,
        strengthNumber,
        newsLetter,
        terms,
        registrationSuccessful,
        otpSuccessful,
        regCurrentPage,
        showASnackBar,
        snackMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            String strengthText,
            int strengthNumber,
            bool newsLetter,
            bool terms,
            bool registrationSuccessful,
            bool otpSuccessful,
            RegCurrentPage regCurrentPage,
            bool? showASnackBar,
            String? snackMessage)?
        initial,
  }) {
    return initial?.call(
        isLoading,
        strengthText,
        strengthNumber,
        newsLetter,
        terms,
        registrationSuccessful,
        otpSuccessful,
        regCurrentPage,
        showASnackBar,
        snackMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            String strengthText,
            int strengthNumber,
            bool newsLetter,
            bool terms,
            bool registrationSuccessful,
            bool otpSuccessful,
            RegCurrentPage regCurrentPage,
            bool? showASnackBar,
            String? snackMessage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          isLoading,
          strengthText,
          strengthNumber,
          newsLetter,
          terms,
          registrationSuccessful,
          otpSuccessful,
          regCurrentPage,
          showASnackBar,
          snackMessage);
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

abstract class _Initial implements RegisterBlocState {
  const factory _Initial(
      {required final bool isLoading,
      required final String strengthText,
      required final int strengthNumber,
      required final bool newsLetter,
      required final bool terms,
      required final bool registrationSuccessful,
      required final bool otpSuccessful,
      required final RegCurrentPage regCurrentPage,
      final bool? showASnackBar,
      final String? snackMessage}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  String get strengthText;
  @override
  int get strengthNumber;
  @override
  bool get newsLetter;
  @override
  bool get terms;
  @override
  bool get registrationSuccessful;
  @override
  bool get otpSuccessful;
  @override
  RegCurrentPage get regCurrentPage;
  @override
  bool? get showASnackBar;
  @override
  String? get snackMessage;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
