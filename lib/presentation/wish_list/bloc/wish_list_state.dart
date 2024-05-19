part of 'wish_list_bloc.dart';

@Freezed()
class WishListState with _$WishListState {
  const factory WishListState(
      {required List<ProductModal> items,
      required bool isLoading}) = _WishListState;

  factory WishListState.initial() =>
      const WishListState(items: [], isLoading: false);
}
