import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/home_view/todo_cubit/todo_cubit.dart';
import 'package:todo_app/models/todo_model.dart';

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
              context.read<TodoCubit>().markTodoAsCompleted(todoItem.id);
            } else {
              context.read<TodoCubit>().markTodoAsActive(todoItem.id);
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
