import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/domain/user_profile/modal/get_review_by_orderId_productId_modal.dart';

import 'data.dart';

part 'get_review_by_order_product_ids_response.g.dart';

@JsonSerializable()
class GetReviewByOrderProductIdsResponse {
  bool? success;
  GetReviewByOrderProductIdsResponseData? data;

  GetReviewByOrderProductIdsResponse({this.success, this.data});

  factory GetReviewByOrderProductIdsResponse.fromJson(
      Map<String, dynamic> json) {
    return _$GetReviewByOrderProductIdsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetReviewByOrderProductIdsResponseToJson(this);
  }
}

extension GetReviewByOrderProductIdsResponseToDomain
    on GetReviewByOrderProductIdsResponse? {
  GetReviewByOrderProductIdsModal toDomain() {
    return GetReviewByOrderProductIdsModal(
        success: this?.success ?? false,
        data: this?.data.toDomain() ?? GetReviewByOrderProductIdsData.empty());
  }
}

extension GetReviewByOrderProductIdsResponseDataToModal
    on GetReviewByOrderProductIdsResponseData? {
  GetReviewByOrderProductIdsData toDomain() => GetReviewByOrderProductIdsData(
        id: this?.id.orEmpty() ?? '',
        product: this?.product.orEmpty() ?? '',
        customer: this?.customer.orEmpty() ?? '',
        order: this?.order.orEmpty() ?? '',
        rating: this?.rating.orZero() ?? 0,
        comment: this?.comment.orEmpty() ?? '',
        isReviewed: this?.isReviewed ?? false,
        status: this?.status.orZero() ?? 0,
        createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        v: this?.v.orZero() ?? 0,
      );
}
