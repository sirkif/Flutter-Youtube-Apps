import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

import '../utils/service_locator.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final textController = TextControllerInstance.textEditingController;
  final todoViewModel = TodoViewModelInstance.todoViewModel;

  @override
  void dispose() {
    super.dispose();

    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return TextField(
      // autofocus: true,
      // obscureText: true,
      // keyboardType: TextInputType.number,
      // style: const TextStyle(color: Colors.orange),
      controller: textController,
      onSubmitted: (value) {
        todoViewModel.addNewTodoItem(value);
        textController.text = "";
        FocusScope.of(context).unfocus();
      },

      // onChanged: (value) {
      //   setState(() {
      //     textController.text = value;
      //   });
      // },
      cursorWidth: 4,
      cursorColor: Colors.cyan,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        filled: true,
        fillColor: themeContext.brightness == Brightness.dark
            ? const Color(0xFF25273D)
            : Colors.white,
        hintText: 'Create a new todo..',
        hintStyle: TextStyle(
          fontSize: 16,
          color: themeContext.colorScheme.onSurfaceVariant,
        ),
        // prefixIcon: const Icon(Icons.search),
        suffixIcon: textController.text.isEmpty
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  textController.clear();
                },
                icon: const Icon(
                  Icons.clear,
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
