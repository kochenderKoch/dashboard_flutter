import 'package:dashboard_flutter/model/timecheck_model.dart';
import 'package:dashboard_flutter/provider/notification_provider.dart';
import 'package:dashboard_flutter/provider/table_provider.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';
import 'package:dashboard_flutter/services/timestamp_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  TimestampService timestampService = TimestampService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(ThemeData()),
        ),
        FutureProvider<List<TimecheckModel>>(
          create: (context) => timestampService.getTimestamps(),
          initialData: [],
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
