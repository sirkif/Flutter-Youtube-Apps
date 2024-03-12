import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider with ChangeNotifier {
  bool isDarkMode = true;

  late SharedPreferences themeData;

  AppThemeProvider() {
    readThemeData();
  }

  Future<void> readThemeData() async {
    themeData = await SharedPreferences.getInstance();
    isDarkMode = themeData.getBool('darkMode') ?? true;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;

    themeData.setBool('darkMode', isDarkMode);
    notifyListeners();
  }
}
