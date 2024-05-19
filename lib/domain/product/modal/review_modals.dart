class ProductReviewListModal {
  ProductReviewListModal({
    required this.success,
    required this.data,
  });

  final bool success;
  final List<ReviewModal> data;
}

class ReviewModal {
  ReviewModal({
    required this.id,
    required this.product,
    required this.customer,
    required this.order,
    required this.approvedRating,
    required this.approvedComment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String product;
  final ReviewCustomer customer;
  final String order;
  final double approvedRating;
  final String approvedComment;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
}

class ReviewCustomer {
  ReviewCustomer({
    required this.id,
    required this.user,
  });

  final String id;
  final ReviewUser user;
}

class ReviewUser {
  ReviewUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
  });

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String profileImage;

  factory ReviewUser.empty() => ReviewUser(
      id: '', email: '', firstName: '', lastName: '', profileImage: '');
}
