part of 'product_details_bloc.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial(
      {required bool isLoading,
      required ProductModal productModal,
      required bool hasError,
      required List<String> productIds,
      required String currentId,
      required List<ReviewModal> currentProductReviews,
      required bool reviewHasError,
      required bool reviewLoading}) = _Initial;
}
//
