part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStarted() = AppStarted;
  const factory AuthEvent.loggedIn(
      {required AuthDataModal authDataModal,
      required bool shouldSyncLocalCartToServer}) = AuthLoggedIn;
  const factory AuthEvent.statusChanged() = AuthEventStatusChanged;
  const factory AuthEvent.logoutRequested() = AuthEventLogoutRequested;

  const factory AuthEvent.verifyCurrentStateToken() =
      AuthEventVerifyCurrentStateToken;

  const factory AuthEvent.setVerified({required String verificationStatus}) =
      AuthEventSetVerified;
}
