import 'package:dashboard_flutter/Screens/sidebar.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaesarDashboardApp extends StatelessWidget {
  const CaesarDashboardApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeProvider.getTheme(),
      home: SideBarWidget(),
    );
  }
}
