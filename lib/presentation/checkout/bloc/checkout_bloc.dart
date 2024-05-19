import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/app/internet_bloc/internet_bloc.dart';
import 'package:net_carbons/app/internet_bloc/internet_state.dart';
import 'package:net_carbons/data/cart/repository/cart_repository.dart';
import 'package:net_carbons/data/login/repository/repository.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/domain/cart/models/apply_coupon.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/domain/cart/models/coupon_modal.dart';
import 'package:net_carbons/domain/cart/models/server_resp_modals.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/core/general/failiure.dart';
import '../../cart/bloc/cart_bloc.dart';

part 'checkout_bloc.freezed.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  AuthState authState = const AuthUnknown();
  UserProfileState? userProfileState;
  InternetState internetState = ConnectedState(isPopupOpen: false);
  final AuthBloc authBloc;
  final InternetBloc internetBloc;
  final AppControllerBloc appControllerBloc;
  final UserProfileBloc userProfileBloc;
  final UserProfileRepository userProfileRepository =
      getIt<UserProfileRepository>();
  final LoginRepository loginRepository = getIt<LoginRepository>();

  final CartRepository cartRepository;
  final CartBloc cartBloc;
  CartState cartState = CartState.initial();
  CheckoutBloc({
    required this.cartRepository,
    required this.appControllerBloc,
    required this.userProfileBloc,
    required this.authBloc,
    required this.internetBloc,
    required this.cartBloc,
  }) : super(const CheckoutState.initial(
            onSession: false,
            checkoutType: CheckoutType.initial,
            products: {},
            isLoading: false,
            cartQuantity: 0,
            cartTotal: 0,
            discount: 0,
            orderTotal: 0,
            billingAddress: null,
            subTotal: 0,
            paymentCurrency: "INR",
            isCouponLoading: false,
            couponHasError: false,
            orderTotalWithinStripeRange: false,
            newExpressItemSavedToCart: false,
            shouldShowEmissionPopup: false,
            isItemsLoading: false)) {
    internetBloc.stream.listen((event) {
      internetState = event;
    });
    authState = authBloc.state;
    authBloc.stream.listen((event) {
      authState = event;
      if (event is Authenticated) {
        bool syncedHere = false;
        cartBloc.stream.listen((event) {
          if (!syncedHere) {
            if (event.cartSyncedToServer == CartSyncedToServerOnAuth.synced) {
              add(CheckoutEvent.started(checkoutType: state.checkoutType));

              syncedHere = true;
            }
          }
        });

        return;
      } else if (event is Unauthenticated) {}
    });

    // paymentCurrency =
    //     appControllerBloc.state.countryModal?.currencyCode ?? 'USD';
    appControllerBloc.stream.listen((event) {
      // paymentCurrency = event.countryModal?.currencyCode ?? 'USD';
    });
    cartState = cartBloc.state;
    cartBloc.stream.listen((event) {
      cartState = event;
    });
    userProfileState = userProfileBloc.state;
    userProfileBloc.stream.listen((event) {
      userProfileState = event;
      // if (event.userProfileModal != null &&
      //     event.userProfileModal?.billingAddress != null) {
      //   add(CheckoutEvent.billingAddressUpdate(
      //       event.userProfileModal!.billingAddress!));
      // }
    });
/////////
    on<CheckoutEventsetLoading>(
        (event, emit) => emit(state.copyWith(isLoading: event.newStatus)));
    on<CheckoutEventchangeEmissionPopupStatus>((event, emit) =>
        emit(state.copyWith(shouldShowEmissionPopup: event.newStatus)));

    on<CheckoutEventStarted>((event, emit) async {
      emit(state.copyWith(
          isLoading: true,
          paymentCurrency: cartBloc.state.currency,
          checkoutType: event.checkoutType,
          shouldShowEmissionPopup: true));

      if (event.checkoutType == CheckoutType.express) {
        if (event.productCartModal != null) {
          add(CheckoutEvent.startExpressCheckout(
              checkoutType: event.checkoutType,
              productCartModal: event.productCartModal!));
        }
      } else {
        add(CheckoutEvent.startRegularCheckout(
            checkoutType: event.checkoutType));
      }

      if (internetState is ConnectedState) {
        if (state.billingAddress != null) {
          return emit(state.copyWith(
              couponStateModal: event.couponStateModal,
              checkoutType: event.checkoutType,
              billingAddress: state.billingAddress,
              userProfile: state.userProfile!
                  .copyWith(billingAddressModal: state.billingAddress),
              onSession: true,
              isLoading: false));
        } else {
          if (userProfileState != null) {
            if (userProfileState!.userProfileModal?.billingAddress != null) {
              return emit(state.copyWith(
                  couponStateModal: event.couponStateModal,
                  checkoutType: event.checkoutType,
                  billingAddress:
                      userProfileState!.userProfileModal!.billingAddress,
                  userProfile: userProfileState?.userProfileModal,
                  onSession: true,
                  isLoading: false));
            }
          }
          final response = await userProfileRepository.getUserProfile();
          return response.fold((l) {
            return emit(state.copyWith(
                couponStateModal: event.couponStateModal,
                checkoutType: event.checkoutType,
                billingAddress: null,
                userProfile: null,
                onSession: true,
                isLoading: false));
          }, (profile) {
            BillingAddressModal? billingAddressModal =
                profile.billingAddress?.copyWith(email: profile.user.email);
            return emit(state.copyWith(
                couponStateModal: event.couponStateModal,
                userProfile: profile,
                billingAddress: billingAddressModal,
                checkoutType: event.checkoutType,
                onSession: true,
                isLoading: false));
          });
        }
      } else {
        emit(state.copyWith(userProfile: null, isLoading: false));
      }
    });

/////////
    ///Cuopn events////

    on<CheckoutEventApplyCoupon>((event, emit) async {
      emit(state.copyWith(isCouponLoading: true));
      if (authState is Authenticated) {
        return await _applyCoupon(event.checkoutType, event.code, emit);
      }
    });
////////

    on<CheckoutEventRemoveCoupon>((event, emit) async {
      emit(state.copyWith(isCouponLoading: true));

      if (authState is Authenticated) {
        if (event.checkoutType == CheckoutType.regular) {
          final res = await cartRepository.couponUnApply(
              currency: appControllerBloc.state.currency,
              considerChangedCurrency: true);
          return cartServerToStateMapper(res, emit, state);
        } else {
          emit(state.copyWith(
              couponMessage: null,
              isCouponLoading: false,
              couponStateModal: null,
              cartTotal: state.cartTotal,
              subTotal: state.products.entries.fold(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      element.value.price * element.value.quantity),
              cartQuantity: state.cartQuantity,
              orderTotal: state.products.entries.fold(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      element.value.price * element.value.quantity)));
        }
      }
    });

/////////
    on<CheckoutEventRegularCheckoutStarted>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await cartRepository.getCartFromServer(
          getStripeCoupon: true,
          currency: state.paymentCurrency,
          considerChangedCurrency: true);
      return cartServerToStateMapper(
          res, emit, state.copyWith(checkoutType: event.checkoutType));
    });
