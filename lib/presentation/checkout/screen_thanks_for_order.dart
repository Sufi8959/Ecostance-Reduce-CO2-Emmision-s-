import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/data/checkout/create_order_response/create_order_response.dart';
import 'package:net_carbons/data/checkout/create_order_response/product.dart';
import 'package:net_carbons/data/checkout/repository.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/profile/widgets/downloader.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/single_product_page/widgets/project_details_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

GlobalKey _qrKey = GlobalKey();

class ScreenThanksForOrder extends StatefulWidget {
  ScreenThanksForOrder({Key? key}) : super(key: key);

  @override
  State<ScreenThanksForOrder> createState() => _ScreenThanksForOrderState();
}

class _ScreenThanksForOrderState extends State<ScreenThanksForOrder> {
  final userProfileRep = getIt<CheckoutRepository>();
  bool fistBuild = true;
  @override
  Widget build(BuildContext context) {
    print("-------> ScreenThanksForOrder");
    BlocProvider.of<CheckoutBloc>(context).add(const CheckoutEvent.done());
    CreateOrderResponse createOrderResponse =
        ModalRoute.of(context)?.settings.arguments as CreateOrderResponse;
    print("subTotal ${createOrderResponse.order!.subTotal}");
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.fetchOrders());
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, Routes.chooseActionScreen);
        return false;
      },
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (fistBuild) {
            if (state.onSession) {
              BlocProvider.of<CartBloc>(context).add(const CartEvent.clear());
            }
            checkForInvoice(createOrderResponse);
            fistBuild = false;
          }

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        height: 404.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage(ImageAssets.thanks_order_hill))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: 140.h,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          ImageAssets.orderThanksWave))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: Text(
                                      "Thanks for order!",
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SafeArea(
                        child: LogoBar(),
                        bottom: false,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.cartPriceColor, width: .5)),
                    margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4),
                    padding:
                        EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
                    child: Column(
                      children: [
                        Row(children: [
                          SvgPicture.asset(
                            SvgAssets.pdfIcon,
                            color: AppColors.cherryRed,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          if (gotTheInvoice)
                            DownloaderWidget(
                                parentSnack: true,
                                url: invoiceLink,
                                fileName: createOrderResponse.order?.id ??
                                    DateTime.now().toString(),
                                mainText: const Text('Order.pdf')),
                          if (!gotTheInvoice)
                            GestureDetector(
                              onTap: () {
                                if (!gotTheInvoice) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Your invoice  being generated, Please wait')));
                                  return;
                                }
                              },
                              child: Container(
                                child: const Text('Order.pdf'),
                              ),
                            )
                        ]),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Order #: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      color: AppColors.grayC1, fontSize: 14.sp),
                            ),
                            Text(
                                spaceFormatOrderNum(createOrderResponse
                                        .order?.orderNumber
                                        .toString() ??
                                    ''),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp, height: 1.22))
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Email ID: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      color: AppColors.grayC1, fontSize: 14.sp),
                            ),
                            Text("${createOrderResponse.user?.email}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp, height: 1.22))
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Status: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      color: AppColors.grayC1, fontSize: 14.sp),
                            ),
                            createOrderResponse.order?.status == 1
                                ? Text(
                                    " Success",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.selectedGreen,
                                            height: 1.22),
                                  )
                                : Text("N/A")
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Date/Time: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      color: AppColors.grayC1, fontSize: 14.sp),
                            ),
                            Text(
                              "${DateFormat('yyyy-MM-dd').format(createOrderResponse.order?.createdAt?.toLocal() ?? DateTime.now())}, ${DateFormat('HH:mm').format(createOrderResponse.order?.createdAt?.toLocal() ?? DateTime.now())} ${createOrderResponse.order?.createdAt?.toLocal().timeZoneName}(UTC${(createOrderResponse.order?.createdAt?.toLocal() ?? DateTime.now()).timeZoneOffset.isNegative ? '-' : '+'}${createOrderResponse.order?.createdAt?.toLocal().timeZoneOffset.inHours}:${createOrderResponse.order?.createdAt?.toLocal().timeZoneOffset.inMinutes.remainder(60)})",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(fontSize: 14.sp, height: 1.22),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Payment type: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      color: AppColors.grayC1, fontSize: 14.sp),
                            ),
                            Text(
                                createOrderResponse.order?.paymentMode ==
                                        'payment'
                                    ? 'One time payment'
                                    : 'Subscription',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp, height: 1.22))
                          ],
                        ),
                        if (createOrderResponse.order?.paymentMode ==
                            'subscription')
                          Padding(
                            padding: EdgeInsets.only(top: 16.h),
                            child: Row(
                              children: [
                                Text(
                                  "Subscription start date: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: AppColors.grayC1,
                                          fontSize: 14.sp),
                                ),
                                Text(
                                  DateFormat('yyyy-MM-dd').format(
                                      createOrderResponse.order?.createdAt
                                              ?.toLocal() ??
                                          DateTime.now()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontSize: 14.sp, height: 1.22),
                                )
                              ],
                            ),
                          ),
                        if (createOrderResponse.order?.paymentMode ==
                            'subscription')
                          Padding(
                            padding: EdgeInsets.only(top: 16.h),
                            child: Row(
                              children: [
                                Text(
                                  "Subscription end date: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: AppColors.grayC1,
                                          fontSize: 14.sp),
                                ),
                                Text(
                                  DateFormat('yyyy-MM-dd').format(
                                      createOrderResponse.order?.createdAt
                                              ?.toLocal()
                                              .add(const Duration(days: 365)) ??
                                          DateTime.now()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontSize: 14.sp, height: 1.22),
                                )
                              ],
                            ),
                          ),
                        if (createOrderResponse.order?.paymentMode ==
                            'subscription')
                          Padding(
                            padding: EdgeInsets.only(top: 16.h),
                            child: Row(
                              children: [
                                Text(
                                  "Monthly payment: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: AppColors.grayC1,
                                          fontSize: 14.sp),
                                ),
                                Text(
                                  getPriceFormattedWithCODE(
                                      createOrderResponse.order?.currency ??
                                          BlocProvider.of<AppControllerBloc>(
                                                  context)
                                              .state
                                              .currency,
                                      (createOrderResponse.order?.orderTotal ??
                                              0) /
                                          12),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontSize: 14.sp, height: 1.22),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Container(
                    color: AppColors.orderPageGrayBg,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          child: _createDataTable(
                              createOrderResponse, Theme.of(context).textTheme),
                        ),
                        // const Divider(
                        //   thickness: 1,
                        //   color: AppColors.greyD8,
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total items",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                              Text(
                                " ${createOrderResponse.order!.products!.fold(0, (int previousValue, element) => previousValue + element.quantity!)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                        // const Divider(
                        //   thickness: 1,
                        //   color: AppColors.greyD8,
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cart total",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                              Text(
                                getPriceFormattedWithCODE(
                                    createOrderResponse.order!.currency!,
                                    createOrderResponse.order?.subTotal ?? 0),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: AppColors.greyD8,
                        ),
                        if (createOrderResponse
                                .order?.calculatedCouponDiscount !=
                            null)
                          if (createOrderResponse
                                  .order!.calculatedCouponDiscount! >
                              0)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (createOrderResponse.order?.coupon != null)
                                    Expanded(
                                      child: Row(children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Promotion",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 6.w),
                                              child: Text(
                                                " ${createOrderResponse.order!.couponCode!.isNotEmpty ? '(${createOrderResponse.order!.couponCode}) '
                                                    '${createOrderResponse.order!.coupon?.discountUnit}'
                                                    '${createOrderResponse.order?.coupon?.type == 'percentage' ? '%' : ' Free item'}' : ''}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ]),
                                    ),
                                  Text(
                                    "-${getPriceFormattedWithCODE(createOrderResponse.order?.currency ?? "USD", createOrderResponse.order?.calculatedCouponDiscount ?? 0)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                              Text(
                                "${getPriceFormattedWithCODE(createOrderResponse.order?.currency ?? "USD", 0.00 ?? 0)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                              Text(
                                "${getPriceFormattedWithCODE(createOrderResponse.order?.currency ?? "USD", 0.00 ?? 0)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: AppColors.greyD8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Total",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 17.sp),
                              ),
                              Text(
                                getPriceFormattedWithCODE(
                                    createOrderResponse.order?.currency ??
                                        "USD",
                                    createOrderResponse.order?.orderTotal ?? 0),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 17.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.orderPageGrayBg,
                    height: 22.h,
                  ),
                  Container(
                    color: AppColors.orderPageGrayBg,
                    // height: 300.h,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 23.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            launchMyUrl(context,
                                '${AppStrings.webBase}/c/${createOrderResponse.slug}');
                          },
                          child: Container(
                            color: AppColors.appWhite,
                            child: RepaintBoundary(
                              key: _qrKey,
                              child: QrImageView(
                                data:
                                    '${AppStrings.webBase}/c/${createOrderResponse.slug}',
                                version: QrVersions.auto,
                                size: 150.h,
                                gapless: false,
                                embeddedImage:
                                    const AssetImage(ImageAssets.qrLogo),
                                embeddedImageStyle: QrEmbeddedImageStyle(
                                  size: Size(20.w, 20.w),
                                ),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            launchMyUrl(context,
                                '${AppStrings.webBase}/c/${createOrderResponse.slug}');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 21.w),
                            child: Text(
                              '${AppStrings.webBase}/c/${createOrderResponse.slug}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                      color: AppColors.linkColor,
                                      decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            // openShareSheet();
                            // captureAndSharePng(
                            //     '${AppStrings.webBase}/c/${createOrderResponse.slug}',
                            //     context);
                            Share.share(
                                '${AppStrings.webBase}/c/${createOrderResponse.slug}');
                          },
                          child: Container(
                            height: 30.h,
                            padding: EdgeInsets.all(4.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Share now:",
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Icon(Platform.isIOS
                                    ? Icons.ios_share
                                    : Icons.share)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: AppButton(
                        filled: true,
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              Routes.chooseActionScreen, (route) => false);
                        },
                        text: Text(
                          ButtonStrings.close,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.appWhite),
                        ),
                        feedbackTimeText: Text(
                          ButtonStrings.close,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        )),
                  ),
                  SizedBox(
                    height: 58.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  bool gotTheInvoice = false;
  String invoiceLink = '';
  late Timer timer;
  void checkForInvoice(CreateOrderResponse createOrderResponse) async {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (gotTheInvoice == false) {
        if (createOrderResponse.order != null) {
          final res = await userProfileRep.getOnOrder(
              createOrderResponse.order!.id!,
              createOrderResponse.order!.currency!);
          res.fold((l) => null, (r) {
            print(r.invoice.filePath);
            print(r.invoice.status);
            if (r.invoice.status == 3) {
              setState(() {
                gotTheInvoice = true;
                invoiceLink = r.invoice.filePath;
              });
            }
          });
        }
      }
    });
  }

  Future<void> captureAndSharePng(String text, BuildContext context) async {
    try {
      final boundary =
          _qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      var image = await boundary?.toImage();
      ByteData? byteData = await image?.toByteData(format: ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/qr_code.png').create();
      await file.writeAsBytes(pngBytes!);

      Share.shareXFiles([XFile('${tempDir.path}/qr_code.png')],
          subject: "EBC profile", text: "Check out my ebc profile $text");
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Unable to share content')));
    }
  }

  Widget _createDataTable(
      CreateOrderResponse createOrderResponse, TextTheme textTheme) {
    final currency = createOrderResponse.order?.currency ??
        BlocProvider.of<AppControllerBloc>(context).state.currency;

    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(),
        4: FlexColumnWidth(.75),
        5: FlexColumnWidth(),
      },
      children: List.generate(createOrderResponse.order?.products?.length ?? 0,
          (index) {
        CrateOrderResponseProduct? product =
            createOrderResponse.order?.products?[index];

        double? totalPrice = product?.price != null
            ? product?.quantity != null
                ? (product!.price! * product.quantity!)
                : null
            : null;
        return TableRow(children: [
          TableCell(
              child: Padding(
            padding: EdgeInsets.only(bottom: 28.h, left: 12.w),
            child: Text(
              "${index + 1}",
              style: textTheme.bodyText1?.copyWith(
                  color: AppColors.primaryActiveColor, fontSize: 14.sp),
            ),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.only(bottom: 28.h),
            child: Text(
              spaceFormatOrderNum(product?.product?.productId ?? ''),
              style: textTheme.bodyText1?.copyWith(
                  color: AppColors.primaryActiveColor, fontSize: 14.sp),
            ),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.only(bottom: 28.h),
            child: Text(
              "${product?.product?.name}",
              style: textTheme.bodyText1?.copyWith(
                color: AppColors.primaryActiveColor,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.left,
            ),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.only(bottom: 28.h),
            child: Text(
              getPriceFormattedWithCODE(
                  createOrderResponse.order?.currency ??
                      BlocProvider.of<AppControllerBloc>(context)
                          .state
                          .currency,
                  (product?.price ?? 0)),
              style: textTheme.bodyText1?.copyWith(
                  color: AppColors.primaryActiveColor, fontSize: 14.sp),
            ),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.only(bottom: 28.h),
            child: Text(
              "${product?.quantity.toString()}",
              style: textTheme.bodyText1?.copyWith(
                  color: AppColors.primaryActiveColor, fontSize: 14.sp),
            ),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.only(bottom: 28.h),
            child: Text(
              getPriceFormattedWithCODE(currency, totalPrice ?? 0),
              style: textTheme.bodyText1?.copyWith(
                  color: AppColors.primaryActiveColor, fontSize: 14.sp),
            ),
          )),
        ]);
      })
        ..insert(
            0,
            TableRow(children: [
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Text(
                      "Num.",
                      style: textTheme.subtitle1?.copyWith(fontSize: 14.sp),
                    ),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Text(
                      "Product Num.",
                      style: textTheme.subtitle1?.copyWith(fontSize: 14.sp),
                    ),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Text("Product Name",
                        style: textTheme.subtitle1?.copyWith(fontSize: 14.sp)),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Text(
                      "Unit Price",
                      style: textTheme.subtitle1?.copyWith(fontSize: 14.sp),
                    ),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Text(
                      "Qty",
                      style: textTheme.subtitle1?.copyWith(fontSize: 14.sp),
                    ),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Text(
                      "Product\ntotal",
                      style: textTheme.subtitle1?.copyWith(fontSize: 14.sp),
                      maxLines: 2,
                    ),
                  )),
            ])),
    );
  }
}

class TableItem {
  final String num;
  final String productNum;
  final String productName;
  final String unitPrice;
  final int qty;
  final String productTotal;

  TableItem(
      {required this.num,
      required this.productNum,
      required this.productName,
      required this.unitPrice,
      required this.qty,
      required this.productTotal});
}
