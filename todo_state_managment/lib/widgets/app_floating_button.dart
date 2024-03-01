import 'package:flutter/material.dart';

import '../utils/service_locator.dart';

class AppFloatingButton extends StatelessWidget {
  AppFloatingButton({
    super.key,
  });

  final todoViewModel = TodoViewModelInstance.todoViewModel;

  final textController = TextControllerInstance.textEditingController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black87,
      onPressed: () {
        todoViewModel.addNewTodoItem(textController.text.trim());
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
