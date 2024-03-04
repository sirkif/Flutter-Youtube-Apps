import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> todoList = [];

  List<TodoModel> _activeTodos = [];
  List<TodoModel> _completedTodos = [];

  Box<TodoModel> todoBox = Hive.box<TodoModel>(todoBoxModel);

  TodoProvider() {
    getTodoList();
  }

  void getTodoList() {
    _activeTodos = todoBox.values
        .where((todoIten) => !todoIten.completed)
        .toList()
        .reversed
        .toList();
  }

  List<TodoModel> get activeTodos {
    // items.sort((a, b) => a.name.compareTo(b.name)); //ASC
    // items.sort((b, a) => a.name.compareTo(b.name)); //DESC

    return _activeTodos;
  }

  List<TodoModel> get completedTodos {
    final completedList = todoBox.values.toList();

    _completedTodos =
        completedList.where((todoIten) => todoIten.completed).toList();
    return _completedTodos;
  }

  void addNewTodoItem(String value) {
    if (value.isNotEmpty) {
      final newTodo = TodoModel(
        id: const Uuid().v1(),
        title: value,
      );

      todoBox.add(newTodo);
      getTodoList();

      notifyListeners();
    }
  }

  void markTodoAsCompleted(String id) {
    final todoIndex =
        todoBox.values.toList().indexWhere((todoItem) => todoItem.id == id);

    final activeItem = todoBox.get(todoIndex);

    if (activeItem != null) {
      final updatedItem = activeItem.copyWith(completed: true);

      final activeItemIndex =
          _activeTodos.indexWhere((todoItem) => todoItem.id == id);

      _activeTodos[activeItemIndex] = updatedItem;

      todoBox.put(todoIndex, updatedItem);
      notifyListeners();

      Future.delayed(const Duration(seconds: 2), () {
        _activeTodos.removeWhere((todoItem) => todoItem.id == activeItem.id);
        notifyListeners();
      });
    }
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
    _activeTodos.remove(todoItem);

    todoBox.delete(todoItem.id);
    notifyListeners();
  }

  void removeCompletedTodo(TodoModel todoItem) {
    todoBox.delete(todoItem.id);

    notifyListeners();
  }

  @override
  void dispose() {
    todoBox.close();
    super.dispose();
  }
}



// void markTodoAsActive(String id) {
//   final todo = todoBox.values.firstWhere((element) => element.id == id);
//   todo.completed = false;
//   todo.save();
//   notifyListeners();
// }

// void removeActiveTodo(String id) {
//   todoBox.delete(id);
//   notifyListeners();
// }

// void removeCompletedTodo(String id) {
//   todoBox.delete(id);
//   notifyListeners();
// }
