import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/home_view/todo_cubit/todo_cubit.dart';

import 'color_schemes.dart';
import 'home_view/home_view.dart';
import 'utils/theme_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => TodoCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Todo App',
                theme: ThemeData(
                  colorScheme: lightColorScheme,
                ),
                darkTheme: ThemeData(
                  colorScheme: darkColorScheme,
                ),
                themeMode: themeMode,
                home: const HomeView(),
              )),
    );
  }
}
