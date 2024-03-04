import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = true;

  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;

    notifyListeners();
  }
}
