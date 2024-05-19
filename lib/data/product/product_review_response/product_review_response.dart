import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/data/product/product_review_response/customer.dart';
import 'package:net_carbons/data/product/product_review_response/user.dart';
import 'package:net_carbons/domain/product/modal/review_modals.dart';

import 'datum.dart';

part 'product_review_response.g.dart';

@JsonSerializable()
class ProductReviewResponse {
  bool? success;
  List<Datum>? data;

  ProductReviewResponse({this.success, this.data});

  factory ProductReviewResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductReviewResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductReviewResponseToJson(this);
}

extension ProductReviewResponseToModal on ProductReviewResponse? {
  ProductReviewListModal toDomain() {
    return ProductReviewListModal(
        success: this?.success ?? false,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension SingleReviewToModal on Datum? {
  ReviewModal toDomain() {
    return ReviewModal(
        id: this?.id.orEmpty() ?? '',
        product: this?.product.orEmpty() ?? '',
        customer: this?.customer.toDomain() ??
            ReviewCustomer(id: '', user: ReviewUser.empty()),
        order: this?.order.orEmpty() ?? '',
        approvedRating: this?.approvedRating ?? 0.0,
        approvedComment: this?.approvedComment.orEmpty() ?? '',
        status: this?.status.orZero() ?? 0,
        createdAt: this?.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        updatedAt: this?.updatedAt ?? DateTime.fromMicrosecondsSinceEpoch(1),
        v: this?.v.orZero() ?? 0);
  }
}

extension ProductReviewCustomerResponseToModal on ReviewCustomerResponse? {
  ReviewCustomer toDomain() {
    return ReviewCustomer(
        id: this?.id.orEmpty() ?? '',
        user: this?.user.toDomain() ?? ReviewUser.empty());
  }
}

extension ReviewUserResponseToModal on ReviewUserResponse? {
  ReviewUser toDomain() {
    return ReviewUser(
        id: this?.id.orEmpty() ?? '',
        email: this?.email.orEmpty() ?? '',
        firstName: this?.firstName.orEmpty() ?? '',
        lastName: this?.lastName.orEmpty() ?? '',
        profileImage: this?.profileImage.orEmpty() ?? '');
  }
}
