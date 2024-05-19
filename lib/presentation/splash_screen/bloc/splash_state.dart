part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial(
      {required AuthState authState,
      required InternetState internetState,
      required bool isPageActive}) = _Initial;
}
