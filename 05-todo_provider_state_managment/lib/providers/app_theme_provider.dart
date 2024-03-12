import 'package:flutter/material.dart';

class AppThemeProvider with ChangeNotifier {
  bool isDarkMode = true;

  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;

    notifyListeners();
  }
}
