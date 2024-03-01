import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/home/todo_list/todo_item.dart';
import 'package:todo_app/utils/service_locator.dart';

import '../../models/todo_model.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
    required this.todoList,
  });

  final List<TodoModel> todoList;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // void removeTodo(Todo todoItem) {
  //   // print('Removing todo with ID: ${todoItem.id}');
  //   setState(() {
  //     widget.todoList.remove(todoItem);
  //   });

  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     backgroundColor: kDarkPrimaryColor,
  //     content: Text(
  //       '${todoItem.title} dismissed',
  //       style: TextStyle(
  //         color: Colors.purple[100],
  //       ),
  //     ),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: kPadding8,
        horizontal: kPadding16,
      ),
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) {
        final todoItem = widget.todoList[index];

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
          // onDismissed: (direction) => removeTodo(todoItem),
          confirmDismiss: (DismissDirection direction) async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) {
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
              },
            );

            return confirmed;
          },
          child: TodoItem(
            todoItem: todoItem,
            todoViewModel: TodoViewModelInstance.todoViewModel,
          ),
        );
      },
    );
  }
}