/////////
    on<CheckoutEventExpressCheckoutStarted>((event, emit) {
      if (!cartState.products.containsKey(event.productCartModal.id)) {
        cartBloc.add(CartEvent.addItem(product: event.productCartModal));
        emit(state.copyWith(newExpressItemSavedToCart: true));
      }
      ProductCartModal productCartModal = event.productCartModal
          .getPriceDataWithNewCurrency(state.paymentCurrency);
      emit(state.copyWith(
          products: {event.productCartModal.id: productCartModal},
          cartQuantity: productCartModal.quantity,
          cartTotal: productCartModal.price * productCartModal.quantity,
          subTotal: productCartModal.price * productCartModal.quantity,
          orderTotal: productCartModal.price * productCartModal.quantity,
          couponStateModal: null,
          checkoutType: event.checkoutType));
    });
/////////
    on<CheckoutEventAlterItem>((event, emit) async {
      Map<String, ProductCartModal> products = {...state.products};

      if (state.products.containsKey(event.product.id)) {
        switch (event.action) {
          case AlterItemAction.increment:
            products.update(event.product.id,
                (value) => value.copyWith(quantity: value.quantity + 1));
            emit(state.copyWith(isItemsLoading: true));
            add(CheckoutEvent.saveCart(
                products: products,
                currency: state.paymentCurrency,
                itemsPreLogin: false,
                saveActionType: SaveActionType.update,
                productCartModal: event.product));
            break;

          case AlterItemAction.decrement:
            if (products[event.product.id]!.quantity > 1) {
              products.update(event.product.id,
                  (value) => value.copyWith(quantity: value.quantity - 1));
              emit(state.copyWith(isItemsLoading: true));
              add(CheckoutEvent.saveCart(
                  products: products,
                  currency: state.paymentCurrency,
                  itemsPreLogin: false,
                  saveActionType: SaveActionType.update,
                  productCartModal: event.product));
            } else {
              products.remove(event.product.id);

              if (state.checkoutType != CheckoutType.express) {
                emit(state.copyWith(isLoading: true));
                final resp = await cartRepository.removeItem(
                  getStripeCoupon: false,
                  currency: state.paymentCurrency,
                  itemId: event.product.id,
                  considerChangedCurrency: true,
                );
                return cartServerToStateMapper(resp, emit, state);
              }
            }
            break;

          case AlterItemAction.delete:
            products.remove(event.product.id);

            if (state.checkoutType != CheckoutType.express) {
              emit(state.copyWith(isCouponLoading: true));
              final resp = await cartRepository.removeItem(
                  itemId: event.product.id,
                  currency: state.paymentCurrency,
                  considerChangedCurrency: true);
              return cartServerToStateMapper(resp, emit, state);
              //break;
            }
        }
      }
      emit(state.copyWith(
        products: products,
        cartQuantity: products.entries.fold(0,
            (previousValue, element) => previousValue + element.value.quantity),
        cartTotal: products.entries.fold(
            0,
            (previousValue, element) =>
                previousValue + element.value.price * element.value.quantity),
      ));
    });

    on<CheckoutEventcancelled>((event, emit) async {
      if (cartBloc.state.currency != state.paymentCurrency) {
        cartBloc
            .add(CartEvent.changeCurrency(appControllerBloc.state.currency));
      }
      final res =
          await loginRepository.setCurrency(appControllerBloc.state.currency);

      res.fold((l) {
        return emit(state.copyWith(
            onSession: false,
            checkoutType: CheckoutType.initial,
            products: {},
            couponHasError: false,
            couponMessage: null,
            isLoading: false,
            cartQuantity: 0,
            cartTotal: 0,
            discount: 0,
            newExpressItemSavedToCart: false,
            orderTotal: 0,
            subTotal: 0,
            isCouponLoading: false));
      },
          (r) => emit(state.copyWith(
              onSession: false,
              checkoutType: CheckoutType.initial,
              products: {},
              couponHasError: false,
              couponMessage: null,
              isLoading: false,
              cartQuantity: 0,
              cartTotal: 0,
              discount: 0,
              orderTotal: 0,
              newExpressItemSavedToCart: false,
              subTotal: 0,
              isCouponLoading: false)));
    });

