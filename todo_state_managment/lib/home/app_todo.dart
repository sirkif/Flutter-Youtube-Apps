import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:todo_app/utils/app_theme_state.dart';

import '../constants.dart';
import '../widgets/app_textfield.dart';

class AppTodo extends StatefulWidget {
  const AppTodo({
    super.key,
  });

  @override
  State<AppTodo> createState() => _AppTodoState();
}

class _AppTodoState extends State<AppTodo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(
        vertical: kPadding32,
        horizontal: kPadding16,
      ),
      decoration: const BoxDecoration(
        gradient: kDarkLinearGradient,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TODO",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 8,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  June.getState(AppThemeState()).toggleTheme();
                  // Toggle between light and dark modes
                },
                icon: JuneBuilder(
                  () => AppThemeState(),
                  builder: (controller) => AppThemeState.isDarkMode
                      ? const Icon(
                          color: Colors.white,
                          Icons.dark_mode,
                        )
                      : const Icon(
                          color: Colors.white,
                          Icons.wb_sunny_outlined,
                        ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: kPadding24,
          ),
          // App TextField
          const AppTextField(),
        ],
      ),
    );
  }
}
