import 'package:dartz/dartz.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/user_profile/save_calculations_payload/save_calculations_payload.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';

abstract class IUserProfileRepository<T> {
  Future<Either<Failure, T>> getUserProfile();

  Future<Either<Failure, T>> getOrderList(String currency,int page);
  Future<Either<Failure, T>> createOrUpdateAddress(
      BillingAddressModal billingAddressResponse,PhoneNumber? phoneNumber);
  Future<Either<Failure, T>> getMetricsData();
  Future<Either<Failure, T>> getCertificateDetails(String certificateId);

  Future<Either<Failure, T>> cancelASubscription(String id);
  Future<Either<Failure, T>> saveProfile(Map<String, dynamic> data);
  Future<Either<Failure, T>> postAReview(
      {required double ratingCount,
      required String comment,
      required String productId,
      required String orderId});

  Future<Either<Failure, T>> getReviewByOrderIdProductId(
      {required String orderId, required String productId});

  Future<Either<Failure, T>> updateReview(
      {required double ratingCount,
      required String comment,
      required String reviewId});

  Future<void> setNotificationEnabledStatusTrueIfNoKey();
  Future<void> setNotificationEnabledStatus(bool newStatus);
  Future<bool?> getNotificationEnabledStatus();

  Future<Either<Failure, T>> saveEmission(
      SaveCalculationsPayload saveCalculationsPayload);

  Future<Either<Failure, T>> saveEmissionToLocalStorage(
      SaveCalculationsPayload saveCalculationsPayload);

  Future<Either<Failure, T>> getEmissionToLocalStorage();
  Future<Either<Failure, T>> clearLocalStorageEmission();

  Future<Either<Failure, T>> subscribeToNewsletter(String email);
  Future<Either<Failure, T>> unSubscribeFromNewsletter(String email);

  Future<Either<Failure, T>> updatePrimaryEmail(String email);
  Future<Either<Failure, T>> verifyPrimaryEmailOtp(String otp);
  Future<Either<Failure, T>> verifyPrimaryEmailUsingPassword(
      String password, String token);

  Future<Either<Failure, T>> updateRecoveryEmail(String email);
  Future<Either<Failure, T>> verifyRecoveryEmailOtp(String otp);

  Future<Either<Failure, T>> getEmailUpdateAttempts();
}
