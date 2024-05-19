part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.setToIntital() = SetToInitial;
  const factory LoginEvent.usernameChanged({
    required String username,
  }) = UsernameChanged;
  const factory LoginEvent.passwordChanged({
    required String password,
  }) = PasswordChanged;
  const factory LoginEvent.loginButtonPressed(
      {required LoginRequest loginRequest}) = LoginButtonPressed;

  const factory LoginEvent.emailVerified(
      {required AuthDataModal authDataModal}) = LoginEmailVerified;

  const factory LoginEvent.logoutRequested() = LogoutRequested;

  const factory LoginEvent.setSnackBar(
      {required bool showSnackBar,
      required String snackMessage}) = LoginSetSnackBar;

  const factory LoginEvent.setPage(
      {required LoginCurrentPage loginCurrentPage}) = LoginSetPage;
}
