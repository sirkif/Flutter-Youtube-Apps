import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/home_view/todo_provider/todo_provider.dart';

import '../utils/service_locator.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final textControllerSingleton = TextControllerSingleton.textController;

  @override
  void dispose() {
    super.dispose();
    textControllerSingleton.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      // obscureText: true,
      // keyboardType: TextInputType.number,
      // style: const TextStyle(color: Colors.orange),
      controller: textControllerSingleton,
      onSubmitted: (value) {
        context.read<TodoProvider>().addNewTodoItem(value.trim());
        textControllerSingleton.clear();
        FocusScope.of(context).unfocus();
      },
      cursorWidth: 4,
      cursorColor: Colors.cyan,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF25273D)
            : Colors.white,
        hintText: 'Create a new todo..',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        // prefixIcon: const Icon(Icons.search),
        suffixIcon: textControllerSingleton.text.isEmpty
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  textControllerSingleton.clear();
                },
                icon: Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              kBorderRadius8,
            ),
          ),
          borderSide: BorderSide(
            width: 3,
            color: Colors.cyanAccent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              kBorderRadius8,
            ),
          ),
          borderSide: BorderSide(
            width: 3,
            color: Colors.yellow,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              kBorderRadius8,
            ),
          ),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              kBorderRadius8,
            ),
          ),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
