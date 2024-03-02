import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home_view/todo_provider/todo_provider.dart';
import 'package:todo_app/utils/theme_provider.dart';

import 'color_schemes.dart';
import 'home_view/home_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.purple[900],
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
      ),
      themeMode: context.read<ThemeProvider>().themeMode,
      home: const HomeView(),
    );
  }
}
