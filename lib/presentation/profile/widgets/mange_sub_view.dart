import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ManageSubsWebView extends StatefulWidget {
  final String url;
  const ManageSubsWebView({required this.url}) : super();

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<ManageSubsWebView> {
  late WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }

  @override
  void dispose() {
    _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20.h),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(
                context,
              ),
              icon: const Icon(Icons.close),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: WebView(
          gestureNavigationEnabled: true,
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) => _controller = controller,
          onPageFinished: (String url) {},
          navigationDelegate: (NavigationRequest request) async {
            if (request.url.startsWith('https://successebc.ebc')) {
              Navigator.of(context).pop(); // <-- Handle success case
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}
