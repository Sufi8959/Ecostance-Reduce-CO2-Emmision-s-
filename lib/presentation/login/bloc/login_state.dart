part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial(
      {required LoginCurrentPage loginCurrentPage,
      required bool isLoading,
      required LoginStatus loginStatus,
      AuthDataModal? authDataModal,
      bool? showASnackBar,
      String? snackMessage}) = LoginInitial;

  //
  // const factory LoginState.loading({required LoginCurrentPage loginCurrentPage}) = LoginLoading;
  // const factory LoginState.authenticated({required LoginCurrentPage loginCurrentPage}) = LoginAuthenticated;
  // factory LoginState.unverified({required AuthDataModal authDataModal,required LoginCurrentPage loginCurrentPage}) =
  //     LoginAuthenticatedUnVerified;
  // const factory LoginState.failiure(Failure failiure,{required LoginCurrentPage loginCurrentPage}) = LoginFaliure;
}

enum LoginCurrentPage { initial, loginPage }

enum LoginStatus { initial, success, failed, unVerified }
