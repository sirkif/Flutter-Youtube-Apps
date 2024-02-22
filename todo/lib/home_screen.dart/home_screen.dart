import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/home_screen.dart/app_todo.dart';
import 'package:todo_app/home_screen.dart/todo_list/todo_list.dart';
import 'package:todo_app/widgets/app_floating_button.dart';

import 'app_textfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  gradient: kDarkLinearGradient,
                ),
                child: const Column(
                  children: [
                    //  App Todo
                    AppTodo(),
                    SizedBox(
                      height: 24,
                    ),
                    // App TextField
                    AppTextField(),
                  ],
                ),
              ),

              // Todo List
              const TodoList(),

              // App Floating Button
            ],
          ),
        ),
        floatingActionButton: const AppFloatingButton(),
      ),
    );
  }
}
