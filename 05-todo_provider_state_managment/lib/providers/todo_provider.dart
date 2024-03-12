import 'package:flutter/foundation.dart';

import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  int todoId = 0;

  List<TodoModel> activeTodos = [];
  List<TodoModel> completedTodos = [];

  void addNewTodoItem(String value) {
    if (value.isNotEmpty) {
      final newTodo = TodoModel(
        id: todoId++,
        title: value,
      );

      activeTodos.add(newTodo);
      notifyListeners();
    }
  }

  void markTodoAsCompleted(int id) {
    // 1- Get index of ActiveTodo Item
    final activeItemIndex = activeTodos.indexWhere((item) => item.id == id);

    // 2- Create a copy of ActiveTodo Item and update its completed prop to => True
    activeTodos[activeItemIndex].completed = true;

    // 3- Add the modified Todo Item to the CompletedTodos list
    completedTodos.add(activeTodos[activeItemIndex]);

    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      // 4- Remove the CompletedTodo Item from ActiveTodos List
      activeTodos.removeAt(activeItemIndex);

      notifyListeners();
    });
  }

  void markTodoAsActive(int id) {
    // 1- Get CompletedTodo Item
    final completedTodoItem =
        completedTodos.firstWhere((item) => item.id == id);

    // 2- Update its completed property to => False
    completedTodoItem.completed = false;

    // 3- Add the modified Todo Item to the ActiveTodos list
    activeTodos.add(completedTodoItem);

    // 4- Remove the ActiveTodo Item from CompletedTodos List
    completedTodos.removeWhere((item) => item.id == id);

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
