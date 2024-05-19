import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/checkout/checkout_views/payment_page_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutPage extends StatefulWidget {
  final String url;
  const CheckoutPage({required this.url}) : super();

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  static const String apiKey = "";

  late WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20.h),
        child: Row(
          children:  [
            IconButton(
              onPressed: () => Navigator.pop(
                  context,
                  PaymentResult(
                      sessionId: getSessionId(widget.url) ?? '',
                      paymentStatus: PaymentStatus.cancel)),
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
            navigationDelegate: (NavigationRequest request) async {
              if (request.url.startsWith('https://successebc.ebc')) {
                final sessionId = getSessionId(request.url);
                Navigator.of(context).pop(PaymentResult(
                    sessionId: sessionId ?? '',
                    paymentStatus:
                        PaymentStatus.success)); // <-- Handle success case
              } else if (request.url.startsWith('https://cancelebc.ebc')) {
                final sessionId = getSessionId(request.url);
                Navigator.of(context).pop(PaymentResult(
                    sessionId: sessionId ?? '',
                    paymentStatus:
                        PaymentStatus.cancel)); // <-- Handle cancel case
              }
              return NavigationDecision.navigate;
            },
            onPageFinished: (String url) {
              //<---- add this
              //
              // if (url == initialUrl) {
              //   _redirectToStripe();
              // }
            }),
      ),
    );
  }

  String? getSessionId(String url) {
    final uri = Uri.parse(url);
    return uri.queryParameters['session_id'];
  }

//

  Future<bool?> showCancelDialogue(
      BuildContext context, WebViewController controller) async {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: const Text("Do you want to cancel this payment"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: const Text("No")),
                TextButton(
                    onPressed: () {
                      return Navigator.pop(ctx, true);
                    },
                    child: const Text("Yes")),
              ],
            ));
  }
}

class PaymentResult {
  PaymentResult({required this.sessionId, required this.paymentStatus});

  PaymentStatus paymentStatus;
  final String sessionId;

}

//void _redirectToStripe() {
//     //<--- prepare the JS in a normal string
//     final redirectToCheckoutJs = '''
// var stripe = Stripe(\'$apiKey\');
//
// stripe.redirectToCheckout({
//   sessionId: '${widget.sessionId}'
// }).then(function (result) {
//   result.error.message = 'Error'
// });
// ''';
//     _controller.runJavascript(
//         redirectToCheckoutJs); //<--- call the JS function on controller
//   }
//
//   String get initialUrl =>
//       'data:text/html;base64,${base64Encode(Utf8Encoder().convert(kStripeHtmlPage))}';

const kStripeHtmlPage = '''
<!DOCTYPE html>
<html>
<script src="https://js.stripe.com/v3/"></script>
<head><title>Stripe checkout</title></head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
<body style="display:flex; align-items: center; justify-content: center; width: 100%; height:100vh">
<div class="loader"></div>
</body>
</html>
''';
