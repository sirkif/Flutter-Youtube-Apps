import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todo_observer.dart';

import 'cubit/todo_cubit.dart';
import 'home_screen/home_screen.dart';

void main() {
  Bloc.observer = const TodoBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.purple[900],
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData.dark(),
        // darkTheme: ThemeData.dark(),
        // themeMode: ThemeMode.system,
        // darkTheme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: kDarkPrimaryColor,
        // ),
        // theme: AppTheme().theme(context),
        home: const HomeScreen(),
      ),
    );
  }
}
