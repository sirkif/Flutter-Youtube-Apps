import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/todo.dart';
import '../widgets/app_textfield.dart';

class AppTodo extends StatelessWidget {
  const AppTodo({
    super.key,
    required this.todoList,
    required this.addNewTodoItem,
    required this.textController,
  });

  final List<Todo> todoList;
  final TextEditingController textController;
  final Function(String) addNewTodoItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
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
                  onPressed: () {},
                  icon: const Icon(Icons.sunny),
                )
              ],
            ),
            const SizedBox(
              height: kPadding24,
            ),
            // App TextField
            AppTextField(
              todoList: todoList,
              textController: textController,
              addNewTodoItem: addNewTodoItem,
            ),
          ],
        ),
      ),
    );
  }
}
