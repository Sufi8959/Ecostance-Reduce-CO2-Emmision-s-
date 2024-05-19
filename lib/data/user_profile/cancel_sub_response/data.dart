import 'package:json_annotation/json_annotation.dart';

import 'automatic_tax.dart';
import 'discount.dart';
import 'items.dart';
import 'metadata.dart';
import 'payment_settings.dart';
import 'plan.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? object;
  dynamic application;
  @JsonKey(name: 'application_fee_percent')
  dynamic applicationFeePercent;
  @JsonKey(name: 'automatic_tax')
  AutomaticTax? automaticTax;
  @JsonKey(name: 'billing_cycle_anchor')
  int? billingCycleAnchor;
  @JsonKey(name: 'billing_thresholds')
  dynamic billingThresholds;
  @JsonKey(name: 'cancel_at')
  dynamic cancelAt;
  @JsonKey(name: 'cancel_at_period_end')
  bool? cancelAtPeriodEnd;
  @JsonKey(name: 'canceled_at')
  int? canceledAt;
  @JsonKey(name: 'collection_method')
  String? collectionMethod;
  int? created;
  String? currency;
  @JsonKey(name: 'current_period_end')
  int? currentPeriodEnd;
  @JsonKey(name: 'current_period_start')
  int? currentPeriodStart;
  String? customer;
  @JsonKey(name: 'days_until_due')
  dynamic daysUntilDue;
  @JsonKey(name: 'default_payment_method')
  String? defaultPaymentMethod;
  @JsonKey(name: 'default_source')
  dynamic defaultSource;
  @JsonKey(name: 'default_tax_rates')
  List<dynamic>? defaultTaxRates;
  dynamic description;
  Discount? discount;
  @JsonKey(name: 'ended_at')
  int? endedAt;
  Items? items;
  @JsonKey(name: 'latest_invoice')
  String? latestInvoice;
  bool? livemode;
  Metadata? metadata;
  @JsonKey(name: 'next_pending_invoice_item_invoice')
  dynamic nextPendingInvoiceItemInvoice;
  @JsonKey(name: 'on_behalf_of')
  dynamic onBehalfOf;
  @JsonKey(name: 'pause_collection')
  dynamic pauseCollection;
  @JsonKey(name: 'payment_settings')
  PaymentSettings? paymentSettings;
  @JsonKey(name: 'pending_invoice_item_interval')
  dynamic pendingInvoiceItemInterval;
  @JsonKey(name: 'pending_setup_intent')
  dynamic pendingSetupIntent;
  @JsonKey(name: 'pending_update')
  dynamic pendingUpdate;
  Plan? plan;
  int? quantity;
  dynamic schedule;
  @JsonKey(name: 'start_date')
  int? startDate;
  String? status;
  @JsonKey(name: 'test_clock')
  dynamic testClock;
  @JsonKey(name: 'transfer_data')
  dynamic transferData;
  @JsonKey(name: 'trial_end')
  dynamic trialEnd;
  @JsonKey(name: 'trial_start')
  dynamic trialStart;

  Data({
    this.id,
    this.object,
    this.application,
    this.applicationFeePercent,
    this.automaticTax,
    this.billingCycleAnchor,
    this.billingThresholds,
    this.cancelAt,
    this.cancelAtPeriodEnd,
    this.canceledAt,
    this.collectionMethod,
    this.created,
    this.currency,
    this.currentPeriodEnd,
    this.currentPeriodStart,
    this.customer,
    this.daysUntilDue,
    this.defaultPaymentMethod,
    this.defaultSource,
    this.defaultTaxRates,
    this.description,
    this.discount,
    this.endedAt,
    this.items,
    this.latestInvoice,
    this.livemode,
    this.metadata,
    this.nextPendingInvoiceItemInvoice,
    this.onBehalfOf,
    this.pauseCollection,
    this.paymentSettings,
    this.pendingInvoiceItemInterval,
    this.pendingSetupIntent,
    this.pendingUpdate,
    this.plan,
    this.quantity,
    this.schedule,
    this.startDate,
    this.status,
    this.testClock,
    this.transferData,
    this.trialEnd,
    this.trialStart,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
