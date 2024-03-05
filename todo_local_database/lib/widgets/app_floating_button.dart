import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';

import '../providers/todo_provider.dart';
import '../utils/service_locator.dart';

class AppFloatingButton extends StatelessWidget {
  AppFloatingButton({
    super.key,
  });

  final textControllerSingleton = TextControllerSingleton.textController;

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.read<TodoProvider>();
    return FloatingActionButton(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black87
          : Colors.indigo,
      onPressed: () async {
        await Hive.deleteBoxFromDisk(todoBoxModel);
        // todoProvider.addNewTodoItem(textControllerSingleton.text.trim());
        // textControllerSingleton.clear();
        // FocusScope.of(context).unfocus();
      },
      child: Icon(
        Icons.add_task,
        color: Colors.purple[100],
      ),
    );
  }
}
