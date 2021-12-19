import 'package:dashboard_flutter/model/notification_model.dart';
import 'package:dashboard_flutter/model/timecheck_model.dart';
import 'package:dashboard_flutter/provider/notification_provider.dart';
import 'package:dashboard_flutter/provider/role_provider.dart';
import 'package:dashboard_flutter/provider/table_provider.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';
import 'package:dashboard_flutter/services/news_service.dart';
import 'package:dashboard_flutter/services/timestamp_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  TimestampService timestampService = TimestampService();
  NewsService newsService = NewsService();

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
        FutureProvider<List<NotificationModel>>(
          create: (context) => newsService.getNews(),
          initialData: [],
        ),
        ChangeNotifierProvider(
          create: (context) => TableProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RoleProvider(),
        ),
      ],
      child: const CaesarDashboardApp(),
    ),
  );
}
