part of 'auth_bloc.dart';

@Freezed()
class AuthState with _$AuthState {
  const factory AuthState() = _AuthState;

  const factory AuthState.authenticated(
      {required AuthDataModal authDataModal,
      required bool shouldSyncLocalCartToServer}) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.unknown() = AuthUnknown;
}