/////////
    on<CheckoutEventDone>((event, emit) async {
      // if (appControllerBloc.state.currency != state.paymentCurrency) {
      //   // appControllerBloc.add(
      //   //     AppControllerEvent.updateCurrency(currency: state.paymentCurrency));
      // }
      if (cartBloc.state.currency != state.paymentCurrency) {
        print("${cartBloc.state.currency}*****************");
        print("${state.paymentCurrency}*****************");
        cartBloc.add(CartEvent.changeCurrency(state.paymentCurrency));
      }

      return emit(state.copyWith(
          onSession: false,
          checkoutType: CheckoutType.initial,
          products: {},
          couponHasError: false,
          couponMessage: null,
          isLoading: false,
          cartQuantity: 0,
          cartTotal: 0,
          discount: 0,
          orderTotal: 0,
          newExpressItemSavedToCart: false,
          subTotal: 0,
          isCouponLoading: false));
    });
    /////////
    on<CheckoutEventchangeCurrency>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      print("set currency ${event.newCurrency}*****************");
      final res = await loginRepository.setCurrency(event.newCurrency);
      print(res);
      return res.fold((l) {
        return emit(state.copyWith(isLoading: false));
      }, (r) async {
        emit(state.copyWith(paymentCurrency: event.newCurrency));
        if (state.checkoutType == CheckoutType.regular) {
          // add(CheckoutEvent.startRegularCheckout(
          //     checkoutType: state.checkoutType));
          final res = await cartRepository.saveCartToServer(
              products: state.products,
              currency: event.newCurrency,
              itemsPreLogin: false,
              considerChangedCurrency: true,
              getStripeCoupon: true);
          return cartServerToStateMapper(res, emit, state);
        } else if (state.checkoutType == CheckoutType.express) {
          ProductCartModal productCartModal = state.products.entries.first.value
              .getPriceDataWithNewCurrency(event.newCurrency);
          emit(state.copyWith(
            products: {productCartModal.id: productCartModal},
            cartQuantity: productCartModal.quantity,
            cartTotal: productCartModal.price * productCartModal.quantity,
          ));
          if (state.couponStateModal != null) {
            return _applyCoupon(
                CheckoutType.express, state.couponStateModal!.name, emit);
          } else {
            emit(state.copyWith(
              paymentCurrency: event.newCurrency,
              isLoading: false,
              subTotal: productCartModal.price * productCartModal.quantity,
              orderTotal: productCartModal.price * productCartModal.quantity,
            ));
          }
        }
      });
    });
