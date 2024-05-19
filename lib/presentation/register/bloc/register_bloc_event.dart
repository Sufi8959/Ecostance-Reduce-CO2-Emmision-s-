part of 'register_bloc_bloc.dart';

@freezed
class RegisterBlocEvent with _$RegisterBlocEvent {
  const factory RegisterBlocEvent.registerButtonPressed({
    required RegisterRequest registerRequest,
  }) = RegisterBlocEventregisterButtonPressed;
  // const factory RegisterBlocEvent.started() = RegisterBlocEvent;

  const factory RegisterBlocEvent.setNewsLetter(bool newVal) =
      RegisterBlocEventsetNewsLetter;
  const factory RegisterBlocEvent.setTerms(bool newVal) =
      RegisterBlocEventsetTerms;
  const factory RegisterBlocEvent.setPasswordStrength(
      {required String text,
      required int strength}) = RegisterBlocEventsetPasswordStrength;

  // const factory RegisterBlocEvent.started() = RegisterBlocEvent;

  const factory RegisterBlocEvent.changePage(RegCurrentPage regCurrentPage) =
      RegisterBlocEventchangePage;

  const factory RegisterBlocEvent.setToInitial() =
      RegisterBlocEventsetToInitial;
  const factory RegisterBlocEvent.removeSnack() = RegisterBlocEventremoveSnack;
}
