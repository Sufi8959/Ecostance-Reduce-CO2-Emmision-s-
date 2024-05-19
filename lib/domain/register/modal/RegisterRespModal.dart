import 'package:net_carbons/domain/auth/model/modals.dart';

class RegisterRespModal {
  RegisterRespModal({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  bool success;
  String message;
  UserModel user;
  String token;
}

class VerifyOtpResponseModal {
  bool success;

  VerifyOtpResponseModal(this.success);
}
