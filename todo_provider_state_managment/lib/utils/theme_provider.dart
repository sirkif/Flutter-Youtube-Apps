import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  void switchTheme() {
    if (themeMode == ThemeMode.system) {
      themeMode = ThemeMode.light;
    } else {
      themeMode =
          themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }
}
