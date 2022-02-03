import 'dart:async';

import 'package:dashboard_flutter/Screens/Guacamole/webview.dart';
import 'package:dashboard_flutter/constant.dart';
import 'package:flutter/material.dart';

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
        initialUrl: website,
        onWebViewCreated: (WebViewController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
