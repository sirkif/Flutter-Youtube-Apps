import 'package:flutter/foundation.dart';

import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> activeTodos = [];
  List<TodoModel> completedTodos = [];

  void addNewTodoItem(String value) {
    if (value.isNotEmpty) {
      final newTodo = TodoModel(
        title: value,
      );

      activeTodos.add(newTodo);
      notifyListeners();
    }
  }

  void markTodoAsCompleted(String id) {
    // 1- Get index of ActiveTodo Item
    final activeItemIndex =
        activeTodos.indexWhere((todoItem) => todoItem.id == id);

    // 2- Create a copy of ActiveTodo Item and update its completed prop to => True
    final updatedItem = activeTodos[activeItemIndex].copyWith(completed: true);

    // 3- Update the modified Active Todo Item
    activeTodos[activeItemIndex] = updatedItem;

    // 4- Add the modified Todo Item to the CompletedTodos list
    completedTodos.add(updatedItem);

    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      // 5- Remove the CompletedTodo Item from ActiveTodos List
      activeTodos.removeAt(activeItemIndex);

      notifyListeners();
    });
  }

  void markTodoAsActive(String id) {
    // 1- Get CompletedTodo Item
    final completedTodoItem =
        completedTodos.firstWhere((todoItem) => todoItem.id == id);

    // 2- Create a copy of ActiveTodo Item and update its completed prop to => False
    final updatedItem = completedTodoItem.copyWith(completed: false);

    // 3- Add the modified Todo Item to the ActiveTodos list
    activeTodos.add(updatedItem);

    // 4- Remove the ActiveTodo Item from CompletedTodos List
    completedTodos.removeWhere((todo) => todo.id != updatedItem.id);

    notifyListeners();
  }

  void removeActiveTodo(TodoModel todoItem) {
    activeTodos.remove(todoItem);

    notifyListeners();
  }

  void removeCompletedTodo(TodoModel todoItem) {
    completedTodos.remove(todoItem);

    notifyListeners();
  }
}
