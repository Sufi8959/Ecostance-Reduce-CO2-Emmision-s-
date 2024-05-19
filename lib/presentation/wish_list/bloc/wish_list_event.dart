part of 'wish_list_bloc.dart';

@freezed
class WishListEvent with _$WishListEvent {
  const factory WishListEvent.started() = Started;
  const factory WishListEvent.addItem({required ProductModal product}) =
      AddItem;
  const factory WishListEvent.removeItem({required ProductModal product}) =
      RemoveItem;
}
