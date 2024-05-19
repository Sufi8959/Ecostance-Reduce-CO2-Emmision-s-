import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/app_controller/state_classes/settings.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/app/internet_bloc/internet_bloc.dart';
import 'package:net_carbons/app/internet_bloc/internet_state.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/login/repository/repository.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/domain/auth/model/modals.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepository repository;
  final UserProfileRepository userProfileRepository;
  final AppControllerBloc appControllerBloc;

  final DioManager dio;
  final InternetBloc internetBloc;
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

  InternetState internetState = DisconnectedState(isPopupOpen: false);
  AuthBloc(
      {required this.dio,
      required this.internetBloc,
      required this.appControllerBloc,
      required this.userProfileRepository,
      required this.repository})
      : super(const AuthLoading()) {
    appControllerBloc.stream.listen((event) {
      appControllerState = event;
      currency = event.currency;
    });
    internetBloc.stream.listen((event) {
      internetState = event;
    });

    on<AppStarted>((event, emit) async {
      emit(const AuthLoading());
      if (internetState is ConnectedState) {
        Either<bool, AuthDataModal> hasUserResp =
            await repository.checkHasUser();
        return hasUserResp.fold((fail) {
          emit(const Unauthenticated());
        }, (success) async {
          dio.updateHeaderToken(success.token);
          add(const AuthEvent.verifyCurrentStateToken());
          if (state is Authenticated) {
            return;
          }
          emit(Authenticated(
              authDataModal: success, shouldSyncLocalCartToServer: false));
        });
      } else {
        emit(const AuthUnknown());
      }
    });

    on<AuthEventVerifyCurrentStateToken>((event, emit) async {
      await repository.verifyToken().then((res) => res.fold((l) {
            dio.updateHeaderToken('');
            return emit(const Unauthenticated());
          }, (r) {}));
    });

    on<AuthLoggedIn>((event, emit) {
      emit(const AuthLoading());
      getIt<DioManager>().updateHeaderToken(event.authDataModal.token);
      repository.saveUser(event.authDataModal);

      emit(Authenticated(
          authDataModal: event.authDataModal,
          shouldSyncLocalCartToServer: true));
    });

    on<AuthEventSetVerified>((event, emit) {
      if (state is Authenticated) {
        UserModel userModel = UserModel.empty();
        String token = '';
        state.map((value) => null, authenticated: (v) {
          userModel = v.authDataModal.user
              .copyWith(emailVerificationStatus: event.verificationStatus);
          token = v.authDataModal.token;
        },
            unauthenticated: (Unauthenticated value) {},
            loading: (AuthLoading value) {},
            unknown: (AuthUnknown value) {});
        repository.saveUser(AuthDataModal(user: userModel, token: token));
        emit(Authenticated(
            authDataModal: AuthDataModal(user: userModel, token: token),
            shouldSyncLocalCartToServer: false));
      }
    });

    on<AuthEventLogoutRequested>((event, emit) => {
          emit(const AuthLoading()),
          repository.clearUser(),
          getIt<DioManager>().updateHeaderToken(''),
          emit(const Unauthenticated()),
        });
  }
}

enum AuthenticationStatus { unknown, authenticated, unauthenticated }
