part of 'user_profile_bloc.dart';

@freezed
class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.started() = UserProfileEventStarted;
  const factory UserProfileEvent.fetchOrders() = UserProfileEventFetchOrders;
  const factory UserProfileEvent.fetchProfile() = UserProfileEventFetchProfile;
  const factory UserProfileEvent.reset() = UserProfileEventReset;
  const factory UserProfileEvent.updateAddress(
          BillingAddressModal billingAddressModal, PhoneNumber? phoneNumber) =
      UserProfileEventUpdateAddress;
  const factory UserProfileEvent.getMetrics() = UserProfileEventGeMetrics;

  const factory UserProfileEvent.postAReview({
    required double ratingCount,
    required String comment,
    required String productId,
    required String orderId,
  }) = UserProfileEventPostAReview;
  const factory UserProfileEvent.updateReview({
    required double ratingCount,
    required String comment,
    required String reviewId,
  }) = UserProfileEventupdateReview;

  const factory UserProfileEvent.setSnackBar(bool show, String? message) =
      UserProfileEventsetSnackBar;

  //setters
  const factory UserProfileEvent.setReviewComment(String comment) =
      UserProfileEventsetReviewComment;
  const factory UserProfileEvent.setReviewCount(double count) =
      UserProfileEventsetReviewCount;
  const factory UserProfileEvent.setProductToReview(
      {required String productId,
      required String orderId}) = UserProfileEventsetProductToReview;
  const factory UserProfileEvent.setReviewToInitial() =
      UserProfileEventsetReviewToInitial;
  const factory UserProfileEvent.getCurrentReview(
      {required String productId,
      required String orderId}) = UserProfileEventgetCurrentReview;

  const factory UserProfileEvent.changePage(ProfileCurrPage page) =
      UserProfileEventchangePage;

  const factory UserProfileEvent.saveMyProfile(
      {required Map<String, dynamic> data,
      CountryModal? country}) = UserProfileEventsaveMyProfile;

  const factory UserProfileEvent.cancelSubscription(String id) =
      UserProfileEventcancelSubscription;
  const factory UserProfileEvent.setOrderDetailsToInitial() =
      UserProfileEventsetOrderDetailsToInitial;
  const factory UserProfileEvent.setOrderListToInitial() =
      UserProfileEventsetOrderListToInitial;

  const factory UserProfileEvent.subscribeOrUnsubscribeToMailingList(
          {required MailingListSubscribeAction mailingListSubscribeAction,
          required String email}) =
      UserProfileEventsetSubscribeOrUnsubscribeToMailingList;
}

enum ProfileCurrPage { initial, review, profile, orderDetails, myOrders }

enum MailingListSubscribeAction { subscribe, unSubscribe }
