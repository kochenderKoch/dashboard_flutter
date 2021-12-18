import 'package:flutter/material.dart';

import '../storage_manager.dart';

class ThemeProvider with ChangeNotifier {
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    primaryColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[850],
    bottomAppBarColor: Colors.grey,
    selectedRowColor: Colors.orange,
  );

  final lightTheme = ThemeData(
    backgroundColor: const Color(0xffd1d8e0),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xff4b7bec),
    bottomAppBarColor: const Color(0xffb7bec),
    selectedRowColor: const Color(0x332d98da),
  );

  ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeProvider(this._themeData) {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