/////////
    on<CheckoutEventUpdateUser>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      if (authBloc.state is Authenticated) {
        final response = await userProfileRepository.getUserProfile();
        response.fold((l) {
          emit(state.copyWith(
              isLoading: false, userProfile: null, billingAddress: null));
        }, (profile) {
          BillingAddressModal? billingAddressModal =
              profile.billingAddress?.copyWith(email: profile.user.email);
          return emit(state.copyWith(
              isLoading: false,
              billingAddress: billingAddressModal,
              userProfile: profile));
        });
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });
/////////
    on<CheckoutEventUpdateAdress>((event, emit) {
      print("CheckoutEventUpdateAdress");
      emit(state.copyWith(billingAddress: event.billingAddressModal));
    });
/////////
    on<CheckoutSaveCart>(
      (event, emit) async {
        if (authState is Authenticated) {
          if (state.checkoutType == CheckoutType.express) {
            ///TODO: if coupon is there, total should be affected by coupon
            if (state.couponStateModal != null) {
              final res = await cartRepository.calculateExpressCheckout(
                  getStripeCoupon: true,
                  productId: state.products.entries.first.value.id,
                  quantity: state.products.entries.first.value.quantity,
                  couponStateModal: state.couponStateModal);
              return res.fold((l) {
                return emit(state.copyWith(
                  isItemsLoading: false,
                  isCouponLoading: false,
                  isLoading: false,
                  cartQuantity: state.products.entries.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.value.quantity),
                  cartTotal: state.products.entries.fold(
                      0,
                      (previousValue, element) =>
                          previousValue +
                          element.value.price * element.value.quantity),
                ));
              },
                  (r) => emit(state.copyWith(
                      isItemsLoading: false,
                      isCouponLoading: false,
                      isLoading: false,
                      cartQuantity: state.products.entries.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.value.quantity),
                      cartTotal: r.subTotal!,
                      orderTotal: r.orderTotal!,
                      discount: r.discount!)));
            }

            emit(state.copyWith(
              isCouponLoading: false,
              isLoading: false,
              isItemsLoading: false,
              cartQuantity: state.products.entries.fold(
                  0,
                  (previousValue, element) =>
                      previousValue + element.value.quantity),
              cartTotal: state.products.entries.fold(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      element.value.price * element.value.quantity),
              orderTotal: state.products.entries.fold(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      element.value.price * element.value.quantity),
            ));
            return;
          }

          if (event.saveActionType == SaveActionType.update) {
            print("saveCartToServer --> ${event.currency}");
            final resp = await cartRepository.saveCartToServer(
              currency: event.currency,
              getStripeCoupon: true,
              products: event.products,
              itemsPreLogin: event.itemsPreLogin,
              considerChangedCurrency: true,
            );
            return cartServerToStateMapper(resp, emit, state);
          } else if (event.saveActionType == SaveActionType.remove) {
            final resp = await cartRepository.removeItem(
              itemId: event.productCartModal.id,
              currency: state.paymentCurrency,
              considerChangedCurrency: true,
            );
            return cartServerToStateMapper(resp, emit, state);
          }
        } else if (authState is Unauthenticated) {}
      },
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(seconds: 2))
            .asyncExpand(mapper);
      },
    );

    on<CheckoutEventonLogout>((event, emit) => emit(CheckoutState.initial(
        onSession: false,
        checkoutType: CheckoutType.initial,
        products: {},
        isLoading: false,
        cartQuantity: 0,
        cartTotal: 0,
        discount: 0,
        orderTotal: 0,
        subTotal: 0,
        paymentCurrency: appControllerBloc.state.currency,
        isCouponLoading: false,
        couponHasError: false,
        billingAddress: null,
        orderTotalWithinStripeRange: false,
        newExpressItemSavedToCart: false,
        shouldShowEmissionPopup: false,
        isItemsLoading: false)));
  }

  FutureOr<void> _applyCoupon(CheckoutType checkoutType, String code,
      Emitter<CheckoutState> emit) async {
    final res = await cartRepository.applyCoupon(
      type: checkoutType.name,
      code: code,
      getStripeCoupon: true,
      productId: checkoutType == CheckoutType.express
          ? state.products.entries.first.value.id
          : null,
      quantity: checkoutType == CheckoutType.express
          ? state.products.entries.first.value.quantity
          : null,
    );

    return res.fold((l) {
      return emit(state.copyWith(
          isCouponLoading: false,
          isLoading: false,
          couponHasError: true,
          couponMessage: l.message));
    }, (ApplyCouponResponseModal r) {
      return emit(state.copyWith(
          couponStateModal: r.toCouponStateModal(),
          isCouponLoading: false,
          isLoading: false,
          orderTotal: r.total,
          subTotal: r.subTotal,
          discount: r.discount,
          couponMessage: 'Coupon Applied'));
    });
  }

  FutureOr<void> cartServerToStateMapper(Either<Failure, CartServerModal> res,
      Emitter<CheckoutState> emit, CheckoutState state) {
    int quantity = 0;
    return res.fold((l) {
      Map<String, ProductCartModal> products = {};
      return emit(state.copyWith(
          isCouponLoading: false,
          cartQuantity: quantity,
          cartTotal: 0.0,
          products: products,
          isLoading: false,
          isItemsLoading: false,
          discount: 0,
          orderTotal: 0,
          subTotal: 0,
          checkoutType: CheckoutType.initial,
          onSession: false));
    }, (serverCartData) async {
      // serverCartData.orderTotalWithinStripeRange
      Map<String, ProductCartModal> products = {};
      for (var item in serverCartData.products) {
        quantity = quantity + item.quantity;
        products[item.product.id] =
            item.product.toProductCartModalWithQuantity(item.quantity);
      }
      return emit(state.copyWith(
        isItemsLoading: false,
        orderTotalWithinStripeRange: serverCartData.orderTotalWithinStripeRange,
        isCouponLoading: false,
        cartQuantity: quantity,
        cartTotal: products.entries.fold(
            0,
            (previousValue, element) =>
                previousValue + element.value.price * element.value.quantity),
        products: products,
        couponStateModal: serverCartData.coupon.isNotEmpty
            ? serverCartData.toCouponStateModal()
            : null,
        isLoading: false,
        discount: serverCartData.discount,
        orderTotal: serverCartData.orderTotal,
        subTotal: serverCartData.subTotal,
      ));
    });
  }
}
