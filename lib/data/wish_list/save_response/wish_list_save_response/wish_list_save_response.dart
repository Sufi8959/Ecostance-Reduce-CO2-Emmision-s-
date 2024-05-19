import 'package:json_annotation/json_annotation.dart';

import 'wishlist.dart';

part 'wish_list_save_response.g.dart';

@JsonSerializable()
class WishListSaveResponse {
  WishlistResponse? wishlist;

  WishListSaveResponse({this.wishlist});

  factory WishListSaveResponse.fromJson(Map<String, dynamic> json) {
    return _$WishListSaveResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WishListSaveResponseToJson(this);
}
