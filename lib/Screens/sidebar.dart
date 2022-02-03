// ignore_for_file: unnecessary_const

import 'dart:io';
import 'dart:typed_data';

import 'package:dashboard_flutter/Screens/Guacamole/webview_screen.dart';
import 'package:dashboard_flutter/Screens/News/news_screen.dart';
import 'package:dashboard_flutter/Screens/Table/table_screen.dart';
import 'package:dashboard_flutter/provider/role_provider.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'Home/home_screen.dart';

class SideBarWidget extends StatefulWidget {
  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  Widget _currentView = const HomeScreen();
  String _currentRoute = "/";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final roleProvider = Provider.of<RoleProvider>(context);
    return AdminScaffold(
      //backgroundColor: themeProvider.getTheme().scaffoldBackgroundColor,
      appBar: AppBar(
        //foregroundColor: themeProvider.getTheme().primaryColor,
        title: ElevatedButton(
          child: const Text("Caesar Dashboard"),
          onPressed: () {
            setState(() {
              _currentView = const HomeScreen();
              _currentRoute = "/";
            });
          },
        ),
        actions: [
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              themeProvider.setLightMode();
            },
            icon: const Icon(Icons.light_mode),
          ),
          IconButton(
              onPressed: () {
                themeProvider.setDarkMode();
              },
              icon: const Icon(Icons.dark_mode)),
          roleProvider.roleModel.isAdmin()
              ? const Center(child: Text("Role: Admin"))
              : const Center(child: Text("Role: User")),
          IconButton(
            onPressed: () {
              roleProvider.changeUser();
            },
            icon: const Icon(Icons.admin_panel_settings),
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor: themeProvider.getTheme().bottomAppBarColor,
        activeBackgroundColor: themeProvider.getTheme().highlightColor,
        items: const [
          const MenuItem(
            title: 'Dashboard',
            route: '/',
            icon: Icons.dashboard,
          ),
          const MenuItem(
            title: 'Verzeichnis',
            route: '/table',
            icon: Icons.table_chart,
          ),
          const MenuItem(
            title: 'Newsfeed',
            route: '/news',
            icon: Icons.feed,
          ),
          const MenuItem(
            title: 'Guacamole',
            route: '/webview',
            icon: Icons.work,
          ),
          const MenuItem(
            title: 'Einstellungen',
            icon: Icons.settings,
            children: [
              MenuItem(
                title: 'Allgemeine',
                route: '/bla',
              ),
              MenuItem(
                title: 'Second Level Item 2',
                //route: '/secondLevelItem2',
              ),
              MenuItem(
                title: 'Third Level',
                children: [
                  MenuItem(
                    title: 'Third Level Item 1',
                    //route: '/thirdLevelItem1',
                  ),
                  MenuItem(
                    title: 'Third Level Item 2',
                    //route: '/thirdLevelItem2',
                  ),
                ],
              ),
            ],
          ),
        ],
        selectedRoute: _currentRoute,
        onSelected: (item) {
          if (item.route != null) {
            switch (item.route) {
              case "/":
                setState(() {
                  _currentView = const HomeScreen();
                  _currentRoute = item.route!;
                });
                break;
              case "/table":
                setState(() {
                  _currentView = const TableView();
                  _currentRoute = item.route!;
                });
                break;
              case "/news":
                setState(() {
                  _currentView = const NewsScreen();
                  _currentRoute = item.route!;
                });
                break;
              case "/webview":
                setState(() {
                  _currentView = const GuacamoleWebViewScreen();
                  _currentRoute = item.route!;
                });
                break;
              default:
            }
          }
        },
        header: Container(),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    BetterFeedback.of(context).show(
                      (feedback) async {
                        final screenshotFilePath =
                            await writeImageToStorage(feedback.screenshot);

                        await Share.shareFiles(
                          [screenshotFilePath],
                          text: feedback.text,
                        );
                      },
                    );
                  },
                  child: const Text("Sende Feedback"))),
        ),
      ),
      body: _currentView,
    );
  }

  Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
    final Directory output = await getTemporaryDirectory();
    final String screenshotFilePath = '${output.path}/feedback.png';
    final File screenshotFile = File(screenshotFilePath);
    await screenshotFile.writeAsBytes(feedbackScreenshot);
    return screenshotFilePath;
  }
}
