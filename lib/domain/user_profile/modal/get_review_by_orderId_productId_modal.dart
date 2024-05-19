class GetReviewByOrderProductIdsModal {
  GetReviewByOrderProductIdsModal({
    required this.success,
    required this.data,
  });

  final bool success;
  final GetReviewByOrderProductIdsData data;
}

class GetReviewByOrderProductIdsData {
  GetReviewByOrderProductIdsData({
    required this.id,
    required this.product,
    required this.customer,
    required this.order,
    required this.rating,
    required this.comment,
    required this.isReviewed,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String product;
  final String customer;
  final String order;
  final double rating;
  final String comment;
  final bool isReviewed;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory GetReviewByOrderProductIdsData.empty() =>
      GetReviewByOrderProductIdsData(
          id: '',
          product: '',
          customer: '',
          order: '',
          rating: 0,
          comment: '',
          isReviewed: false,
          status: 0,
          createdAt: DateTime.fromMicrosecondsSinceEpoch(1),
          updatedAt: DateTime.fromMicrosecondsSinceEpoch(1),
          v: 0);
}
