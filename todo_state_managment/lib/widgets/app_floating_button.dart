import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_view/todo_cubit/todo_cubit.dart';
import '../utils/service_locator.dart';

class AppFloatingButton extends StatelessWidget {
  AppFloatingButton({
    super.key,
  });

  final TextEditingController textController =
      TextControllerInstance.textController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black87
          : Colors.indigo,
      onPressed: () {
        context.read<TodoCubit>().addNewTodoItem(textController.text.trim());
        textController.clear();
        FocusScope.of(context).unfocus();
      },
      child: Icon(
        Icons.add_task,
        color: Colors.purple[100],
      ),
    );
  }
}
