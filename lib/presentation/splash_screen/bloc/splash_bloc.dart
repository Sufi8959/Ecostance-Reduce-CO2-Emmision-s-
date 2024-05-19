import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/internet_bloc/internet_bloc.dart';
import 'package:net_carbons/app/internet_bloc/internet_state.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthBloc authBloc;
  final InternetBloc internetBloc;
  SplashBloc({required this.authBloc, required this.internetBloc})
      : super(_Initial(
            authState: const AuthState(),
            internetState: InternetState(isPopupOpen: false),
            isPageActive: false)) {
    authBloc.stream.listen((event) {
      add(SplashEvent.authStateChanged(authState: event));
    });

    internetBloc.stream.listen((event) {
      if (event is ConnectedState) {
        authBloc.add(const AuthEvent.appStarted());
      }

      add(SplashEvent.connectionChanged(internetState: event));
    });

    on<SplashEventConnectionChange>((event, emit) {
      emit(state.copyWith(internetState: event.internetState));
    });

    on<SplashEventAuthChange>((event, emit) {
      emit(state.copyWith(authState: event.authState));
    });
  }
}
