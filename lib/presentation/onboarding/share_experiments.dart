import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/presentation/checkout/screen_thanks_for_order.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

GlobalKey qrKey = GlobalKey();
Future<void> openShareSheet(BuildContext context) async {
  final boundary =
      qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
  var image = await boundary?.toImage();
  ByteData? byteData = await image?.toByteData(format: ImageByteFormat.png);
  Uint8List? pngBytes = byteData?.buffer.asUint8List();

  final tempDir = await getTemporaryDirectory();
  final file = await File('${tempDir.path}/qr_code.png').create();
  await file.writeAsBytes(pngBytes!);
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          child: Column(
            children: [
              Container(
                height: 10.h,
                width: 20.w,
                decoration: BoxDecoration(color: Colors.blueGrey),
              ),
              Container(
                height: 100.w,
                width: 100.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(file))),
              ),
              Divider(
                thickness: 1,
              ),
              Container(
                width: 300,
                height: 300,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(file.path);
                      },
                      child: Container(
                        width: 100.h,
                        height: 100.h,
                        child: Icon(
                          Icons.facebook,
                          size: 48,
                        ),
                      ),
                    ),
                    Container(
                      width: 100.h,
                      height: 100.h,
                      child: Icon(
                        Icons.photo,
                        size: 48,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100.h,
                        height: 100.h,
                        child: Icon(
                          Icons.phone,
                          size: 48,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}

Future<void> captureAndSharePng(BuildContext context) async {
  try {
    final boundary =
        qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    var image = await boundary?.toImage();
    ByteData? byteData = await image?.toByteData(format: ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/qr_code.png').create();
    await file.writeAsBytes(pngBytes!);

    Share.shareXFiles([XFile('${tempDir.path}/qr_code.png')],
        subject: "EBC profile", text: "Check out my ebc profile ");
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Unable to share content')));
  }
}

class ShareImagePainter extends StatelessWidget {
  const ShareImagePainter({Key? key, required this.slug}) : super(key: key);
  final String slug;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.appGreyColor)),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const Text("Hey, Checkout my netcarbon page"),
                    SizedBox(
                      height: 6.h,
                    ),
                    RepaintBoundary(
                      key: qrKey,
                      child: QrImageView(
                        data: '${AppStrings.webBase}/c/$slug',
                        version: QrVersions.auto,
                        size: 300.h,
                        gapless: false,
                        embeddedImage: const AssetImage(ImageAssets.qrLogo),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: Size(60.w, 60.w),
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  captureAndSharePng(context);
                },
                child: const Text('Share'))
          ],
        ),
      ),
    );
  }
}
