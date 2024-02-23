import 'package:flutter/material.dart';

import '../models/todo.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({
    super.key,
    required this.todoList,
    required this.addNewTodoItem,
  });

  final List<Todo> todoList;
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
