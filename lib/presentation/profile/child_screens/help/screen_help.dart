import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/profile/child_screens/help/help_item.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/route_manager.dart';

class ScreenHelp extends StatefulWidget {
  ScreenHelp({Key? key}) : super(key: key);

  @override
  State<ScreenHelp> createState() => _ScreenHelpState();
}

class _ScreenHelpState extends State<ScreenHelp> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppAppBar(() {
        Navigator.pop(context);
      },
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(80.h),
              child: Container(
                color: AppColors.primaryInactive,
                height: 41.h,
                child: Center(
                  child: Text(
                    "Help",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5,
                        fontSize: 16,
                        color: AppColors.primaryActiveColor),
                  ),
                ),
              )),
          backgroundColor: AppColors.primaryInactive,
          hideWave: true),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelpItem(text: "Contact Support", onTap: () {
              _launchUrl(Uri.parse("https://ecostance.marketsverse.com/support"));
            }),
            HelpItem(text: "Frequently Asked Questions", onTap: () {
              _launchUrl(Uri.parse("https://ecostance.com/faq"));
            }),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 4),
              child: Text(
                "OTHER",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900),
              ),
            ),
            HelpItem(text: "Privacy Policy", onTap: () {
              _launchUrl(Uri.parse("https://ecostance.com/privacy"));
            }),
            HelpItem(text: "Terms of Use", onTap: () {
              _launchUrl(Uri.parse("https://ecostance.com/terms"));
            }),
            HelpItem(text: "Delete Account", onTap: () {
              Navigator.pushNamed(context, Routes.screenDeleteAccount);
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.qrLogo,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Version",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(_packageInfo.version),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
