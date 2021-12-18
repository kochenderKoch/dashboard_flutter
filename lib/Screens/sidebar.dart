import 'package:dashboard_flutter/Screens/News/news_screen.dart';
import 'package:dashboard_flutter/Screens/Table/table_screen.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:provider/provider.dart';

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
    return AdminScaffold(
      //backgroundColor: themeProvider.getTheme().scaffoldBackgroundColor,
      appBar: AppBar(
        //foregroundColor: themeProvider.getTheme().primaryColor,
        title: const Text('Caesar Dashboard'),
        actions: [
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
              icon: const Icon(Icons.dark_mode))
        ],
      ),
      sideBar: SideBar(
        backgroundColor: themeProvider.getTheme().bottomAppBarColor,
        activeBackgroundColor: themeProvider.getTheme().highlightColor,
        items: const [
          MenuItem(
            title: 'Dashboard',
            route: '/',
            icon: Icons.dashboard,
          ),
          MenuItem(
            title: 'Verzeichnis',
            route: '/table',
            icon: Icons.table_chart,
          ),
          MenuItem(
            title: 'Newsfeed',
            route: '/news',
            icon: Icons.feed,
          ),
          MenuItem(
            title: 'Top Level',
            icon: Icons.file_copy,
            children: [
              MenuItem(
                title: 'Second Level Item 1',
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
              default:
            }
          }
        },
        header: Container(),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _currentView,
    );
  }
}