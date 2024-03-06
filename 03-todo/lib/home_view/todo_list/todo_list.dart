import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/home_view/todo_list/todo_item.dart';

import '../../models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList(
    this.todoList,
    this.markTodoAsCompleted,
    this.markTodoAsActive,
    this.removeTodo, {
    super.key,
  });

  final List<TodoModel> todoList;
  final Function(int) markTodoAsCompleted;
  final Function(int) markTodoAsActive;
  final Function(TodoModel) removeTodo;

  void showSnackBarWidget(BuildContext context, TodoModel todoItem) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(
        '${todoItem.title} dismissed',
        style: TextStyle(
          color: Colors.purple[100],
        ),
      ),
    ));
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure you want to delete it?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text("Yes"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: kPadding8,
        horizontal: kPadding16,
      ),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        final todoItem = todoList[index];

        return Dismissible(
          key: ValueKey(todoItem.id),
          direction: DismissDirection.endToStart,
          background: const SizedBox(),
          secondaryBackground: const Card(
            color: Colors.red,
            // child: Align(
            //   alignment: Alignment.centerRight,
            //   child: Padding(
            //     padding: EdgeInsets.only(right: 16),
            //     child: Icon(
            //       Icons.cancel,
            //     ),
            //   ),
            // ),
          ),
          onDismissed: (direction) {
            removeTodo(todoItem);
            showSnackBarWidget(context, todoItem);
          },
          confirmDismiss: (DismissDirection direction) async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) => buildAlertDialog(context),
            );

            return confirmed;
          },
          child: TodoItem(
            todoItem,
            markTodoAsCompleted,
            markTodoAsActive,
          ),
        );
      },
    );
  }
}
