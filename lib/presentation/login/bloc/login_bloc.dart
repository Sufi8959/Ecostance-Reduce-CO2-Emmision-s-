import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/app_controller/state_classes/settings.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/login/repository/repository.dart';
import 'package:net_carbons/data/register/repository/repository.dart';
import 'package:net_carbons/domain/auth/model/modals.dart';

import '../../../app/dependency.dart';
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;
  final AppControllerBloc appControllerBloc;

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

  AuthBloc authBloc;
  LoginBloc(
      {required this.appControllerBloc,
      required this.repository,
      required this.authBloc})
      : super(const LoginInitial(
            loginCurrentPage: LoginCurrentPage.initial,
            isLoading: false,
            loginStatus: LoginStatus.initial)) {
    currency = appControllerBloc.state.currency;
    appControllerBloc.stream.listen((event) {
      appControllerState = event;
      currency = event.currency;
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final response = await repository.login(event.loginRequest);
      return response.fold((fail) {
        print(fail.message);
        if (fail is AccountHold) {
          emit(state.copyWith(
              isLoading: false,
              loginStatus: LoginStatus.failed,
              showASnackBar: true,
              snackMessage: fail.message));
          return;
        }
        emit(state.copyWith(
            isLoading: false,
            loginStatus: LoginStatus.failed,
            showASnackBar: true,
            snackMessage: fail.message));
      }, (success) async {
        getIt<DioManager>().updateHeaderToken(success.token);
        emit(state.copyWith(authDataModal: success));
        try {
          await FirebaseMessaging.instance
              .getToken()
              .then((value) => repository.updateFcmToken(value ?? ''));
        } catch (e) {
          print(e);
        }

        return await repository
            .setCurrency(currency)
            .then((value) => value.fold((l) async {
                  await repository
                      .setCurrency("USD")
                      .then((value) => value.fold((l) {
                            authBloc.add(const AuthEvent.logoutRequested());
                            return emit(state.copyWith(
                              loginStatus: LoginStatus.failed,
                              authDataModal: null,
                              isLoading: false,
                            ));
                          }, (r) {
                            appControllerBloc.add(
                                const AppControllerEvent.updateCurrency(
                                    currency: "USD"));
                            authBloc.add(AuthLoggedIn(
                                authDataModal: success,
                                shouldSyncLocalCartToServer: true));

                            if (success.user.emailVerificationStatus ==
                                "VERIFIED") {
                              return emit(state.copyWith(
                                  loginStatus: LoginStatus.success,
                                  isLoading: false));
                            } else {
                              return emit(state.copyWith(
                                  loginStatus: LoginStatus.unVerified,
                                  isLoading: false));
                            }
                          }));
                }, (r) {
                  authBloc.add(AuthLoggedIn(
                      authDataModal: success,
                      shouldSyncLocalCartToServer: true));
                  if (success.user.emailVerificationStatus == "VERIFIED") {
                    return emit(state.copyWith(
                        loginStatus: LoginStatus.success, isLoading: false));
                  } else {
                    return emit(state.copyWith(
                        loginStatus: LoginStatus.unVerified, isLoading: false));
                  }
                }));
      });
    });
    on<LoginSetPage>((event, emit) =>
        emit(state.copyWith(loginCurrentPage: event.loginCurrentPage)));

    on<LogoutRequested>((event, emit) => {
          emit(const LoginState.initial(
              loginCurrentPage: LoginCurrentPage.initial,
              isLoading: false,
              loginStatus: LoginStatus.initial))
        });
    on<SetToInitial>((event, emit) => emit(const LoginState.initial(
        loginCurrentPage: LoginCurrentPage.initial,
        isLoading: false,
        loginStatus: LoginStatus.initial)));

    on<LoginSetSnackBar>((event, emit) => emit(state.copyWith(
        snackMessage: event.snackMessage, showASnackBar: event.showSnackBar)));
  }
}
