import 'package:flutter/material.dart';

import '../storage_manager.dart';

class ThemeProvider with ChangeNotifier {
  final lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xFF023047),
      primaryVariant: Color(0xFF2A9D8F),
      secondary: Color(0xFFF86541),
      secondaryVariant: Color(0xFFF07E24),
      surface: Color(0xFFe9ecee),
      background: Color(0xFFe9ecee),
      error: Color(0xFFb00020),
      onPrimary: Color(0xFFe5e9ec),
      onSecondary: Color(0xFFfeefeb),
      onSurface: Color(0xFF0b0c0c),
      onBackground: Color(0xFF0b0c0c),
      onError: Color(0xFFf6e5e8),
      brightness: Brightness.light,
    ),
    primaryColor: const Color(0xFF023047),
    primaryColorDark: const Color(0xFF012232),
    primaryColorLight: const Color(0xFF678391),
    secondaryHeaderColor: const Color(0xFF748d9a),
    toggleableActiveColor: const Color(0xFFf86541),
    bottomAppBarColor: const Color(0xFFe9ecee),
    dividerColor: const Color(0xFFcfd1d3),
    disabledColor: const Color(0xFFbdc5c9),
    canvasColor: const Color(0xFFe9ecee),
    cardColor: const Color(0xFFe9ecee),
    dialogBackgroundColor: const Color(0xFFfbf3eb),
    scaffoldBackgroundColor: const Color(0xFF869ca7),
    errorColor: const Color(0xFFb00020),
  );

  final darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xFF57859D),
      primaryVariant: Color(0xFF50A399),
      secondary: Color(0xFFFF6E48),
      secondaryVariant: Color(0xFFED7F29),
      surface: Color(0xFF131515),
      background: Color(0xFF15191A),
      error: Color(0xFFcf6679),
      onPrimary: Color(0xFFf7f9fa),
      onSecondary: Color(0xFFfff8f6),
      onSurface: Color(0xFFf9f9f9),
      onBackground: Color(0xFFf3f4f4),
      onError: Color(0xFFfcf7f8),
      brightness: Brightness.dark,
    ),
    primaryColor: const Color(0xFF57859d),
    primaryColorDark: const Color(0xFF466a7e),
    primaryColorLight: const Color(0xFF9ab6c4),
    secondaryHeaderColor: const Color(0xFFa3bcc9),
    toggleableActiveColor: const Color(0xFFff6e48),
    bottomAppBarColor: const Color(0xFF15191a),
    dividerColor: const Color(0xFF2e3030),
    disabledColor: const Color(0xFF2c3336),
    canvasColor: const Color(0xFF15191a),
    cardColor: const Color(0xFF131515),
    dialogBackgroundColor: const Color(0xFF131515),
    scaffoldBackgroundColor: const Color(0xFF1f292e),
    errorColor: const Color(0xFFcf6679),
  );

  Color successColor = Colors.green[800]!;
  Color warningColor = Colors.yellow[800]!;
  Color errorColor = Colors.red[800]!;
  Color elseColor = Colors.blue;

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
