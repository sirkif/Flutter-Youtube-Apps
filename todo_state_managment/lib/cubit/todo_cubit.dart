import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  bool isCompleted = false;

  void addNewTodoItem(String value) {
    if (value.isNotEmpty) {
      final activeTodo = Todo(title: value);

      emit([...state, activeTodo]);
    }
  }

  void getTodoList() {
    final List<Todo> todoList = [
      Todo(title: "Ayoub", completed: true),
      Todo(title: "Ayoub", completed: true),
    ];

    if (isCompleted) {
      final completedTodo =
          state.where((todoItem) => todoItem.completed).toList();

      emit(completedTodo);
    }

    emit(state);
  }

  List<Todo> getCompletedList() {
    List<Todo> completedList = [
      Todo(title: "Ayoub", completed: true),
      Todo(title: "Ayoub", completed: true),
    ];

    completedList = state.where((todoItem) => todoItem.completed).toList();

    // emit(completedList);
    return completedList;
  }

  void markTodoAsCompleted(String id) {
    final todo = state.firstWhere(
      (todoItem) => todoItem.id == id,
    );
  }
}
