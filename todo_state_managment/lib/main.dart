import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      // darkTheme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: kDarkPrimaryColor,
      // ),
      // theme: AppTheme().theme(context),
      home: const HomeScreen(),
    );
  }
}
