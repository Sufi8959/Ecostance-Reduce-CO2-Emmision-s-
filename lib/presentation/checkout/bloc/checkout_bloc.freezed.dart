// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
          CheckoutEvent value, $Res Function(CheckoutEvent) then) =
      _$CheckoutEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

  final CheckoutEvent _value;
  // ignore: unused_field
  final $Res Function(CheckoutEvent) _then;
}

/// @nodoc
abstract class _$$CheckoutEventStartedCopyWith<$Res> {
  factory _$$CheckoutEventStartedCopyWith(_$CheckoutEventStarted value,
          $Res Function(_$CheckoutEventStarted) then) =
      __$$CheckoutEventStartedCopyWithImpl<$Res>;
  $Res call(
      {CheckoutType checkoutType,
      CouponStateModal? couponStateModal,
      ProductCartModal? productCartModal});
}

/// @nodoc
class __$$CheckoutEventStartedCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventStartedCopyWith<$Res> {
  __$$CheckoutEventStartedCopyWithImpl(_$CheckoutEventStarted _value,
      $Res Function(_$CheckoutEventStarted) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventStarted));

  @override
  _$CheckoutEventStarted get _value => super._value as _$CheckoutEventStarted;

  @override
  $Res call({
    Object? checkoutType = freezed,
    Object? couponStateModal = freezed,
    Object? productCartModal = freezed,
  }) {
    return _then(_$CheckoutEventStarted(
      checkoutType: checkoutType == freezed
          ? _value.checkoutType
          : checkoutType // ignore: cast_nullable_to_non_nullable
              as CheckoutType,
      couponStateModal: couponStateModal == freezed
          ? _value.couponStateModal
          : couponStateModal // ignore: cast_nullable_to_non_nullable
              as CouponStateModal?,
      productCartModal: productCartModal == freezed
          ? _value.productCartModal
          : productCartModal // ignore: cast_nullable_to_non_nullable
              as ProductCartModal?,
    ));
  }
}

/// @nodoc

class _$CheckoutEventStarted implements CheckoutEventStarted {
  const _$CheckoutEventStarted(
      {required this.checkoutType,
      this.couponStateModal,
      this.productCartModal});

  @override
  final CheckoutType checkoutType;
  @override
  final CouponStateModal? couponStateModal;
  @override
  final ProductCartModal? productCartModal;

