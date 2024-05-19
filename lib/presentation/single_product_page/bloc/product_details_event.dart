part of 'product_details_bloc.dart';

@freezed
class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.started(
      {required List<String> productIds}) = ProductDetailsEventStarted;
  const factory ProductDetailsEvent.loadProductWithI(
      {required String productId}) = ProductDetailsEventLoadProductWithId;
  const factory ProductDetailsEvent.loadProductWithIndex({required int index}) =
      ProductDetailsEventLoadProductWithIndex;
  const factory ProductDetailsEvent.viewComplete() =
      ProductDetailsEventViewComplete;

  const factory ProductDetailsEvent.getReviews(String productId) =
      ProductDetailsEventGetReviews;
}
