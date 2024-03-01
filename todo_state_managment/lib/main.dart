import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:june/june.dart';
import 'package:todo_app/utils/app_theme_state.dart';

import 'color_schemes.dart';
import 'home/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.purple[900],
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      () => AppThemeState(),
      builder: (controller) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: lightColorScheme,
          // brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          // brightness: Brightness.dark,
        ),
        themeMode: June.getState(AppThemeState()).themeMode,
        home: const HomeScreen(),
      ),
    );
  }
}
