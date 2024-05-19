import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/app_controller/state_classes/settings.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/app/internet_bloc/internet_bloc.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/login/repository/repository.dart';
import 'package:net_carbons/data/register/repository/repository.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/domain/auth/model/modals.dart';

part 'register_bloc_bloc.freezed.dart';
part 'register_bloc_event.dart';
part 'register_bloc_state.dart';

class RegisterBloc extends Bloc<RegisterBlocEvent, RegisterBlocState> {
  final RegisterRepository repository;
  final LoginRepository loginRepository;
  final UserProfileRepository userProfileRepository;
  final AuthBloc authBloc;
  final AppControllerBloc appControllerBloc;
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
  RegisterBloc(
      {required this.appControllerBloc,
      required this.internetBloc,
      required this.authBloc,
      required this.repository,
      required this.loginRepository,
      required this.userProfileRepository})
      : super(const RegisterBlocState.initial(
            isLoading: false,
            strengthText: '',
            strengthNumber: 0,
            newsLetter: false,
            terms: false,
            registrationSuccessful: false,
            otpSuccessful: false,
            regCurrentPage: RegCurrentPage.initial)) {
    currency = appControllerBloc.state.currency;
    appControllerBloc.stream.listen((event) {
      appControllerState = event;
      currency = event.currency;
    });

    on<RegisterBlocEventregisterButtonPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      if (!state.terms) {
        emit(state.copyWith(isLoading: false));
        return;
      }
      final res = await repository.register(event.registerRequest);
      return res.fold((l) {
        emit(state.copyWith(
            isLoading: false,
            showASnackBar: true,
            snackMessage: l.message.contains("already in use")
                ? "Email is already in use."
                : l.message));
      }, (success) async {
        getIt<DioManager>().updateHeaderToken(success.token);
        emit(state);
        await FirebaseMessaging.instance
            .getToken()
            .then((value) => loginRepository.updateFcmToken(value ?? ''));

        return await loginRepository
            .setCurrency(currency)
            .then((value) => value.fold((l) async {
                  return await loginRepository
                      .setCurrency("USD")
                      .then((value) => value.fold((l) {
                            authBloc.add(AuthLoggedIn(
                                authDataModal: AuthDataModal(
                                    user: success.user, token: success.token),
                                shouldSyncLocalCartToServer: true));
                            return emit(state.copyWith(
                                isLoading: false,
                                registrationSuccessful: true,
                                snackMessage: '',
                                showASnackBar: false));
                          }, (r) {
                            authBloc.add(AuthLoggedIn(
                                authDataModal: AuthDataModal(
                                    user: success.user, token: success.token),
                                shouldSyncLocalCartToServer: true));
                            return emit(state.copyWith(
                                isLoading: false,
                                registrationSuccessful: true,
                                snackMessage: '',
                                showASnackBar: false));
                          }));
                  // authBloc.add(AuthLoggedIn(
                  //     authDataModal:
                  //         AuthDataModal(user: success.user, token: success.token),
                  //     shouldSyncLocalCartToServer: true));
                  //
                  // return emit(state.copyWith(
                  //     isLoading: false,
                  //     registrationSuccessful: true,
                  //     snackMessage: '',
                  //     showASnackBar: false));
                }, (r) {
                  authBloc.add(AuthLoggedIn(
                      authDataModal: AuthDataModal(
                          user: success.user, token: success.token),
                      shouldSyncLocalCartToServer: true));

                  return emit(state.copyWith(
                      isLoading: false,
                      registrationSuccessful: true,
                      snackMessage: '',
                      showASnackBar: false));
                }));
      });
    });

    on<RegisterBlocEventsetNewsLetter>(
        (event, emit) => emit(state.copyWith(newsLetter: event.newVal)));
    on<RegisterBlocEventsetTerms>(
        (event, emit) => emit(state.copyWith(terms: event.newVal)));

    on<RegisterBlocEventsetPasswordStrength>((event, emit) => emit(state
        .copyWith(strengthNumber: event.strength, strengthText: event.text)));

    on<RegisterBlocEventremoveSnack>((event, emit) {
      return emit(state.copyWith(showASnackBar: false, snackMessage: ''));
    });

    on<RegisterBlocEventchangePage>((event, emit) =>
        emit(state.copyWith(regCurrentPage: event.regCurrentPage)));

    on<RegisterBlocEventsetToInitial>((event, emit) => emit(
        const RegisterBlocState.initial(
            regCurrentPage: RegCurrentPage.initial,
            isLoading: false,
            strengthText: '',
            strengthNumber: 0,
            newsLetter: false,
            terms: false,
            registrationSuccessful: false,
            otpSuccessful: false)));
  }
}
