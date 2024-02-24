import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/app_textfield.dart';

class AppTodo extends StatefulWidget {
  const AppTodo({
    super.key,
    required this.textController,
    required this.addNewTodoItem,
  });

  final TextEditingController textController;
  final Function(String) addNewTodoItem;

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
                ),
              ),
              IconButton(
                onPressed: () {
                  // setState(() {
                  // themeMode = themeMode == ThemeMode.light
                  //       ? ThemeMode.dark
                  //       : ThemeMode.light;
                  // });
                },
                icon: const Icon(
                  Icons.dark_mode,
                  // themeMode == ThemeMode.light
                  //     ? Icons.wb_sunny_outlined
                  //     : Icons.dark_mode,
                ),
              )
            ],
          ),
          const SizedBox(
            height: kPadding24,
          ),
          // App TextField
          AppTextField(
            textController: widget.textController,
            addNewTodoItem: widget.addNewTodoItem,
          ),
        ],
      ),
    );
  }
}
