import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  List<TodoModel> completedList = [];
  void addNewTodoItem(String value) {
    if (value.isNotEmpty) {
      final activeTodo = TodoModel(title: value);
      state.add(activeTodo);
      emit(state);
    }
  }

  void markTodoAsCompleted(String id) {
    List<TodoModel> updatedList = [...state];
    final todoItemIndex =
        updatedList.indexWhere((todoItem) => todoItem.id == id);
    updatedList[todoItemIndex].completed = true;

    completedList.add(updatedList[todoItemIndex]);

    emit(updatedList);

    Future.delayed(const Duration(seconds: 2), () {
      updatedList = state.where((todo) => todo.id != id).toList();
      emit(updatedList);
    });
  }

  void markTodoAsActive(String id) {
    final updatedList = completedList.map(
      (todoItem) {
        if (todoItem.id == id) {
          return TodoModel(title: todoItem.title, completed: false);
        }
        return todoItem;
      },
    ).toList();

    emit(updatedList);
  }
}
