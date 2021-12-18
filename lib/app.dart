import 'package:dashboard_flutter/Screens/sidebar.dart';
import 'package:flutter/material.dart';

class CaesarDashboardApp extends StatelessWidget {
  const CaesarDashboardApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SideBarWidget(),
    );
  }
}
