import 'package:net_carbons/domain/user_profile/modal/payment_log.dart';
import 'package:net_carbons/domain/user_profile/modal/product_data_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';

class MyOrdersListModal {
  MyOrdersListModal({
    required this.metadata,
    required this.orders,
  });

  final MetadataModal metadata;
  final List<OrderFetchModal> orders;
}

class MetadataModal {
  MetadataModal({
    required this.total,
    required this.totalPages,
    required this.currentPage,
    required this.nextPage,
  });

  final int total;
  final int totalPages;
  final int currentPage;
  final int? nextPage;

  factory MetadataModal.empty() =>
      MetadataModal(total: 0, totalPages: 0, currentPage: 0, nextPage: 0);
}

class OrderFetchModal {
  OrderFetchModal({
    required this.couponCode,
    required this.isSubscriptionCycleCompleted,
    required this.currency,
    required this.currencySymbol,
    required this.id,
    required this.orderNumber,
    required this.products,
    required this.customer,
    required this.orderTotal,
    required this.calculatedCouponDiscount,
    required this.subTotal,
    required this.billingAddress,
    required this.carbonOffsetEarned,
    required this.paymentMode,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.subscriptionCancelledAt,
    required this.certificates,
    required this.status,
    required this.emailSentStatus,
    required this.metricsCalculatedStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.invoice,
    required this.paymentLogModal,
    required this.coupon,
  });

  final String id;
  final String orderNumber;
  final List<OrderProductElementModal> products;
  final OrderCustomerModal customer;
  final double orderTotal;
  final double calculatedCouponDiscount;
  final double subTotal;
  final BillingAddressModal? billingAddress;
  final double carbonOffsetEarned;
  final String paymentMode;
  final String paymentMethod;
  final String currency;
  final String currencySymbol;
  final String couponCode;
  final String paymentStatus;
  final int subscriptionCancelledAt;
  final List<CertificateModal> certificates;
  final int status;
  final double emailSentStatus;
  final double metricsCalculatedStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final InvoiceModal invoice;
  final List<PaymentLogModal> paymentLogModal;
  final int isSubscriptionCycleCompleted;
  final CouponModal coupon;
}

class CertificateModal {
  CertificateModal({
    required this.id,
    required this.originNumber,
    required this.customer,
    required this.userCertificateSlug,
    required this.order,
    required this.product,
    required this.certificateUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.transactionId,
  });

  final String id;
  final String originNumber;
  final String customer;
  final String userCertificateSlug;
  final String order;
  final String product;
  final String certificateUrl;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String transactionId;
}

class OrderCustomerModal {
  OrderCustomerModal({
    required this.id,
    required this.user,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.ghgReduced,
    required this.projectsSupported,
    required this.projectsSupportedCount,
    required this.treesPlanted,
  });

  final String id;
  final String user;
  final List<dynamic> address;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final int ghgReduced;
  final List<String> projectsSupported;
  final int projectsSupportedCount;
  final int treesPlanted;

  factory OrderCustomerModal.empty() => OrderCustomerModal(
      id: '',
      user: '',
      address: [],
      status: '',
      createdAt: DateTime.fromMicrosecondsSinceEpoch(1),
      updatedAt: DateTime.fromMicrosecondsSinceEpoch(1),
      v: 0,
      ghgReduced: 0,
      projectsSupported: [],
      projectsSupportedCount: 0,
      treesPlanted: 0);
}

class InvoiceModal {
  InvoiceModal({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.filePath,
  });

  final String id;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String filePath;

  factory InvoiceModal.empty() => InvoiceModal(
      id: '',
      status: 0,
      createdAt: DateTime.fromMicrosecondsSinceEpoch(1),
      updatedAt: DateTime.fromMicrosecondsSinceEpoch(1),
      v: 0,
      filePath: '');
}

class OrderProductElementModal {
  OrderProductElementModal({
    required this.product,
    required this.price,
    required this.quantity,
    required this.certificate,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  final FetchOrderProductModal product;
  final double price;
  final int quantity;
  final OrderProductCertificate certificate;
  final String id;
  final DateTime updatedAt;
  final DateTime createdAt;
}

class CouponModal {
  String id;
  String code;
  String type;
  int discountUnit;
  DateTime startDate;
  DateTime endDate;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  CouponModal({
    required this.id,
    required this.code,
    required this.type,
    required this.discountUnit,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CouponModal.empty() => CouponModal(
      id: '',
      code: '',
      type: '',
      discountUnit: 0,
      startDate: DateTime.fromMillisecondsSinceEpoch(1),
      endDate: DateTime.fromMillisecondsSinceEpoch(1),
      status: 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(1),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(1),
      v: 0);
}

class OrderProductCertificate {
  String originNumber;
  String certificateURL;
  OrderProductCertificate(
      {required this.certificateURL, required this.originNumber});
}