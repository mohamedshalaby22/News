// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  String? url;
  WebViewPage({Key? key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 25),
      child: WebView(
        initialUrl: url,
      ),
    ));
  }
}
