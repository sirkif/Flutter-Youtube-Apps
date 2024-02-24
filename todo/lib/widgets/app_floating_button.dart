import 'package:flutter/material.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({
    super.key,
    required this.addNewTodoItem,
  });

  final Function() addNewTodoItem;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black87,
      onPressed: addNewTodoItem,
      child: Icon(
        Icons.add_task,
        color: Colors.purple[100],
      ),
    );
  }
}
