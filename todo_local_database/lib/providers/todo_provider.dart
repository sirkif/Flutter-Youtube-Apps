import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants.dart';

import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  int todoId = 0;

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

  List<TodoModel> get activeTodos => _activeTodos;

  List<TodoModel> get completedTodos {
    final completedItems = todoBox.values.toList();

    _completedTodos =
        completedItems.where((todoIten) => todoIten.completed).toList();
    return _completedTodos;
  }

  void addNewTodoItem(String value) {
    if (value.isNotEmpty) {
      final newTodo = TodoModel(
        id: todoId++,
        title: value,
      );

      todoBox.put(newTodo.id, newTodo);
      getTodoList();

      notifyListeners();
    }
  }

  void markTodoAsCompleted(int id) {
    final activeItem = todoBox.get(id);

    if (activeItem != null) {
      final updatedItem = activeItem.copyWith(completed: true);

      final activeItemIndex =
          _activeTodos.indexWhere((todoItem) => todoItem.id == id);

      _activeTodos[activeItemIndex] = updatedItem;

      todoBox.put(id, updatedItem);

      notifyListeners();

      Future.delayed(const Duration(seconds: 1), () {
        _activeTodos.removeWhere((todoItem) => todoItem.id == id);
        notifyListeners();
      });
    }
  }

  void markTodoAsActive(int id) {
    final completedTodoItem =
        _completedTodos.firstWhere((todoItem) => todoItem.id == id);

    final updatedItem = completedTodoItem.copyWith(completed: false);

    todoBox.put(id, updatedItem);

    _activeTodos.removeWhere((todoItem) => todoItem.id == id);
    getTodoList();

    notifyListeners();
  }

  void removeActiveTodo(int id) {
    _activeTodos.removeWhere((todoItem) => todoItem.id == id);

    todoBox.delete(id);
    notifyListeners();
  }

  void removeCompletedTodo(int id) {
    _completedTodos.removeWhere((todoItem) => todoItem.id == id);

    todoBox.delete(id);
    notifyListeners();
  }

  @override
  void dispose() {
    todoBox.close();
    super.dispose();
  }
}
