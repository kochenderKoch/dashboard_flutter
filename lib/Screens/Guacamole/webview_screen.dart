import 'dart:async';

import 'package:dashboard_flutter/Screens/Guacamole/webview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

class GuacamoleWebViewScreen extends StatefulWidget {
  const GuacamoleWebViewScreen({Key? key}) : super(key: key);

  @override
  State<GuacamoleWebViewScreen> createState() => _GuacamoleWebViewScreenState();
}

class _GuacamoleWebViewScreenState extends State<GuacamoleWebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: WebView(
        initialUrl: 'https://flutter.dev',
        onWebViewCreated: (WebViewController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
