import 'package:june/state_manager.dart';

import '../../models/todo_model.dart';

class TodoViewModel extends JuneState {
  List<TodoModel> activeTodos = [];
  List<TodoModel> completedTodos = [];

  void addNewTodoItem(String value) {
    if (value.isNotEmpty) {
      final newTodo = TodoModel(
        title: value,
      );

      activeTodos = [...activeTodos, newTodo];
      setState();
    }
  }

  void markTodoAsCompleted(String id) {
    List<TodoModel> updatedList = [...activeTodos];
    final todoItemIndex =
        updatedList.indexWhere((todoItem) => todoItem.id == id);
    updatedList[todoItemIndex].completed = true;

    completedTodos = [...completedTodos, updatedList[todoItemIndex]];
    setState();

    Future.delayed(const Duration(seconds: 2), () {
      activeTodos = completedTodos.where((todo) => todo.id != id).toList();
      setState();
    });
  }

  void markTodoAsActive(String id) {
    List<TodoModel> updatedList = [...completedTodos];
    final todoItemIndex =
        updatedList.indexWhere((todoItem) => todoItem.id == id);
    updatedList[todoItemIndex].completed = false;

    activeTodos = [...activeTodos, updatedList[todoItemIndex]];

    completedTodos = activeTodos.where((todo) => todo.id != id).toList();
    setState();
  }
}