  @override
  String toString() {
    return 'CheckoutEvent.started(checkoutType: $checkoutType, couponStateModal: $couponStateModal, productCartModal: $productCartModal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventStarted &&
            const DeepCollectionEquality()
                .equals(other.checkoutType, checkoutType) &&
            const DeepCollectionEquality()
                .equals(other.couponStateModal, couponStateModal) &&
            const DeepCollectionEquality()
                .equals(other.productCartModal, productCartModal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(checkoutType),
      const DeepCollectionEquality().hash(couponStateModal),
      const DeepCollectionEquality().hash(productCartModal));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventStartedCopyWith<_$CheckoutEventStarted> get copyWith =>
      __$$CheckoutEventStartedCopyWithImpl<_$CheckoutEventStarted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return started(checkoutType, couponStateModal, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return started?.call(checkoutType, couponStateModal, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(checkoutType, couponStateModal, productCartModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventStarted implements CheckoutEvent {
  const factory CheckoutEventStarted(
      {required final CheckoutType checkoutType,
      final CouponStateModal? couponStateModal,
      final ProductCartModal? productCartModal}) = _$CheckoutEventStarted;

  CheckoutType get checkoutType;
  CouponStateModal? get couponStateModal;
  ProductCartModal? get productCartModal;
  @JsonKey(ignore: true)
  _$$CheckoutEventStartedCopyWith<_$CheckoutEventStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventRegularCheckoutStartedCopyWith<$Res> {
  factory _$$CheckoutEventRegularCheckoutStartedCopyWith(
          _$CheckoutEventRegularCheckoutStarted value,
          $Res Function(_$CheckoutEventRegularCheckoutStarted) then) =
      __$$CheckoutEventRegularCheckoutStartedCopyWithImpl<$Res>;
  $Res call({CheckoutType checkoutType});
}

/// @nodoc
class __$$CheckoutEventRegularCheckoutStartedCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventRegularCheckoutStartedCopyWith<$Res> {
  __$$CheckoutEventRegularCheckoutStartedCopyWithImpl(
      _$CheckoutEventRegularCheckoutStarted _value,
      $Res Function(_$CheckoutEventRegularCheckoutStarted) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventRegularCheckoutStarted));

  @override
  _$CheckoutEventRegularCheckoutStarted get _value =>
      super._value as _$CheckoutEventRegularCheckoutStarted;

  @override
  $Res call({
    Object? checkoutType = freezed,
  }) {
    return _then(_$CheckoutEventRegularCheckoutStarted(
      checkoutType: checkoutType == freezed
          ? _value.checkoutType
          : checkoutType // ignore: cast_nullable_to_non_nullable
              as CheckoutType,
    ));
  }
}

/// @nodoc

class _$CheckoutEventRegularCheckoutStarted
    implements CheckoutEventRegularCheckoutStarted {
  const _$CheckoutEventRegularCheckoutStarted({required this.checkoutType});

  @override
  final CheckoutType checkoutType;

  @override
  String toString() {
    return 'CheckoutEvent.startRegularCheckout(checkoutType: $checkoutType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventRegularCheckoutStarted &&
            const DeepCollectionEquality()
                .equals(other.checkoutType, checkoutType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(checkoutType));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventRegularCheckoutStartedCopyWith<
          _$CheckoutEventRegularCheckoutStarted>
      get copyWith => __$$CheckoutEventRegularCheckoutStartedCopyWithImpl<
          _$CheckoutEventRegularCheckoutStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return startRegularCheckout(checkoutType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return startRegularCheckout?.call(checkoutType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (startRegularCheckout != null) {
      return startRegularCheckout(checkoutType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return startRegularCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return startRegularCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (startRegularCheckout != null) {
      return startRegularCheckout(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventRegularCheckoutStarted implements CheckoutEvent {
  const factory CheckoutEventRegularCheckoutStarted(
          {required final CheckoutType checkoutType}) =
      _$CheckoutEventRegularCheckoutStarted;

  CheckoutType get checkoutType;
  @JsonKey(ignore: true)
  _$$CheckoutEventRegularCheckoutStartedCopyWith<
          _$CheckoutEventRegularCheckoutStarted>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventExpressCheckoutStartedCopyWith<$Res> {
  factory _$$CheckoutEventExpressCheckoutStartedCopyWith(
          _$CheckoutEventExpressCheckoutStarted value,
          $Res Function(_$CheckoutEventExpressCheckoutStarted) then) =
      __$$CheckoutEventExpressCheckoutStartedCopyWithImpl<$Res>;
  $Res call({CheckoutType checkoutType, ProductCartModal productCartModal});
}

/// @nodoc
class __$$CheckoutEventExpressCheckoutStartedCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventExpressCheckoutStartedCopyWith<$Res> {
  __$$CheckoutEventExpressCheckoutStartedCopyWithImpl(
      _$CheckoutEventExpressCheckoutStarted _value,
      $Res Function(_$CheckoutEventExpressCheckoutStarted) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventExpressCheckoutStarted));

  @override
  _$CheckoutEventExpressCheckoutStarted get _value =>
      super._value as _$CheckoutEventExpressCheckoutStarted;

  @override
  $Res call({
    Object? checkoutType = freezed,
    Object? productCartModal = freezed,
  }) {
    return _then(_$CheckoutEventExpressCheckoutStarted(
      checkoutType: checkoutType == freezed
          ? _value.checkoutType
          : checkoutType // ignore: cast_nullable_to_non_nullable
              as CheckoutType,
      productCartModal: productCartModal == freezed
          ? _value.productCartModal
          : productCartModal // ignore: cast_nullable_to_non_nullable
              as ProductCartModal,
    ));
  }
}

/// @nodoc

class _$CheckoutEventExpressCheckoutStarted
    implements CheckoutEventExpressCheckoutStarted {
  const _$CheckoutEventExpressCheckoutStarted(
      {required this.checkoutType, required this.productCartModal});

  @override
  final CheckoutType checkoutType;
  @override
  final ProductCartModal productCartModal;

  @override
  String toString() {
    return 'CheckoutEvent.startExpressCheckout(checkoutType: $checkoutType, productCartModal: $productCartModal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventExpressCheckoutStarted &&
            const DeepCollectionEquality()
                .equals(other.checkoutType, checkoutType) &&
            const DeepCollectionEquality()
                .equals(other.productCartModal, productCartModal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(checkoutType),
      const DeepCollectionEquality().hash(productCartModal));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventExpressCheckoutStartedCopyWith<
          _$CheckoutEventExpressCheckoutStarted>
      get copyWith => __$$CheckoutEventExpressCheckoutStartedCopyWithImpl<
          _$CheckoutEventExpressCheckoutStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return startExpressCheckout(checkoutType, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return startExpressCheckout?.call(checkoutType, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (startExpressCheckout != null) {
      return startExpressCheckout(checkoutType, productCartModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return startExpressCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return startExpressCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (startExpressCheckout != null) {
      return startExpressCheckout(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventExpressCheckoutStarted implements CheckoutEvent {
  const factory CheckoutEventExpressCheckoutStarted(
          {required final CheckoutType checkoutType,
          required final ProductCartModal productCartModal}) =
      _$CheckoutEventExpressCheckoutStarted;

  CheckoutType get checkoutType;
  ProductCartModal get productCartModal;
  @JsonKey(ignore: true)
  _$$CheckoutEventExpressCheckoutStartedCopyWith<
          _$CheckoutEventExpressCheckoutStarted>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventAlterItemCopyWith<$Res> {
  factory _$$CheckoutEventAlterItemCopyWith(_$CheckoutEventAlterItem value,
          $Res Function(_$CheckoutEventAlterItem) then) =
      __$$CheckoutEventAlterItemCopyWithImpl<$Res>;
  $Res call({ProductCartModal product, AlterItemAction action});
}

/// @nodoc
class __$$CheckoutEventAlterItemCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventAlterItemCopyWith<$Res> {
  __$$CheckoutEventAlterItemCopyWithImpl(_$CheckoutEventAlterItem _value,
      $Res Function(_$CheckoutEventAlterItem) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventAlterItem));

  @override
  _$CheckoutEventAlterItem get _value =>
      super._value as _$CheckoutEventAlterItem;

  @override
  $Res call({
    Object? product = freezed,
    Object? action = freezed,
  }) {
    return _then(_$CheckoutEventAlterItem(
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

class _$CheckoutEventAlterItem implements CheckoutEventAlterItem {
  const _$CheckoutEventAlterItem({required this.product, required this.action});

  @override
  final ProductCartModal product;
  @override
  final AlterItemAction action;

  @override
  String toString() {
    return 'CheckoutEvent.alterItem(product: $product, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventAlterItem &&
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
  _$$CheckoutEventAlterItemCopyWith<_$CheckoutEventAlterItem> get copyWith =>
      __$$CheckoutEventAlterItemCopyWithImpl<_$CheckoutEventAlterItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return alterItem(product, action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return alterItem?.call(product, action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
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
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return alterItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return alterItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (alterItem != null) {
      return alterItem(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventAlterItem implements CheckoutEvent {
  const factory CheckoutEventAlterItem(
      {required final ProductCartModal product,
      required final AlterItemAction action}) = _$CheckoutEventAlterItem;

  ProductCartModal get product;
  AlterItemAction get action;
  @JsonKey(ignore: true)
  _$$CheckoutEventAlterItemCopyWith<_$CheckoutEventAlterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutSaveCartCopyWith<$Res> {
  factory _$$CheckoutSaveCartCopyWith(
          _$CheckoutSaveCart value, $Res Function(_$CheckoutSaveCart) then) =
      __$$CheckoutSaveCartCopyWithImpl<$Res>;
  $Res call(
      {Map<String, ProductCartModal> products,
      String currency,
      bool itemsPreLogin,
      SaveActionType saveActionType,
      ProductCartModal productCartModal});
}

/// @nodoc
class __$$CheckoutSaveCartCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutSaveCartCopyWith<$Res> {
  __$$CheckoutSaveCartCopyWithImpl(
      _$CheckoutSaveCart _value, $Res Function(_$CheckoutSaveCart) _then)
      : super(_value, (v) => _then(v as _$CheckoutSaveCart));

  @override
  _$CheckoutSaveCart get _value => super._value as _$CheckoutSaveCart;

  @override
  $Res call({
    Object? products = freezed,
    Object? currency = freezed,
    Object? itemsPreLogin = freezed,
    Object? saveActionType = freezed,
    Object? productCartModal = freezed,
  }) {
    return _then(_$CheckoutSaveCart(
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

class _$CheckoutSaveCart implements CheckoutSaveCart {
  const _$CheckoutSaveCart(
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
    return 'CheckoutEvent.saveCart(products: $products, currency: $currency, itemsPreLogin: $itemsPreLogin, saveActionType: $saveActionType, productCartModal: $productCartModal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutSaveCart &&
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
  _$$CheckoutSaveCartCopyWith<_$CheckoutSaveCart> get copyWith =>
      __$$CheckoutSaveCartCopyWithImpl<_$CheckoutSaveCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return saveCart(
        products, currency, itemsPreLogin, saveActionType, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return saveCart?.call(
        products, currency, itemsPreLogin, saveActionType, productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
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
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return saveCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return saveCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (saveCart != null) {
      return saveCart(this);
    }
    return orElse();
  }
}

abstract class CheckoutSaveCart implements CheckoutEvent {
  const factory CheckoutSaveCart(
      {required final Map<String, ProductCartModal> products,
      required final String currency,
      required final bool itemsPreLogin,
      required final SaveActionType saveActionType,
      required final ProductCartModal productCartModal}) = _$CheckoutSaveCart;

  Map<String, ProductCartModal> get products;
  String get currency;
  bool get itemsPreLogin;
  SaveActionType get saveActionType;
  ProductCartModal get productCartModal;
  @JsonKey(ignore: true)
  _$$CheckoutSaveCartCopyWith<_$CheckoutSaveCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventApplyCouponCopyWith<$Res> {
  factory _$$CheckoutEventApplyCouponCopyWith(_$CheckoutEventApplyCoupon value,
          $Res Function(_$CheckoutEventApplyCoupon) then) =
      __$$CheckoutEventApplyCouponCopyWithImpl<$Res>;
  $Res call({String code, CheckoutType checkoutType});
}

/// @nodoc
class __$$CheckoutEventApplyCouponCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventApplyCouponCopyWith<$Res> {
  __$$CheckoutEventApplyCouponCopyWithImpl(_$CheckoutEventApplyCoupon _value,
      $Res Function(_$CheckoutEventApplyCoupon) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventApplyCoupon));

  @override
  _$CheckoutEventApplyCoupon get _value =>
      super._value as _$CheckoutEventApplyCoupon;

  @override
  $Res call({
    Object? code = freezed,
    Object? checkoutType = freezed,
  }) {
    return _then(_$CheckoutEventApplyCoupon(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      checkoutType: checkoutType == freezed
          ? _value.checkoutType
          : checkoutType // ignore: cast_nullable_to_non_nullable
              as CheckoutType,
    ));
  }
}

/// @nodoc

class _$CheckoutEventApplyCoupon implements CheckoutEventApplyCoupon {
  const _$CheckoutEventApplyCoupon(
      {required this.code, required this.checkoutType});

  @override
  final String code;
  @override
  final CheckoutType checkoutType;

  @override
  String toString() {
    return 'CheckoutEvent.applyCoupon(code: $code, checkoutType: $checkoutType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventApplyCoupon &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.checkoutType, checkoutType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(checkoutType));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventApplyCouponCopyWith<_$CheckoutEventApplyCoupon>
      get copyWith =>
          __$$CheckoutEventApplyCouponCopyWithImpl<_$CheckoutEventApplyCoupon>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return applyCoupon(code, checkoutType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return applyCoupon?.call(code, checkoutType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (applyCoupon != null) {
      return applyCoupon(code, checkoutType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return applyCoupon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return applyCoupon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (applyCoupon != null) {
      return applyCoupon(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventApplyCoupon implements CheckoutEvent {
  const factory CheckoutEventApplyCoupon(
      {required final String code,
      required final CheckoutType checkoutType}) = _$CheckoutEventApplyCoupon;

  String get code;
  CheckoutType get checkoutType;
  @JsonKey(ignore: true)
  _$$CheckoutEventApplyCouponCopyWith<_$CheckoutEventApplyCoupon>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventRemoveCouponCopyWith<$Res> {
  factory _$$CheckoutEventRemoveCouponCopyWith(
          _$CheckoutEventRemoveCoupon value,
          $Res Function(_$CheckoutEventRemoveCoupon) then) =
      __$$CheckoutEventRemoveCouponCopyWithImpl<$Res>;
  $Res call({CheckoutType checkoutType});
}

/// @nodoc
class __$$CheckoutEventRemoveCouponCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventRemoveCouponCopyWith<$Res> {
  __$$CheckoutEventRemoveCouponCopyWithImpl(_$CheckoutEventRemoveCoupon _value,
      $Res Function(_$CheckoutEventRemoveCoupon) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventRemoveCoupon));

  @override
  _$CheckoutEventRemoveCoupon get _value =>
      super._value as _$CheckoutEventRemoveCoupon;

  @override
  $Res call({
    Object? checkoutType = freezed,
  }) {
    return _then(_$CheckoutEventRemoveCoupon(
      checkoutType: checkoutType == freezed
          ? _value.checkoutType
          : checkoutType // ignore: cast_nullable_to_non_nullable
              as CheckoutType,
    ));
  }
}

/// @nodoc

class _$CheckoutEventRemoveCoupon implements CheckoutEventRemoveCoupon {
  const _$CheckoutEventRemoveCoupon({required this.checkoutType});

  @override
  final CheckoutType checkoutType;

  @override
  String toString() {
    return 'CheckoutEvent.removeCoupon(checkoutType: $checkoutType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventRemoveCoupon &&
            const DeepCollectionEquality()
                .equals(other.checkoutType, checkoutType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(checkoutType));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventRemoveCouponCopyWith<_$CheckoutEventRemoveCoupon>
      get copyWith => __$$CheckoutEventRemoveCouponCopyWithImpl<
          _$CheckoutEventRemoveCoupon>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return removeCoupon(checkoutType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return removeCoupon?.call(checkoutType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (removeCoupon != null) {
      return removeCoupon(checkoutType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return removeCoupon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return removeCoupon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (removeCoupon != null) {
      return removeCoupon(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventRemoveCoupon implements CheckoutEvent {
  const factory CheckoutEventRemoveCoupon(
      {required final CheckoutType checkoutType}) = _$CheckoutEventRemoveCoupon;

  CheckoutType get checkoutType;
  @JsonKey(ignore: true)
  _$$CheckoutEventRemoveCouponCopyWith<_$CheckoutEventRemoveCoupon>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventDoneCopyWith<$Res> {
  factory _$$CheckoutEventDoneCopyWith(
          _$CheckoutEventDone value, $Res Function(_$CheckoutEventDone) then) =
      __$$CheckoutEventDoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutEventDoneCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventDoneCopyWith<$Res> {
  __$$CheckoutEventDoneCopyWithImpl(
      _$CheckoutEventDone _value, $Res Function(_$CheckoutEventDone) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventDone));

  @override
  _$CheckoutEventDone get _value => super._value as _$CheckoutEventDone;
}

/// @nodoc

class _$CheckoutEventDone implements CheckoutEventDone {
  const _$CheckoutEventDone();

  @override
  String toString() {
    return 'CheckoutEvent.done()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutEventDone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventDone implements CheckoutEvent {
  const factory CheckoutEventDone() = _$CheckoutEventDone;
}

/// @nodoc
abstract class _$$CheckoutEventcancelledCopyWith<$Res> {
  factory _$$CheckoutEventcancelledCopyWith(_$CheckoutEventcancelled value,
          $Res Function(_$CheckoutEventcancelled) then) =
      __$$CheckoutEventcancelledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutEventcancelledCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventcancelledCopyWith<$Res> {
  __$$CheckoutEventcancelledCopyWithImpl(_$CheckoutEventcancelled _value,
      $Res Function(_$CheckoutEventcancelled) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventcancelled));

  @override
  _$CheckoutEventcancelled get _value =>
      super._value as _$CheckoutEventcancelled;
}

/// @nodoc

class _$CheckoutEventcancelled implements CheckoutEventcancelled {
  const _$CheckoutEventcancelled();

  @override
  String toString() {
    return 'CheckoutEvent.cancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutEventcancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventcancelled implements CheckoutEvent {
  const factory CheckoutEventcancelled() = _$CheckoutEventcancelled;
}

/// @nodoc
abstract class _$$CheckoutEventonLogoutCopyWith<$Res> {
  factory _$$CheckoutEventonLogoutCopyWith(_$CheckoutEventonLogout value,
          $Res Function(_$CheckoutEventonLogout) then) =
      __$$CheckoutEventonLogoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutEventonLogoutCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventonLogoutCopyWith<$Res> {
  __$$CheckoutEventonLogoutCopyWithImpl(_$CheckoutEventonLogout _value,
      $Res Function(_$CheckoutEventonLogout) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventonLogout));

  @override
  _$CheckoutEventonLogout get _value => super._value as _$CheckoutEventonLogout;
}

/// @nodoc

class _$CheckoutEventonLogout implements CheckoutEventonLogout {
  const _$CheckoutEventonLogout();

  @override
  String toString() {
    return 'CheckoutEvent.onLogout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutEventonLogout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return onLogout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return onLogout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (onLogout != null) {
      return onLogout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return onLogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return onLogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (onLogout != null) {
      return onLogout(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventonLogout implements CheckoutEvent {
  const factory CheckoutEventonLogout() = _$CheckoutEventonLogout;
}

/// @nodoc
abstract class _$$CheckoutEventchangeCurrencyCopyWith<$Res> {
  factory _$$CheckoutEventchangeCurrencyCopyWith(
          _$CheckoutEventchangeCurrency value,
          $Res Function(_$CheckoutEventchangeCurrency) then) =
      __$$CheckoutEventchangeCurrencyCopyWithImpl<$Res>;
  $Res call({String newCurrency});
}

/// @nodoc
class __$$CheckoutEventchangeCurrencyCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventchangeCurrencyCopyWith<$Res> {
  __$$CheckoutEventchangeCurrencyCopyWithImpl(
      _$CheckoutEventchangeCurrency _value,
      $Res Function(_$CheckoutEventchangeCurrency) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventchangeCurrency));

  @override
  _$CheckoutEventchangeCurrency get _value =>
      super._value as _$CheckoutEventchangeCurrency;

  @override
  $Res call({
    Object? newCurrency = freezed,
  }) {
    return _then(_$CheckoutEventchangeCurrency(
      newCurrency: newCurrency == freezed
          ? _value.newCurrency
          : newCurrency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckoutEventchangeCurrency implements CheckoutEventchangeCurrency {
  const _$CheckoutEventchangeCurrency({required this.newCurrency});

  @override
  final String newCurrency;

  @override
  String toString() {
    return 'CheckoutEvent.changeCurrency(newCurrency: $newCurrency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventchangeCurrency &&
            const DeepCollectionEquality()
                .equals(other.newCurrency, newCurrency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(newCurrency));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventchangeCurrencyCopyWith<_$CheckoutEventchangeCurrency>
      get copyWith => __$$CheckoutEventchangeCurrencyCopyWithImpl<
          _$CheckoutEventchangeCurrency>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return changeCurrency(newCurrency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return changeCurrency?.call(newCurrency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (changeCurrency != null) {
      return changeCurrency(newCurrency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return changeCurrency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return changeCurrency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (changeCurrency != null) {
      return changeCurrency(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventchangeCurrency implements CheckoutEvent {
  const factory CheckoutEventchangeCurrency(
      {required final String newCurrency}) = _$CheckoutEventchangeCurrency;

  String get newCurrency;
  @JsonKey(ignore: true)
  _$$CheckoutEventchangeCurrencyCopyWith<_$CheckoutEventchangeCurrency>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventchangeEmissionPopupStatusCopyWith<$Res> {
  factory _$$CheckoutEventchangeEmissionPopupStatusCopyWith(
          _$CheckoutEventchangeEmissionPopupStatus value,
          $Res Function(_$CheckoutEventchangeEmissionPopupStatus) then) =
      __$$CheckoutEventchangeEmissionPopupStatusCopyWithImpl<$Res>;
  $Res call({bool newStatus});
}

/// @nodoc
class __$$CheckoutEventchangeEmissionPopupStatusCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventchangeEmissionPopupStatusCopyWith<$Res> {
  __$$CheckoutEventchangeEmissionPopupStatusCopyWithImpl(
      _$CheckoutEventchangeEmissionPopupStatus _value,
      $Res Function(_$CheckoutEventchangeEmissionPopupStatus) _then)
      : super(_value,
            (v) => _then(v as _$CheckoutEventchangeEmissionPopupStatus));

  @override
  _$CheckoutEventchangeEmissionPopupStatus get _value =>
      super._value as _$CheckoutEventchangeEmissionPopupStatus;

  @override
  $Res call({
    Object? newStatus = freezed,
  }) {
    return _then(_$CheckoutEventchangeEmissionPopupStatus(
      newStatus: newStatus == freezed
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckoutEventchangeEmissionPopupStatus
    implements CheckoutEventchangeEmissionPopupStatus {
  const _$CheckoutEventchangeEmissionPopupStatus({required this.newStatus});

  @override
  final bool newStatus;

  @override
  String toString() {
    return 'CheckoutEvent.changeEmissionPopupStatus(newStatus: $newStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventchangeEmissionPopupStatus &&
            const DeepCollectionEquality().equals(other.newStatus, newStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newStatus));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventchangeEmissionPopupStatusCopyWith<
          _$CheckoutEventchangeEmissionPopupStatus>
      get copyWith => __$$CheckoutEventchangeEmissionPopupStatusCopyWithImpl<
          _$CheckoutEventchangeEmissionPopupStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return changeEmissionPopupStatus(newStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return changeEmissionPopupStatus?.call(newStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (changeEmissionPopupStatus != null) {
      return changeEmissionPopupStatus(newStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return changeEmissionPopupStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return changeEmissionPopupStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (changeEmissionPopupStatus != null) {
      return changeEmissionPopupStatus(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventchangeEmissionPopupStatus implements CheckoutEvent {
  const factory CheckoutEventchangeEmissionPopupStatus(
          {required final bool newStatus}) =
      _$CheckoutEventchangeEmissionPopupStatus;

  bool get newStatus;
  @JsonKey(ignore: true)
  _$$CheckoutEventchangeEmissionPopupStatusCopyWith<
          _$CheckoutEventchangeEmissionPopupStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventUpdateUserCopyWith<$Res> {
  factory _$$CheckoutEventUpdateUserCopyWith(_$CheckoutEventUpdateUser value,
          $Res Function(_$CheckoutEventUpdateUser) then) =
      __$$CheckoutEventUpdateUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutEventUpdateUserCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventUpdateUserCopyWith<$Res> {
  __$$CheckoutEventUpdateUserCopyWithImpl(_$CheckoutEventUpdateUser _value,
      $Res Function(_$CheckoutEventUpdateUser) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventUpdateUser));

  @override
  _$CheckoutEventUpdateUser get _value =>
      super._value as _$CheckoutEventUpdateUser;
}

/// @nodoc

class _$CheckoutEventUpdateUser implements CheckoutEventUpdateUser {
  const _$CheckoutEventUpdateUser();

  @override
  String toString() {
    return 'CheckoutEvent.updateUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventUpdateUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return updateUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return updateUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventUpdateUser implements CheckoutEvent {
  const factory CheckoutEventUpdateUser() = _$CheckoutEventUpdateUser;
}

/// @nodoc
abstract class _$$CheckoutEventUpdateAdressCopyWith<$Res> {
  factory _$$CheckoutEventUpdateAdressCopyWith(
          _$CheckoutEventUpdateAdress value,
          $Res Function(_$CheckoutEventUpdateAdress) then) =
      __$$CheckoutEventUpdateAdressCopyWithImpl<$Res>;
  $Res call({BillingAddressModal billingAddressModal});
}

/// @nodoc
class __$$CheckoutEventUpdateAdressCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventUpdateAdressCopyWith<$Res> {
  __$$CheckoutEventUpdateAdressCopyWithImpl(_$CheckoutEventUpdateAdress _value,
      $Res Function(_$CheckoutEventUpdateAdress) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventUpdateAdress));

  @override
  _$CheckoutEventUpdateAdress get _value =>
      super._value as _$CheckoutEventUpdateAdress;

  @override
  $Res call({
    Object? billingAddressModal = freezed,
  }) {
    return _then(_$CheckoutEventUpdateAdress(
      billingAddressModal == freezed
          ? _value.billingAddressModal
          : billingAddressModal // ignore: cast_nullable_to_non_nullable
              as BillingAddressModal,
    ));
  }
}

/// @nodoc

class _$CheckoutEventUpdateAdress implements CheckoutEventUpdateAdress {
  const _$CheckoutEventUpdateAdress(this.billingAddressModal);

  @override
  final BillingAddressModal billingAddressModal;

  @override
  String toString() {
    return 'CheckoutEvent.billingAddressUpdate(billingAddressModal: $billingAddressModal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventUpdateAdress &&
            const DeepCollectionEquality()
                .equals(other.billingAddressModal, billingAddressModal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(billingAddressModal));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventUpdateAdressCopyWith<_$CheckoutEventUpdateAdress>
      get copyWith => __$$CheckoutEventUpdateAdressCopyWithImpl<
          _$CheckoutEventUpdateAdress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return billingAddressUpdate(billingAddressModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return billingAddressUpdate?.call(billingAddressModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (billingAddressUpdate != null) {
      return billingAddressUpdate(billingAddressModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return billingAddressUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return billingAddressUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (billingAddressUpdate != null) {
      return billingAddressUpdate(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventUpdateAdress implements CheckoutEvent {
  const factory CheckoutEventUpdateAdress(
          final BillingAddressModal billingAddressModal) =
      _$CheckoutEventUpdateAdress;

  BillingAddressModal get billingAddressModal;
  @JsonKey(ignore: true)
  _$$CheckoutEventUpdateAdressCopyWith<_$CheckoutEventUpdateAdress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventDeleteItemCopyWith<$Res> {
  factory _$$CheckoutEventDeleteItemCopyWith(_$CheckoutEventDeleteItem value,
          $Res Function(_$CheckoutEventDeleteItem) then) =
      __$$CheckoutEventDeleteItemCopyWithImpl<$Res>;
  $Res call({ProductCartModal productCartModal});
}

/// @nodoc
class __$$CheckoutEventDeleteItemCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventDeleteItemCopyWith<$Res> {
  __$$CheckoutEventDeleteItemCopyWithImpl(_$CheckoutEventDeleteItem _value,
      $Res Function(_$CheckoutEventDeleteItem) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventDeleteItem));

  @override
  _$CheckoutEventDeleteItem get _value =>
      super._value as _$CheckoutEventDeleteItem;

  @override
  $Res call({
    Object? productCartModal = freezed,
  }) {
    return _then(_$CheckoutEventDeleteItem(
      productCartModal: productCartModal == freezed
          ? _value.productCartModal
          : productCartModal // ignore: cast_nullable_to_non_nullable
              as ProductCartModal,
    ));
  }
}

/// @nodoc

class _$CheckoutEventDeleteItem implements CheckoutEventDeleteItem {
  const _$CheckoutEventDeleteItem({required this.productCartModal});

  @override
  final ProductCartModal productCartModal;

  @override
  String toString() {
    return 'CheckoutEvent.deleteItem(productCartModal: $productCartModal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventDeleteItem &&
            const DeepCollectionEquality()
                .equals(other.productCartModal, productCartModal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(productCartModal));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventDeleteItemCopyWith<_$CheckoutEventDeleteItem> get copyWith =>
      __$$CheckoutEventDeleteItemCopyWithImpl<_$CheckoutEventDeleteItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return deleteItem(productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return deleteItem?.call(productCartModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(productCartModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return deleteItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return deleteItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventDeleteItem implements CheckoutEvent {
  const factory CheckoutEventDeleteItem(
          {required final ProductCartModal productCartModal}) =
      _$CheckoutEventDeleteItem;

  ProductCartModal get productCartModal;
  @JsonKey(ignore: true)
  _$$CheckoutEventDeleteItemCopyWith<_$CheckoutEventDeleteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutEventsetLoadingCopyWith<$Res> {
  factory _$$CheckoutEventsetLoadingCopyWith(_$CheckoutEventsetLoading value,
          $Res Function(_$CheckoutEventsetLoading) then) =
      __$$CheckoutEventsetLoadingCopyWithImpl<$Res>;
  $Res call({bool newStatus});
}

/// @nodoc
class __$$CheckoutEventsetLoadingCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res>
    implements _$$CheckoutEventsetLoadingCopyWith<$Res> {
  __$$CheckoutEventsetLoadingCopyWithImpl(_$CheckoutEventsetLoading _value,
      $Res Function(_$CheckoutEventsetLoading) _then)
      : super(_value, (v) => _then(v as _$CheckoutEventsetLoading));

  @override
  _$CheckoutEventsetLoading get _value =>
      super._value as _$CheckoutEventsetLoading;

  @override
  $Res call({
    Object? newStatus = freezed,
  }) {
    return _then(_$CheckoutEventsetLoading(
      newStatus: newStatus == freezed
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckoutEventsetLoading implements CheckoutEventsetLoading {
  const _$CheckoutEventsetLoading({required this.newStatus});

  @override
  final bool newStatus;

  @override
  String toString() {
    return 'CheckoutEvent.setLoading(newStatus: $newStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEventsetLoading &&
            const DeepCollectionEquality().equals(other.newStatus, newStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newStatus));

  @JsonKey(ignore: true)
  @override
  _$$CheckoutEventsetLoadingCopyWith<_$CheckoutEventsetLoading> get copyWith =>
      __$$CheckoutEventsetLoadingCopyWithImpl<_$CheckoutEventsetLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)
        started,
    required TResult Function(CheckoutType checkoutType) startRegularCheckout,
    required TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)
        startExpressCheckout,
    required TResult Function(ProductCartModal product, AlterItemAction action)
        alterItem,
    required TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)
        saveCart,
    required TResult Function(String code, CheckoutType checkoutType)
        applyCoupon,
    required TResult Function(CheckoutType checkoutType) removeCoupon,
    required TResult Function() done,
    required TResult Function() cancelled,
    required TResult Function() onLogout,
    required TResult Function(String newCurrency) changeCurrency,
    required TResult Function(bool newStatus) changeEmissionPopupStatus,
    required TResult Function() updateUser,
    required TResult Function(BillingAddressModal billingAddressModal)
        billingAddressUpdate,
    required TResult Function(ProductCartModal productCartModal) deleteItem,
    required TResult Function(bool newStatus) setLoading,
  }) {
    return setLoading(newStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
  }) {
    return setLoading?.call(newStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            ProductCartModal? productCartModal)?
        started,
    TResult Function(CheckoutType checkoutType)? startRegularCheckout,
    TResult Function(
            CheckoutType checkoutType, ProductCartModal productCartModal)?
        startExpressCheckout,
    TResult Function(ProductCartModal product, AlterItemAction action)?
        alterItem,
    TResult Function(
            Map<String, ProductCartModal> products,
            String currency,
            bool itemsPreLogin,
            SaveActionType saveActionType,
            ProductCartModal productCartModal)?
        saveCart,
    TResult Function(String code, CheckoutType checkoutType)? applyCoupon,
    TResult Function(CheckoutType checkoutType)? removeCoupon,
    TResult Function()? done,
    TResult Function()? cancelled,
    TResult Function()? onLogout,
    TResult Function(String newCurrency)? changeCurrency,
    TResult Function(bool newStatus)? changeEmissionPopupStatus,
    TResult Function()? updateUser,
    TResult Function(BillingAddressModal billingAddressModal)?
        billingAddressUpdate,
    TResult Function(ProductCartModal productCartModal)? deleteItem,
    TResult Function(bool newStatus)? setLoading,
    required TResult orElse(),
  }) {
    if (setLoading != null) {
      return setLoading(newStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutEventStarted value) started,
    required TResult Function(CheckoutEventRegularCheckoutStarted value)
        startRegularCheckout,
    required TResult Function(CheckoutEventExpressCheckoutStarted value)
        startExpressCheckout,
    required TResult Function(CheckoutEventAlterItem value) alterItem,
    required TResult Function(CheckoutSaveCart value) saveCart,
    required TResult Function(CheckoutEventApplyCoupon value) applyCoupon,
    required TResult Function(CheckoutEventRemoveCoupon value) removeCoupon,
    required TResult Function(CheckoutEventDone value) done,
    required TResult Function(CheckoutEventcancelled value) cancelled,
    required TResult Function(CheckoutEventonLogout value) onLogout,
    required TResult Function(CheckoutEventchangeCurrency value) changeCurrency,
    required TResult Function(CheckoutEventchangeEmissionPopupStatus value)
        changeEmissionPopupStatus,
    required TResult Function(CheckoutEventUpdateUser value) updateUser,
    required TResult Function(CheckoutEventUpdateAdress value)
        billingAddressUpdate,
    required TResult Function(CheckoutEventDeleteItem value) deleteItem,
    required TResult Function(CheckoutEventsetLoading value) setLoading,
  }) {
    return setLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
  }) {
    return setLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutEventStarted value)? started,
    TResult Function(CheckoutEventRegularCheckoutStarted value)?
        startRegularCheckout,
    TResult Function(CheckoutEventExpressCheckoutStarted value)?
        startExpressCheckout,
    TResult Function(CheckoutEventAlterItem value)? alterItem,
    TResult Function(CheckoutSaveCart value)? saveCart,
    TResult Function(CheckoutEventApplyCoupon value)? applyCoupon,
    TResult Function(CheckoutEventRemoveCoupon value)? removeCoupon,
    TResult Function(CheckoutEventDone value)? done,
    TResult Function(CheckoutEventcancelled value)? cancelled,
    TResult Function(CheckoutEventonLogout value)? onLogout,
    TResult Function(CheckoutEventchangeCurrency value)? changeCurrency,
    TResult Function(CheckoutEventchangeEmissionPopupStatus value)?
        changeEmissionPopupStatus,
    TResult Function(CheckoutEventUpdateUser value)? updateUser,
    TResult Function(CheckoutEventUpdateAdress value)? billingAddressUpdate,
    TResult Function(CheckoutEventDeleteItem value)? deleteItem,
    TResult Function(CheckoutEventsetLoading value)? setLoading,
    required TResult orElse(),
  }) {
    if (setLoading != null) {
      return setLoading(this);
    }
    return orElse();
  }
}

abstract class CheckoutEventsetLoading implements CheckoutEvent {
  const factory CheckoutEventsetLoading({required final bool newStatus}) =
      _$CheckoutEventsetLoading;

  bool get newStatus;
  @JsonKey(ignore: true)
  _$$CheckoutEventsetLoadingCopyWith<_$CheckoutEventsetLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutState {
  int get cartQuantity => throw _privateConstructorUsedError;
  double get cartTotal => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get orderTotal => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;
  Map<String, ProductCartModal> get products =>
      throw _privateConstructorUsedError;
  String get paymentCurrency => throw _privateConstructorUsedError;
  UserProfileModal? get userProfile => throw _privateConstructorUsedError;
  BillingAddressModal? get billingAddress => throw _privateConstructorUsedError;
  CheckoutType get checkoutType => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get onSession => throw _privateConstructorUsedError;
  CouponStateModal? get couponStateModal => throw _privateConstructorUsedError;
  String? get couponMessage => throw _privateConstructorUsedError;
  bool get couponHasError => throw _privateConstructorUsedError;
  bool get orderTotalWithinStripeRange => throw _privateConstructorUsedError;
  bool get isCouponLoading => throw _privateConstructorUsedError;
  bool get newExpressItemSavedToCart => throw _privateConstructorUsedError;
  bool get isItemsLoading => throw _privateConstructorUsedError;
  bool get shouldShowEmissionPopup => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)
        $default, {
    required TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)?
        $default, {
    TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)?
        $default, {
    TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckoutState value) $default, {
    required TResult Function(CheckoutStateInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_CheckoutState value)? $default, {
    TResult Function(CheckoutStateInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckoutState value)? $default, {
    TResult Function(CheckoutStateInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res>;
  $Res call(
      {int cartQuantity,
      double cartTotal,
      double discount,
      double orderTotal,
      double subTotal,
      Map<String, ProductCartModal> products,
      String paymentCurrency,
      UserProfileModal? userProfile,
      BillingAddressModal? billingAddress,
      CheckoutType checkoutType,
      bool isLoading,
      bool onSession,
      CouponStateModal? couponStateModal,
      String? couponMessage,
      bool couponHasError,
      bool orderTotalWithinStripeRange,
      bool isCouponLoading,
      bool newExpressItemSavedToCart,
      bool isItemsLoading,
      bool shouldShowEmissionPopup});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  final CheckoutState _value;
  // ignore: unused_field
  final $Res Function(CheckoutState) _then;

  @override
  $Res call({
    Object? cartQuantity = freezed,
    Object? cartTotal = freezed,
    Object? discount = freezed,
    Object? orderTotal = freezed,
    Object? subTotal = freezed,
    Object? products = freezed,
    Object? paymentCurrency = freezed,
    Object? userProfile = freezed,
    Object? billingAddress = freezed,
    Object? checkoutType = freezed,
    Object? isLoading = freezed,
    Object? onSession = freezed,
    Object? couponStateModal = freezed,
    Object? couponMessage = freezed,
    Object? couponHasError = freezed,
    Object? orderTotalWithinStripeRange = freezed,
    Object? isCouponLoading = freezed,
    Object? newExpressItemSavedToCart = freezed,
    Object? isItemsLoading = freezed,
    Object? shouldShowEmissionPopup = freezed,
  }) {
    return _then(_value.copyWith(
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
      paymentCurrency: paymentCurrency == freezed
          ? _value.paymentCurrency
          : paymentCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModal?,
      billingAddress: billingAddress == freezed
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as BillingAddressModal?,
      checkoutType: checkoutType == freezed
          ? _value.checkoutType
          : checkoutType // ignore: cast_nullable_to_non_nullable
              as CheckoutType,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      onSession: onSession == freezed
          ? _value.onSession
          : onSession // ignore: cast_nullable_to_non_nullable
              as bool,
      couponStateModal: couponStateModal == freezed
          ? _value.couponStateModal
          : couponStateModal // ignore: cast_nullable_to_non_nullable
              as CouponStateModal?,
      couponMessage: couponMessage == freezed
          ? _value.couponMessage
          : couponMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      couponHasError: couponHasError == freezed
          ? _value.couponHasError
          : couponHasError // ignore: cast_nullable_to_non_nullable
              as bool,
      orderTotalWithinStripeRange: orderTotalWithinStripeRange == freezed
          ? _value.orderTotalWithinStripeRange
          : orderTotalWithinStripeRange // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponLoading: isCouponLoading == freezed
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      newExpressItemSavedToCart: newExpressItemSavedToCart == freezed
          ? _value.newExpressItemSavedToCart
          : newExpressItemSavedToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      isItemsLoading: isItemsLoading == freezed
          ? _value.isItemsLoading
          : isItemsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowEmissionPopup: shouldShowEmissionPopup == freezed
          ? _value.shouldShowEmissionPopup
          : shouldShowEmissionPopup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CheckoutStateCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$_CheckoutStateCopyWith(
          _$_CheckoutState value, $Res Function(_$_CheckoutState) then) =
      __$$_CheckoutStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int cartQuantity,
      double cartTotal,
      double discount,
      double orderTotal,
      double subTotal,
      Map<String, ProductCartModal> products,
      String paymentCurrency,
      UserProfileModal? userProfile,
      BillingAddressModal? billingAddress,
      CheckoutType checkoutType,
      bool isLoading,
      bool onSession,
      CouponStateModal? couponStateModal,
      String? couponMessage,
      bool couponHasError,
      bool orderTotalWithinStripeRange,
      bool isCouponLoading,
      bool newExpressItemSavedToCart,
      bool isItemsLoading,
      bool shouldShowEmissionPopup});
}

/// @nodoc
class __$$_CheckoutStateCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res>
    implements _$$_CheckoutStateCopyWith<$Res> {
  __$$_CheckoutStateCopyWithImpl(
      _$_CheckoutState _value, $Res Function(_$_CheckoutState) _then)
      : super(_value, (v) => _then(v as _$_CheckoutState));

  @override
  _$_CheckoutState get _value => super._value as _$_CheckoutState;

  @override
  $Res call({
    Object? cartQuantity = freezed,
    Object? cartTotal = freezed,
    Object? discount = freezed,
    Object? orderTotal = freezed,
    Object? subTotal = freezed,
    Object? products = freezed,
    Object? paymentCurrency = freezed,
    Object? userProfile = freezed,
    Object? billingAddress = freezed,
    Object? checkoutType = freezed,
    Object? isLoading = freezed,
    Object? onSession = freezed,
    Object? couponStateModal = freezed,
    Object? couponMessage = freezed,
    Object? couponHasError = freezed,
    Object? orderTotalWithinStripeRange = freezed,
    Object? isCouponLoading = freezed,
    Object? newExpressItemSavedToCart = freezed,
    Object? isItemsLoading = freezed,
    Object? shouldShowEmissionPopup = freezed,
  }) {
    return _then(_$_CheckoutState(
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
      paymentCurrency: paymentCurrency == freezed
          ? _value.paymentCurrency
          : paymentCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModal?,
      billingAddress: billingAddress == freezed
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as BillingAddressModal?,
      checkoutType: checkoutType == freezed
          ? _value.checkoutType
          : checkoutType // ignore: cast_nullable_to_non_nullable
              as CheckoutType,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      onSession: onSession == freezed
          ? _value.onSession
          : onSession // ignore: cast_nullable_to_non_nullable
              as bool,
      couponStateModal: couponStateModal == freezed
          ? _value.couponStateModal
          : couponStateModal // ignore: cast_nullable_to_non_nullable
              as CouponStateModal?,
      couponMessage: couponMessage == freezed
          ? _value.couponMessage
          : couponMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      couponHasError: couponHasError == freezed
          ? _value.couponHasError
          : couponHasError // ignore: cast_nullable_to_non_nullable
              as bool,
      orderTotalWithinStripeRange: orderTotalWithinStripeRange == freezed
          ? _value.orderTotalWithinStripeRange
          : orderTotalWithinStripeRange // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponLoading: isCouponLoading == freezed
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      newExpressItemSavedToCart: newExpressItemSavedToCart == freezed
          ? _value.newExpressItemSavedToCart
          : newExpressItemSavedToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      isItemsLoading: isItemsLoading == freezed
          ? _value.isItemsLoading
          : isItemsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowEmissionPopup: shouldShowEmissionPopup == freezed
          ? _value.shouldShowEmissionPopup
          : shouldShowEmissionPopup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CheckoutState implements _CheckoutState {
  _$_CheckoutState(
      {required this.cartQuantity,
      required this.cartTotal,
      required this.discount,
      required this.orderTotal,
      required this.subTotal,
      required final Map<String, ProductCartModal> products,
      required this.paymentCurrency,
      this.userProfile,
      this.billingAddress,
      required this.checkoutType,
      required this.isLoading,
      required this.onSession,
      this.couponStateModal,
      this.couponMessage,
      required this.couponHasError,
      required this.orderTotalWithinStripeRange,
      required this.isCouponLoading,
      required this.newExpressItemSavedToCart,
      required this.isItemsLoading,
      required this.shouldShowEmissionPopup})
      : _products = products;

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
  final String paymentCurrency;
  @override
  final UserProfileModal? userProfile;
  @override
  final BillingAddressModal? billingAddress;
  @override
  final CheckoutType checkoutType;
  @override
  final bool isLoading;
  @override
  final bool onSession;
  @override
  final CouponStateModal? couponStateModal;
  @override
  final String? couponMessage;
  @override
  final bool couponHasError;
  @override
  final bool orderTotalWithinStripeRange;
  @override
  final bool isCouponLoading;
  @override
  final bool newExpressItemSavedToCart;
  @override
  final bool isItemsLoading;
  @override
  final bool shouldShowEmissionPopup;

  @override
  String toString() {
    return 'CheckoutState(cartQuantity: $cartQuantity, cartTotal: $cartTotal, discount: $discount, orderTotal: $orderTotal, subTotal: $subTotal, products: $products, paymentCurrency: $paymentCurrency, userProfile: $userProfile, billingAddress: $billingAddress, checkoutType: $checkoutType, isLoading: $isLoading, onSession: $onSession, couponStateModal: $couponStateModal, couponMessage: $couponMessage, couponHasError: $couponHasError, orderTotalWithinStripeRange: $orderTotalWithinStripeRange, isCouponLoading: $isCouponLoading, newExpressItemSavedToCart: $newExpressItemSavedToCart, isItemsLoading: $isItemsLoading, shouldShowEmissionPopup: $shouldShowEmissionPopup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutState &&
            const DeepCollectionEquality()
                .equals(other.cartQuantity, cartQuantity) &&
            const DeepCollectionEquality().equals(other.cartTotal, cartTotal) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality()
                .equals(other.orderTotal, orderTotal) &&
            const DeepCollectionEquality().equals(other.subTotal, subTotal) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.paymentCurrency, paymentCurrency) &&
            const DeepCollectionEquality()
                .equals(other.userProfile, userProfile) &&
            const DeepCollectionEquality()
                .equals(other.billingAddress, billingAddress) &&
            const DeepCollectionEquality()
                .equals(other.checkoutType, checkoutType) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.onSession, onSession) &&
            const DeepCollectionEquality()
                .equals(other.couponStateModal, couponStateModal) &&
            const DeepCollectionEquality()
                .equals(other.couponMessage, couponMessage) &&
            const DeepCollectionEquality()
                .equals(other.couponHasError, couponHasError) &&
            const DeepCollectionEquality().equals(
                other.orderTotalWithinStripeRange,
                orderTotalWithinStripeRange) &&
            const DeepCollectionEquality()
                .equals(other.isCouponLoading, isCouponLoading) &&
            const DeepCollectionEquality().equals(
                other.newExpressItemSavedToCart, newExpressItemSavedToCart) &&
            const DeepCollectionEquality()
                .equals(other.isItemsLoading, isItemsLoading) &&
            const DeepCollectionEquality().equals(
                other.shouldShowEmissionPopup, shouldShowEmissionPopup));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(cartQuantity),
        const DeepCollectionEquality().hash(cartTotal),
        const DeepCollectionEquality().hash(discount),
        const DeepCollectionEquality().hash(orderTotal),
        const DeepCollectionEquality().hash(subTotal),
        const DeepCollectionEquality().hash(_products),
        const DeepCollectionEquality().hash(paymentCurrency),
        const DeepCollectionEquality().hash(userProfile),
        const DeepCollectionEquality().hash(billingAddress),
        const DeepCollectionEquality().hash(checkoutType),
        const DeepCollectionEquality().hash(isLoading),
        const DeepCollectionEquality().hash(onSession),
        const DeepCollectionEquality().hash(couponStateModal),
        const DeepCollectionEquality().hash(couponMessage),
        const DeepCollectionEquality().hash(couponHasError),
        const DeepCollectionEquality().hash(orderTotalWithinStripeRange),
        const DeepCollectionEquality().hash(isCouponLoading),
        const DeepCollectionEquality().hash(newExpressItemSavedToCart),
        const DeepCollectionEquality().hash(isItemsLoading),
        const DeepCollectionEquality().hash(shouldShowEmissionPopup)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      __$$_CheckoutStateCopyWithImpl<_$_CheckoutState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)
        $default, {
    required TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)
        initial,
  }) {
    return $default(
        cartQuantity,
        cartTotal,
        discount,
        orderTotal,
        subTotal,
        products,
        paymentCurrency,
        userProfile,
        billingAddress,
        checkoutType,
        isLoading,
        onSession,
        couponStateModal,
        couponMessage,
        couponHasError,
        orderTotalWithinStripeRange,
        isCouponLoading,
        newExpressItemSavedToCart,
        isItemsLoading,
        shouldShowEmissionPopup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)?
        $default, {
    TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)?
        initial,
  }) {
    return $default?.call(
        cartQuantity,
        cartTotal,
        discount,
        orderTotal,
        subTotal,
        products,
        paymentCurrency,
        userProfile,
        billingAddress,
        checkoutType,
        isLoading,
        onSession,
        couponStateModal,
        couponMessage,
        couponHasError,
        orderTotalWithinStripeRange,
        isCouponLoading,
        newExpressItemSavedToCart,
        isItemsLoading,
        shouldShowEmissionPopup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)?
        $default, {
    TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)?
        initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          cartQuantity,
          cartTotal,
          discount,
          orderTotal,
          subTotal,
          products,
          paymentCurrency,
          userProfile,
          billingAddress,
          checkoutType,
          isLoading,
          onSession,
          couponStateModal,
          couponMessage,
          couponHasError,
          orderTotalWithinStripeRange,
          isCouponLoading,
          newExpressItemSavedToCart,
          isItemsLoading,
          shouldShowEmissionPopup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckoutState value) $default, {
    required TResult Function(CheckoutStateInitial value) initial,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_CheckoutState value)? $default, {
    TResult Function(CheckoutStateInitial value)? initial,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckoutState value)? $default, {
    TResult Function(CheckoutStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CheckoutState implements CheckoutState {
  factory _CheckoutState(
      {required final int cartQuantity,
      required final double cartTotal,
      required final double discount,
      required final double orderTotal,
      required final double subTotal,
      required final Map<String, ProductCartModal> products,
      required final String paymentCurrency,
      final UserProfileModal? userProfile,
      final BillingAddressModal? billingAddress,
      required final CheckoutType checkoutType,
      required final bool isLoading,
      required final bool onSession,
      final CouponStateModal? couponStateModal,
      final String? couponMessage,
      required final bool couponHasError,
      required final bool orderTotalWithinStripeRange,
      required final bool isCouponLoading,
      required final bool newExpressItemSavedToCart,
      required final bool isItemsLoading,
      required final bool shouldShowEmissionPopup}) = _$_CheckoutState;

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
  String get paymentCurrency;
  @override
  UserProfileModal? get userProfile;
  @override
  BillingAddressModal? get billingAddress;
  @override
  CheckoutType get checkoutType;
  @override
  bool get isLoading;
  @override
  bool get onSession;
  @override
  CouponStateModal? get couponStateModal;
  @override
  String? get couponMessage;
  @override
  bool get couponHasError;
  @override
  bool get orderTotalWithinStripeRange;
  @override
  bool get isCouponLoading;
  @override
  bool get newExpressItemSavedToCart;
  @override
  bool get isItemsLoading;
  @override
  bool get shouldShowEmissionPopup;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutStateInitialCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateInitialCopyWith(_$CheckoutStateInitial value,
          $Res Function(_$CheckoutStateInitial) then) =
      __$$CheckoutStateInitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {int cartQuantity,
      bool isItemsLoading,
      double cartTotal,
      double discount,
      double orderTotal,
      double subTotal,
      Map<String, ProductCartModal> products,
      String paymentCurrency,
      UserProfileModal? userProfile,
      BillingAddressModal? billingAddress,
      CheckoutType checkoutType,
      CouponStateModal? couponStateModal,
      bool isLoading,
      bool onSession,
      String? couponMessage,
      bool couponHasError,
      bool orderTotalWithinStripeRange,
      bool isCouponLoading,
      bool newExpressItemSavedToCart,
      bool shouldShowEmissionPopup});
}

/// @nodoc
class __$$CheckoutStateInitialCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res>
    implements _$$CheckoutStateInitialCopyWith<$Res> {
  __$$CheckoutStateInitialCopyWithImpl(_$CheckoutStateInitial _value,
      $Res Function(_$CheckoutStateInitial) _then)
      : super(_value, (v) => _then(v as _$CheckoutStateInitial));

  @override
  _$CheckoutStateInitial get _value => super._value as _$CheckoutStateInitial;

  @override
  $Res call({
    Object? cartQuantity = freezed,
    Object? isItemsLoading = freezed,
    Object? cartTotal = freezed,
    Object? discount = freezed,
    Object? orderTotal = freezed,
    Object? subTotal = freezed,
    Object? products = freezed,
    Object? paymentCurrency = freezed,
    Object? userProfile = freezed,
    Object? billingAddress = freezed,
    Object? checkoutType = freezed,
    Object? couponStateModal = freezed,
    Object? isLoading = freezed,
    Object? onSession = freezed,
    Object? couponMessage = freezed,
    Object? couponHasError = freezed,
    Object? orderTotalWithinStripeRange = freezed,
    Object? isCouponLoading = freezed,
    Object? newExpressItemSavedToCart = freezed,
    Object? shouldShowEmissionPopup = freezed,
  }) {
    return _then(_$CheckoutStateInitial(
      cartQuantity: cartQuantity == freezed
          ? _value.cartQuantity
          : cartQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isItemsLoading: isItemsLoading == freezed
          ? _value.isItemsLoading
          : isItemsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
      paymentCurrency: paymentCurrency == freezed
          ? _value.paymentCurrency
          : paymentCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModal?,
      billingAddress: billingAddress == freezed
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as BillingAddressModal?,
      checkoutType: checkoutType == freezed
          ? _value.checkoutType
          : checkoutType // ignore: cast_nullable_to_non_nullable
              as CheckoutType,
      couponStateModal: couponStateModal == freezed
          ? _value.couponStateModal
          : couponStateModal // ignore: cast_nullable_to_non_nullable
              as CouponStateModal?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      onSession: onSession == freezed
          ? _value.onSession
          : onSession // ignore: cast_nullable_to_non_nullable
              as bool,
      couponMessage: couponMessage == freezed
          ? _value.couponMessage
          : couponMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      couponHasError: couponHasError == freezed
          ? _value.couponHasError
          : couponHasError // ignore: cast_nullable_to_non_nullable
              as bool,
      orderTotalWithinStripeRange: orderTotalWithinStripeRange == freezed
          ? _value.orderTotalWithinStripeRange
          : orderTotalWithinStripeRange // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponLoading: isCouponLoading == freezed
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      newExpressItemSavedToCart: newExpressItemSavedToCart == freezed
          ? _value.newExpressItemSavedToCart
          : newExpressItemSavedToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowEmissionPopup: shouldShowEmissionPopup == freezed
          ? _value.shouldShowEmissionPopup
          : shouldShowEmissionPopup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckoutStateInitial implements CheckoutStateInitial {
  const _$CheckoutStateInitial(
      {required this.cartQuantity,
      required this.isItemsLoading,
      required this.cartTotal,
      required this.discount,
      required this.orderTotal,
      required this.subTotal,
      required final Map<String, ProductCartModal> products,
      required this.paymentCurrency,
      this.userProfile,
      this.billingAddress,
      required this.checkoutType,
      this.couponStateModal,
      required this.isLoading,
      required this.onSession,
      this.couponMessage,
      required this.couponHasError,
      required this.orderTotalWithinStripeRange,
      required this.isCouponLoading,
      required this.newExpressItemSavedToCart,
      required this.shouldShowEmissionPopup})
      : _products = products;

  @override
  final int cartQuantity;
  @override
  final bool isItemsLoading;
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
  final String paymentCurrency;
  @override
  final UserProfileModal? userProfile;
  @override
  final BillingAddressModal? billingAddress;
  @override
  final CheckoutType checkoutType;
  @override
  final CouponStateModal? couponStateModal;
  @override
  final bool isLoading;
  @override
  final bool onSession;
  @override
  final String? couponMessage;
  @override
  final bool couponHasError;
  @override
  final bool orderTotalWithinStripeRange;
  @override
  final bool isCouponLoading;
  @override
  final bool newExpressItemSavedToCart;
  @override
  final bool shouldShowEmissionPopup;

  @override
  String toString() {
    return 'CheckoutState.initial(cartQuantity: $cartQuantity, isItemsLoading: $isItemsLoading, cartTotal: $cartTotal, discount: $discount, orderTotal: $orderTotal, subTotal: $subTotal, products: $products, paymentCurrency: $paymentCurrency, userProfile: $userProfile, billingAddress: $billingAddress, checkoutType: $checkoutType, couponStateModal: $couponStateModal, isLoading: $isLoading, onSession: $onSession, couponMessage: $couponMessage, couponHasError: $couponHasError, orderTotalWithinStripeRange: $orderTotalWithinStripeRange, isCouponLoading: $isCouponLoading, newExpressItemSavedToCart: $newExpressItemSavedToCart, shouldShowEmissionPopup: $shouldShowEmissionPopup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateInitial &&
            const DeepCollectionEquality()
                .equals(other.cartQuantity, cartQuantity) &&
            const DeepCollectionEquality()
                .equals(other.isItemsLoading, isItemsLoading) &&
            const DeepCollectionEquality().equals(other.cartTotal, cartTotal) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality()
                .equals(other.orderTotal, orderTotal) &&
            const DeepCollectionEquality().equals(other.subTotal, subTotal) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.paymentCurrency, paymentCurrency) &&
            const DeepCollectionEquality()
                .equals(other.userProfile, userProfile) &&
            const DeepCollectionEquality()
                .equals(other.billingAddress, billingAddress) &&
            const DeepCollectionEquality()
                .equals(other.checkoutType, checkoutType) &&
            const DeepCollectionEquality()
                .equals(other.couponStateModal, couponStateModal) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.onSession, onSession) &&
            const DeepCollectionEquality()
                .equals(other.couponMessage, couponMessage) &&
            const DeepCollectionEquality()
                .equals(other.couponHasError, couponHasError) &&
            const DeepCollectionEquality().equals(
                other.orderTotalWithinStripeRange,
                orderTotalWithinStripeRange) &&
            const DeepCollectionEquality()
                .equals(other.isCouponLoading, isCouponLoading) &&
            const DeepCollectionEquality().equals(
                other.newExpressItemSavedToCart, newExpressItemSavedToCart) &&
            const DeepCollectionEquality().equals(
                other.shouldShowEmissionPopup, shouldShowEmissionPopup));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(cartQuantity),
        const DeepCollectionEquality().hash(isItemsLoading),
        const DeepCollectionEquality().hash(cartTotal),
        const DeepCollectionEquality().hash(discount),
        const DeepCollectionEquality().hash(orderTotal),
        const DeepCollectionEquality().hash(subTotal),
        const DeepCollectionEquality().hash(_products),
        const DeepCollectionEquality().hash(paymentCurrency),
        const DeepCollectionEquality().hash(userProfile),
        const DeepCollectionEquality().hash(billingAddress),
        const DeepCollectionEquality().hash(checkoutType),
        const DeepCollectionEquality().hash(couponStateModal),
        const DeepCollectionEquality().hash(isLoading),
        const DeepCollectionEquality().hash(onSession),
        const DeepCollectionEquality().hash(couponMessage),
        const DeepCollectionEquality().hash(couponHasError),
        const DeepCollectionEquality().hash(orderTotalWithinStripeRange),
        const DeepCollectionEquality().hash(isCouponLoading),
        const DeepCollectionEquality().hash(newExpressItemSavedToCart),
        const DeepCollectionEquality().hash(shouldShowEmissionPopup)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$CheckoutStateInitialCopyWith<_$CheckoutStateInitial> get copyWith =>
      __$$CheckoutStateInitialCopyWithImpl<_$CheckoutStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)
        $default, {
    required TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)
        initial,
  }) {
    return initial(
        cartQuantity,
        isItemsLoading,
        cartTotal,
        discount,
        orderTotal,
        subTotal,
        products,
        paymentCurrency,
        userProfile,
        billingAddress,
        checkoutType,
        couponStateModal,
        isLoading,
        onSession,
        couponMessage,
        couponHasError,
        orderTotalWithinStripeRange,
        isCouponLoading,
        newExpressItemSavedToCart,
        shouldShowEmissionPopup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)?
        $default, {
    TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)?
        initial,
  }) {
    return initial?.call(
        cartQuantity,
        isItemsLoading,
        cartTotal,
        discount,
        orderTotal,
        subTotal,
        products,
        paymentCurrency,
        userProfile,
        billingAddress,
        checkoutType,
        couponStateModal,
        isLoading,
        onSession,
        couponMessage,
        couponHasError,
        orderTotalWithinStripeRange,
        isCouponLoading,
        newExpressItemSavedToCart,
        shouldShowEmissionPopup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int cartQuantity,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            bool isLoading,
            bool onSession,
            CouponStateModal? couponStateModal,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool isItemsLoading,
            bool shouldShowEmissionPopup)?
        $default, {
    TResult Function(
            int cartQuantity,
            bool isItemsLoading,
            double cartTotal,
            double discount,
            double orderTotal,
            double subTotal,
            Map<String, ProductCartModal> products,
            String paymentCurrency,
            UserProfileModal? userProfile,
            BillingAddressModal? billingAddress,
            CheckoutType checkoutType,
            CouponStateModal? couponStateModal,
            bool isLoading,
            bool onSession,
            String? couponMessage,
            bool couponHasError,
            bool orderTotalWithinStripeRange,
            bool isCouponLoading,
            bool newExpressItemSavedToCart,
            bool shouldShowEmissionPopup)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          cartQuantity,
          isItemsLoading,
          cartTotal,
          discount,
          orderTotal,
          subTotal,
          products,
          paymentCurrency,
          userProfile,
          billingAddress,
          checkoutType,
          couponStateModal,
          isLoading,
          onSession,
          couponMessage,
          couponHasError,
          orderTotalWithinStripeRange,
          isCouponLoading,
          newExpressItemSavedToCart,
          shouldShowEmissionPopup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckoutState value) $default, {
    required TResult Function(CheckoutStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_CheckoutState value)? $default, {
    TResult Function(CheckoutStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckoutState value)? $default, {
    TResult Function(CheckoutStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CheckoutStateInitial implements CheckoutState {
  const factory CheckoutStateInitial(
      {required final int cartQuantity,
      required final bool isItemsLoading,
      required final double cartTotal,
      required final double discount,
      required final double orderTotal,
      required final double subTotal,
      required final Map<String, ProductCartModal> products,
      required final String paymentCurrency,
      final UserProfileModal? userProfile,
      final BillingAddressModal? billingAddress,
      required final CheckoutType checkoutType,
      final CouponStateModal? couponStateModal,
      required final bool isLoading,
      required final bool onSession,
      final String? couponMessage,
      required final bool couponHasError,
      required final bool orderTotalWithinStripeRange,
      required final bool isCouponLoading,
      required final bool newExpressItemSavedToCart,
      required final bool shouldShowEmissionPopup}) = _$CheckoutStateInitial;

  @override
  int get cartQuantity;
  @override
  bool get isItemsLoading;
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
  String get paymentCurrency;
  @override
  UserProfileModal? get userProfile;
  @override
  BillingAddressModal? get billingAddress;
  @override
  CheckoutType get checkoutType;
  @override
  CouponStateModal? get couponStateModal;
  @override
  bool get isLoading;
  @override
  bool get onSession;
  @override
  String? get couponMessage;
  @override
  bool get couponHasError;
  @override
  bool get orderTotalWithinStripeRange;
  @override
  bool get isCouponLoading;
  @override
  bool get newExpressItemSavedToCart;
  @override
  bool get shouldShowEmissionPopup;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutStateInitialCopyWith<_$CheckoutStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}
