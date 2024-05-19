part of 'splash_bloc.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.started() = _Started;

  const factory SplashEvent.connectionChanged(
      {required InternetState internetState}) = SplashEventConnectionChange;

  const factory SplashEvent.authStateChanged({required AuthState authState}) =
      SplashEventAuthChange;

  const factory SplashEvent.setPageState({required bool newState}) =
      SplashEventSetPageState;
}
