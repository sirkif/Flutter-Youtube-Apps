import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.addNewTodoItem,
    required this.textController,
  });

  final TextEditingController textController;
  final Function(String) addNewTodoItem;

  //  This solution won't work because they need a shared instance of TextEditingController
  // final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      // obscureText: true,
      // keyboardType: TextInputType.number,
      // style: const TextStyle(color: Colors.orange),
      controller: textController,
      onSubmitted: (value) => addNewTodoItem(value),
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
        fillColor: const Color(0xFF25273D),
        hintText: 'Create a new todo..',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.white.withOpacity(0.7),
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
