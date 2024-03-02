import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  void switchTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    notifyListeners();
  }
}
