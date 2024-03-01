import 'package:flutter/material.dart';
import 'package:june/state_manager.dart';

class AppThemeState extends JuneState {
  ThemeMode themeMode = ThemeMode.system;

  static bool isDarkMode = true;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setState();
  }
}
