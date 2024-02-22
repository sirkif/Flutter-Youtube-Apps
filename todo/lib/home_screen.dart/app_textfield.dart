import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      // obscureText: true,
      // keyboardType: TextInputType.number,
      cursorWidth: 4,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        filled: true,
        fillColor: kDarkSecondaryColor,
        hintText: 'Create a new todo..',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.white.withOpacity(0.7),
        ),
        // prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {/* Handle icon click */},
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
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(8),
        //     borderSide: const BorderSide(
        //       color: Colors.red,
        //       width: 5,
        //     )),
      ),
    );
  }
}
