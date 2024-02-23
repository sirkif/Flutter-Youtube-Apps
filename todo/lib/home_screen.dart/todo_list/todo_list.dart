import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/home_screen.dart/todo_list/todo_item.dart';

import '../../models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.todoList});

  final List<Todo> todoList;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void removeTodo(Todo todoItem) {
    final int indexTodo = int.parse(todoItem.id);
    setState(() {
      widget.todoList.removeAt(indexTodo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${todoItem.title} dismissed'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: kPadding8,
        left: kPadding16,
        right: kPadding16,
        bottom: keyboardSpace,
      ),
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) {
        final todoItem = widget.todoList[index];

        return Dismissible(
          key: Key(todoItem.id),
          direction: DismissDirection.endToStart,
          background: Container(
            width: 100, // Adjust width as needed
            alignment: Alignment.centerLeft,
            color: Colors.green,
            child: const Icon(Icons.edit),
          ),
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
          onDismissed: (direction) => removeTodo(todoItem),
          confirmDismiss: (DismissDirection direction) async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Are you sure you want to delete?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Yes'),
                    )
                  ],
                );
              },
            );

            return confirmed;
          },
          child: TodoItem(
            todo: todoItem,
          ),
        );
      },
    );
  }
}
