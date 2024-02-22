import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

// import 'config/theme/app_theme.dart';
import 'home_screen.dart/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kDarkPrimaryColor,
      ),
      // theme: AppTheme().theme(context),
      home: const HomeScreen(),
    );
  }
}
