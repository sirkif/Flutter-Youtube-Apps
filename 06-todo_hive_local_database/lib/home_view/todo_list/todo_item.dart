import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';

import '../../providers/todo_provider.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todoItem,
  });

  final TodoModel todoItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      // clipBehavior: Clip.antiAlias,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(
      //     50,
      //   ),
      // ),
      child: ListTile(
        // tileColor: Colors.white,
        leading: IconButton.filledTonal(
          onPressed: () {
            if (!todoItem.completed) {
              context.read<TodoProvider>().markTodoAsCompleted(todoItem.id);
            } else {
              context.read<TodoProvider>().markTodoAsActive(todoItem.id);
            }
          },
          icon: Icon(
            todoItem.completed ? Icons.task_alt : Icons.circle_outlined,
          ),
        ),
        title: Text(
          todoItem.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            decoration: todoItem.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        // trailing: const Icon(
        //   Icons.clear,
        // ),
      ),
    );
  }
}
