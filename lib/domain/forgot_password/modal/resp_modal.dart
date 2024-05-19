class ForgotPassRespModal {
  ForgotPassRespModal({
    required this.message,
  });

  final String message;
}

class OtpSubmitResponseModalError {
  OtpSubmitResponseModalError({
    required this.message,
  });

  final String message;
}

class OtpSubmitResponseModalSuccess {
  OtpSubmitResponseModalSuccess({
    required this.token,
  });

  final String token;
}

class OtpChangePasswordResponseModalSuccess {
  OtpChangePasswordResponseModalSuccess({
    required this.message,
  });

  final String message;
}
