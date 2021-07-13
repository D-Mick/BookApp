import 'dart:io';

import 'package:book_app/Model/book.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EbookWebPreview extends StatefulWidget {
  final Items items;
  EbookWebPreview({this.items});
  @override
  _EbookWebPreviewState createState() => _EbookWebPreviewState();
}

class _EbookWebPreviewState extends State<EbookWebPreview> {
  

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${this.widget.items.volumeInfo.title}"),
        ),
        body: WebView(
          initialUrl: this.widget.items.volumeInfo.previewLink,
          javascriptMode: JavascriptMode.unrestricted,
        ),
    );
  }
}
