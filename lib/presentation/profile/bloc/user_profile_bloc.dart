import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:net_carbons/app/constants/a2_a3.dart';
import 'package:net_carbons/app/constants/a3_a2.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/domain/countries/model/country_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/metrics_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/my_orders_list.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../../../app/app_controller/app_controller_bloc.dart';
import '../../../app/auth/auth_bloc.dart';
import '../../../app/dependency.dart';
import '../../../data/product/repository/repository.dart';

part 'user_profile_bloc.freezed.dart';
part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final AuthBloc authBloc;
  final CartBloc cartBloc;
  final AppControllerBloc appControllerBloc;
  late StreamSubscription authSub;
  final userProfileRepository = getIt<UserProfileRepository>();
  UserProfileBloc({
    required this.appControllerBloc,
    required this.authBloc,
    required this.cartBloc,
  }) : super(_Initial(
            isLoading: false,
            hasError: false,
            dashboardMetricsModal: DashboardMetricsModal.zero(),
            postReviewInProgress: false,
            postReviewStatus: PostReviewStatus.initial,
            showASnackBar: false,
            reviewCount: 0,
            selectedProductIdToReview: '',
            profileCurrPage: ProfileCurrPage.initial,
            cancelSubLoading: false,
            subscriptionStatus: CancelSubscriptionStatus.initial,
            saveProfileStatus: SaveProfileStatus.initial,
            selectedOrderIdToReview: '',
            reviewLoading: false,
            reviewAction: ReviewAction.initial,
            ordersMetadata: MetadataModal(
                total: 0, totalPages: 0, currentPage: 0, nextPage: 1),
            myOrders: [],
            isOrdersLoading: false,
            isOrdersMoreLoading: false,
            ordersCurrentPage: 1,
            ordersHasMore: true)) {
    authBloc.stream.listen((event) {
      print("=========================");
      print(event);
      print(event.toString());
      if (event is Authenticated) {
        add(UserProfileEvent.saveMyProfile(data: {
          'selectedCountry': appControllerBloc.state.countryModal?.countryCode
        }));
        Future.delayed(const Duration(seconds: 1), () {
          add(const UserProfileEvent.started());
        });
      }
      if (event is Unauthenticated) {
        add(const UserProfileEvent.started());
        add(const UserProfileEvent.fetchProfile());
        add(const UserProfileEvent.fetchOrders());
      }
    });

    on<UserProfileEventStarted>((event, emit) async {
      if (state.userProfileModal == null) {
        if (authBloc.state is Authenticated) {
          add(const UserProfileEvent.fetchProfile());
        }
      }
      emit(state);
    });
    on<UserProfileEventFetchProfile>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      if (authBloc.state is Authenticated) {
        final userProfile = await userProfileRepository.getUserProfile();
        userProfile.fold((l) {
          if (l is UnAuthorizedFailure) {
            authBloc.add(const AuthEvent.logoutRequested());
          }
          return emit(state.copyWith(hasError: true, isLoading: false));
        },
            (r) => emit(state.copyWith(
                hasError: false, isLoading: false, userProfileModal: r)));
      } else {
        emit(state.copyWith(isLoading: false, hasError: true));
      }
    });
    on<UserProfileEventsetOrderListToInitial>((event, emit) => emit(
        state.copyWith(
            ordersMetadata: MetadataModal(
                total: 0, totalPages: 0, currentPage: 0, nextPage: 1),
            myOrders: [],
            isOrdersLoading: false,
            ordersHasMore: true,
            isOrdersMoreLoading: false,
            ordersCurrentPage: 1)));

    on<UserProfileEventFetchOrders>((event, emit) async {
      if (authBloc.state is Authenticated) {
        if (!state.ordersHasMore) {
          return;
        }
        if (state.isOrdersMoreLoading) {
          return;
        }
        state.ordersCurrentPage == 1
            ? emit(state.copyWith(isOrdersLoading: true))
            : emit(state.copyWith(isOrdersMoreLoading: true));

        final orderList = await userProfileRepository.getOrderList(
            appControllerBloc.state.currency, state.ordersCurrentPage);

        return orderList.fold((l) {
          emit(
            state.copyWith(
                isOrdersLoading: false,
                isOrdersMoreLoading: false,
                isLoading: false,
                ordersHasMore: true),
          );
        }, (orderListModal) async {
          print("Orders History Length:");

          print(state.myOrders.length);

          // if (state.myOrders.isEmpty) {
          //   SharedPreferences prefs = await SharedPreferences.getInstance();
          //
          //   String? deep_link_data = prefs.getString('deep_link_data');
          //
          //   if (deep_link_data != null && deep_link_data.isNotEmpty) {
          //     prefs.setBool('gift_coupon', true);
          //     print("setBool: --> true");
          //   }
          // }

          final newList = [...state.myOrders, ...orderListModal.orders];
          return emit(state.copyWith(
              ordersCurrentPage: orderListModal.orders.length < 3
                  ? state.ordersCurrentPage
                  : state.ordersCurrentPage + 1,
              isOrdersLoading: false,
              isOrdersMoreLoading: false,
              myOrders: newList,
              ordersHasMore:
                  orderListModal.metadata.nextPage == null ? false : true,
              ordersMetadata: orderListModal.metadata,
              hasError: false));
        });
      } else {
        print("Orders History Error");

        emit(state.copyWith(isOrdersLoading: false, hasError: true));
      }
    });

    on<UserProfileEventGeMetrics>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await userProfileRepository.getMetricsData();

      res.fold((l) {
        return emit(state.copyWith(isLoading: false, hasError: true));
      },
          (r) => emit(state.copyWith(
              dashboardMetricsModal: r, isLoading: false, hasError: false)));
    });

    on<UserProfileEventReset>((event, emit) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        userProfileModal: null,
        myOrders: [])));

    on<UserProfileEventsetProductToReview>((event, emit) => emit(state.copyWith(
        selectedProductIdToReview: event.productId,
        selectedOrderIdToReview: event.orderId)));

    on<UserProfileEventsetReviewComment>(
        (event, emit) => emit(state.copyWith(reviewComment: event.comment)));

    on<UserProfileEventsetReviewCount>(
        (event, emit) => emit(state.copyWith(reviewCount: event.count)));

    on<UserProfileEventchangePage>(
        (event, emit) => emit(state.copyWith(profileCurrPage: event.page)));

    on<UserProfileEventgetCurrentReview>((event, emit) async {
      emit(state.copyWith(reviewLoading: true));
      return await userProfileRepository
          .getReviewByOrderIdProductId(
              orderId: event.orderId, productId: event.productId)
          .then((value) {
        return value.fold((l) {
          return emit(state.copyWith(
              reviewLoading: false,
              reviewComment: '',
              reviewCount: 0,
              reviewAction: ReviewAction.create));
        }, (r) {
          return emit(state.copyWith(
              reviewLoading: false,
              reviewComment: r.data.comment,
              reviewAction: ReviewAction.update,
              reviewToUpdateId: r.data.id,
              reviewCount: r.data.rating));
        });
      });
    });

    on<UserProfileEventsetReviewToInitial>((event, emit) => emit(state.copyWith(
        reviewCount: 0,
        reviewComment: '',
        selectedProductIdToReview: '',
        postReviewErrorMessage: '',
        postReviewInProgress: false,
        selectedOrderIdToReview: '',
        reviewToUpdateId: '',
        reviewAction: ReviewAction.initial,
        reviewLoading: false,
        postReviewStatus: PostReviewStatus.initial)));

    on<UserProfileEventPostAReview>((event, emit) async {
      print("UserProfileEventPostAReview");
      emit(state.copyWith(
          postReviewInProgress: true,
          postReviewStatus: PostReviewStatus.loading));
      return await userProfileRepository
          .postAReview(
              ratingCount: event.ratingCount,
              comment: event.comment,
              productId: event.productId,
              orderId: event.orderId)
          .then((value) => value.fold((l) {
                PostReviewStatus postReviewStatus = PostReviewStatus.error;
                if (l is ReviewAlreadyAdded) {
                  postReviewStatus = PostReviewStatus.alreadyAdded;
                }
                return emit(state.copyWith(
                    postReviewStatus: postReviewStatus,
                    postReviewInProgress: false,
                    showASnackBar: true,
                    postReviewErrorMessage: l.message));
              },
                  (r) => emit(state.copyWith(
                      postReviewInProgress: false,
                      showASnackBar: true,
                      snackMessage: "Review added",
                      postReviewStatus: PostReviewStatus.success))));
    });
    on<UserProfileEventupdateReview>((event, emit) async {
      emit(state.copyWith(reviewLoading: true));
      final res = await userProfileRepository.updateReview(
          ratingCount: event.ratingCount,
          comment: event.comment,
          reviewId: event.reviewId);
      return res.fold((l) {
        return emit(state.copyWith(
            reviewLoading: false,
            snackMessage: l.message,
            showASnackBar: true));
      },
          (r) => emit(state.copyWith(
              reviewLoading: false,
              snackMessage: "Updated ",
              showASnackBar: true)));
    });
    on<UserProfileEventcancelSubscription>((event, emit) async {
      emit(state.copyWith(
          cancelSubLoading: true,
          subscriptionStatus: CancelSubscriptionStatus.loading));

      return await userProfileRepository
          .cancelASubscription(event.id)
          .then((value) => value.fold((l) {
                return emit(state.copyWith(
                    cancelSubLoading: false,
                    showASnackBar: true,
                    snackMessage: l.message,
                    subscriptionStatus: CancelSubscriptionStatus.failed,
                    cancelSubMessage: l.message));
              }, (r) {
                return emit(state.copyWith(
                    cancelSubLoading: false,
                    showASnackBar: true,
                    snackMessage: 'Subscription cancelled',
                    subscriptionStatus:
                        CancelSubscriptionStatus.cancelledSuccess));
              }));
    });

    on<UserProfileEventsetOrderDetailsToInitial>((event, emit) => emit(
        state.copyWith(
            cancelSubLoading: false,
            subscriptionStatus: CancelSubscriptionStatus.initial,
            cancelSubMessage: '')));

    on<UserProfileEventsetSnackBar>((event, emit) => emit(state.copyWith(
        showASnackBar: event.show, snackMessage: event.message)));

    on<UserProfileEventUpdateAddress>((event, emit) async {
      await userProfileRepository.createOrUpdateAddress(
          event.billingAddressModal, event.phoneNumber);

      final dataMap = {
        'firstName': event.billingAddressModal.firstName,
        'lastName': event.billingAddressModal.lastName,
      };

      if (event.phoneNumber != null) {
        String code = event.phoneNumber!.countryISOCode.length == 3
            ? event.phoneNumber!.countryISOCode
            : countryCodesConvertA2ToA3(
                    a2Code: event.phoneNumber!.countryISOCode) ??
                '';
        dataMap.addAll({
          'number': event.phoneNumber!.number.replaceAll(RegExp(r"\D"), ''),
          'numericCode': event.phoneNumber!.countryCode,
          'countryCode': code,
        });
      }
      await userProfileRepository.saveProfile(dataMap);
      add(const UserProfileEvent.fetchProfile());
    });

    ///
    on<UserProfileEventsaveMyProfile>((event, emit) async {
      print("=======event.data=======>${event.data}");
      emit(state.copyWith(
          isLoading: true, saveProfileStatus: SaveProfileStatus.loading));

      return await userProfileRepository
          .saveProfile(event.data)
          .then((value) => value.fold((l) {
                add(const UserProfileEvent.fetchProfile());
                return emit(state.copyWith(
                    isLoading: false,
                    snackMessage: 'Error in saving profile',
                    showASnackBar: true,
                    saveProfileStatus: SaveProfileStatus.failed));
              }, (r) {
                if (event.data['checkoutDefaultCurrency'] != null) {
                  appControllerBloc.add(AppControllerEvent.updateCurrency(
                      currency: event.data['checkoutDefaultCurrency']));
                  cartBloc.add(CartEvent.changeCurrency(
                      event.data['checkoutDefaultCurrency']));
                }

                if (event.country != null) {
                  appControllerBloc.add(AppControllerEvent.updateCountry(
                      countryModal: event.country!));
                }

                add(const UserProfileEvent.fetchProfile());
                return emit(state.copyWith(
                    snackMessage: 'Profile Saved',
                    showASnackBar: true,
                    isLoading: false,
                    saveProfileStatus: SaveProfileStatus.success));
              }));
    });

    on<UserProfileEventsetSubscribeOrUnsubscribeToMailingList>(
        (event, emit) async {
      if (event.mailingListSubscribeAction ==
          MailingListSubscribeAction.subscribe) {
        return await userProfileRepository
            .subscribeToNewsletter(event.email)
            .then((value) => value.fold((l) {
                  add(const UserProfileEvent.fetchProfile());
                }, (r) {
                  add(const UserProfileEvent.fetchProfile());
                }));
      } else if (event.mailingListSubscribeAction ==
          MailingListSubscribeAction.unSubscribe) {
        return await userProfileRepository
            .unSubscribeFromNewsletter(event.email)
            .then(
              (value) => value.fold(
                (l) {
                  add(const UserProfileEvent.fetchProfile());
                },
                (r) {
                  add(const UserProfileEvent.fetchProfile());
                },
              ),
            );
      }
    });
  }
////
}

//
// Future<MyOrdersListModal> _getOrders() async {
//   final orderList = await userProfileRepository.getOrderList();
//
//   return orderList.fold((l) {
//     return MyOrdersListModal(orders: [], metadata: MetadataModal.empty());
//   }, (orderListModal) async {
//     List<OrderFetchModal> orders = [];
//     for (var order in orderListModal.orders) {
//       List<OrderProductModal> orderProductList = [];
//       for (var product in order.products) {
//         final res = await productRep.fetchProductData(product.id,
//             appControllerBloc.state.countryModal?.currencyCode ?? "USD");
//         res.fold((l) {
//           orderProductList.add(product);
//         }, (r) {
//           orderProductList.add(product.copyWith(productModal: r));
//         });
//       }
//       orders.add(order.copyWith(products: orderProductList));
//     }
//     return MyOrdersListModal(orders: orders, count: orders.length);
//   });
// }
