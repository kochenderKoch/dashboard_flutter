//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  SharedPreferencesPlugin.registerWith(registrar);
  WebWebViewPlatform.registerWith(registrar);
  registrar.registerMessageHandler();
}
