import 'package:flutter/material.dart';

class AppTodo extends StatelessWidget {
  const AppTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
