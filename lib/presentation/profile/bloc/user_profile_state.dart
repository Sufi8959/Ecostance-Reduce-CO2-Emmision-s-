part of 'user_profile_bloc.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial(
      {
        required MetadataModal ordersMetadata,
        required List<OrderFetchModal> myOrders,
        required bool isOrdersLoading,
        required bool isOrdersMoreLoading,
        required int ordersCurrentPage,
        required bool ordersHasMore,
        //
      UserProfileModal? userProfileModal,
      required ProfileCurrPage profileCurrPage,
      required bool isLoading,
      required bool hasError,
      required DashboardMetricsModal dashboardMetricsModal,
      required bool showASnackBar,
      String? snackMessage,
      required bool reviewLoading,
      required double reviewCount,
      required String selectedProductIdToReview,
      required String selectedOrderIdToReview,
      String? reviewComment,
      String? reviewToUpdateId,
      required ReviewAction reviewAction,
      required bool cancelSubLoading,
      String? cancelSubMessage,
      required CancelSubscriptionStatus subscriptionStatus,
      required bool postReviewInProgress,
      required PostReviewStatus postReviewStatus,
      required SaveProfileStatus saveProfileStatus,
      String? postReviewErrorMessage}) = _Initial;
}

enum PostReviewStatus { loading, success, initial, error, alreadyAdded }

enum SaveProfileStatus {
  loading,
  success,
  initial,
  failed,
}

enum ReviewAction { create, update, initial }

enum CancelSubscriptionStatus {
  loading,
  cancelledSuccess,
  subscription,
  initial,
  failed
}
