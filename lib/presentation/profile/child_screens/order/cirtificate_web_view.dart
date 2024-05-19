import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../resources/ui_widgets/top_wave.dart';

class CertificateWebView extends StatelessWidget {
  CertificateWebView({Key? key, required this.url}) : super(key: key);
  final String url;
  PdfViewerController controller = PdfViewerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppAppBar(() {
        Navigator.pop(context);
      }),
      body: SafeArea(
        child: SfPdfViewer.network(
          url,
          onDocumentLoadFailed: (details) {},
          controller: controller,
        ),
      ),
    );
  }
}
