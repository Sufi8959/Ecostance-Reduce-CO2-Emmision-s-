import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/app_controller/state_classes/settings.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/product/repository/repository.dart';
import 'package:net_carbons/data/wish_list/repository/repository.dart';
import 'package:net_carbons/data/wish_list/response/wish_list_fetch_response/wish_list_fetch_response.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/domain/wish_list/modals/modals.dart';

import '../../../app/app_controller/app_controller_bloc.dart';
import '../../../app/auth/auth_bloc.dart';
import '../../../app/dependency.dart';

part 'wish_list_bloc.freezed.dart';
part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  final WishListRepo wishListRepo;
  final productRepo = getIt<SingleProductRepository>();
  final AuthBloc authBloc;
  final AppControllerBloc appControllerBloc;
  AuthState authState = const AuthState.unauthenticated();

  AppControllerState appControllerState = AppControllerState.initial(
      isLoading: false,
      countries: [],
      currencyList: [],
      currency: 'USD',
      appCustomSettings: AppCustomSettings(notificationEnabled: false),
      buildApp: false,
      showSnackBar: false,
      appLevelSnackBar: AppLevelSnackBar.empty());
  String currency = 'USD';

  late StreamSubscription authSubs;

  WishListBloc(
      {required this.appControllerBloc,
      required this.authBloc,
      required this.wishListRepo})
      : super(WishListState.initial()) {
//Bloc streams
    authBloc.stream.listen((event) {
      authState = event;
      add(const WishListEvent.started());
    });
    appControllerState = appControllerBloc.state;
    currency = appControllerState.currency;
    appControllerBloc.stream.listen((event) {
      if (event.appControllerEventsType ==
          AppControllerEventsType.appControllerEventUpdateCurrency) {
        add(const WishListEvent.started());
      }
      appControllerState = event;
      currency = event.currency;
    });

    on<AddItem>((event, emit) {
      final newState = state.copyWith(items: [...state.items, event.product]);

      _saveWishList(newState);
      emit(newState);
    });
    on<RemoveItem>((event, emit) {
      final newState = state.copyWith(
          items: state.items
              .where((item) => item.id != event.product.id)
              .toList());

      _saveWishList(newState);
      emit(newState);
    });

    on<Started>((event, emit) async {
      List<ProductModal> products = [];

      if (authState is Unauthenticated) {
        emit(state.copyWith(isLoading: true));
        final res = await wishListRepo.getWishList();
        res.fold((l) => {}, (wishList) {
          wishList.list.forEach((element) async {
            final res = await productRepo.fetchProductData(element, currency);
            res.fold((l) => {}, (r) {
              products.add(r);
            });
          });
        });
        emit(state.copyWith(items: products, isLoading: false));
      } else if (authState is Authenticated) {
        emit(state.copyWith(isLoading: true));
        final res = await wishListRepo.getwishListFromServer();
        await res.fold((l) {
          // if (l is AccountHold) {
          //   authBloc.add(AuthEvent.logoutRequested());
          //   appControllerBloc.add(AppControllerEvent.setAppSnackBar(
          //       AppLevelSnackBar(
          //           message:
          //               "Your account is on hold, Please reset your password by clicking forgot password",
          //           duration: Duration(days: 360),
          //           showSnack: true)));
          // }
        }, (wishList) async {
          wishList.products?.forEach((element) {
            products.add(element.product.toProductModal(currency));
          });
        });
        emit(state.copyWith(items: products, isLoading: false));
      }
    });
  }

  _saveWishList(WishListState wishListState) {
    if (authState is Authenticated) {
      wishListRepo.savewishListToServer(WishListLocalModal(
          list: wishListState.items.map((e) => e.id).toList()));
    } else if (authState is Unauthenticated) {
      wishListRepo.saveWishListToLocal(WishListLocalModal(
          list: wishListState.items.map((e) => e.id).toList()));
    }
  }
}
