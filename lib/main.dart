import 'package:dashboard_flutter/provider/notification_provider.dart';
import 'package:dashboard_flutter/provider/table_provider.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(ThemeData()),
        ),
        ChangeNotifierProvider(
          create: (context) => TableProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        )
      ],
      child: const CaesarDashboardApp(),
    ),
  );
}
