part of 'register_bloc_bloc.dart';

@freezed
class RegisterBlocState with _$RegisterBlocState {
  const factory RegisterBlocState.initial(
      {required bool isLoading,
      required String strengthText,
      required int strengthNumber,
      required bool newsLetter,
      required bool terms,
      required bool registrationSuccessful,
      required bool otpSuccessful,
      required RegCurrentPage regCurrentPage,
      bool? showASnackBar,
      String? snackMessage}) = _Initial;
}

enum RegCurrentPage { register, otp, initial }
