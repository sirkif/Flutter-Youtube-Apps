import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo_model.dart';
import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState(activeTodos: [], completedTodos: []));

  void addNewTodoItem(String value) {
    if (value.isNotEmpty) {
      final newTodo = TodoModel(
        title: value,
      );

      List<TodoModel> updatedActiveTodos = [...state.activeTodos, newTodo];
      emit(state.copyWith(activeTodos: updatedActiveTodos));
    }
  }

  void markTodoAsCompleted(String id) {
    // 1- Create a copy of ActiveTodos List ( Clone )
    final updatedActiveList = [...state.activeTodos];

    // 2- Get index of ActiveTodo Item
    final activeTodoIndex =
        state.activeTodos.indexWhere((todo) => todo.id == id);

    // 3- Create a copy of ActiveTodo Item and update its completed prop to => True
    final activeTodoItem =
        state.activeTodos[activeTodoIndex].copyWith(completed: true);

    // 4- Update the modified Active Todo Item
    updatedActiveList[activeTodoIndex] = activeTodoItem;

    // 5- Add the modified Todo Item to the CompletedTodos list
    final updatedCompletedList = [...state.completedTodos, activeTodoItem];

    // Emit the new state with the updated lists
    emit(state.copyWith(
      activeTodos: updatedActiveList,
      completedTodos: updatedCompletedList,
    ));

    Future.delayed(const Duration(seconds: 2), () {
      updatedActiveList.removeAt(activeTodoIndex);
      emit(state.copyWith(
        activeTodos: updatedActiveList,
      ));
    });
  }

  void markTodoAsActive(String id) {
    final completedTodoItem =
        state.completedTodos.firstWhere((todo) => todo.id == id);
    final updatedCompletedList =
        state.completedTodos.where((todo) => todo.id != id).toList();

    final updatedActiveList = [
      ...state.activeTodos,
      completedTodoItem.copyWith(completed: false)
    ];

    emit(state.copyWith(
      activeTodos: updatedActiveList,
      completedTodos: updatedCompletedList,
    ));
  }

  void removeTodo(TodoModel todoModel) {
    final filteredActiveList =
        state.activeTodos.where((todo) => todo.id != todoModel.id).toList();
    final filteredCompletedList =
        state.completedTodos.where((todo) => todo.id != todoModel.id).toList();

    emit(state.copyWith(
      activeTodos: filteredActiveList,
      completedTodos: filteredCompletedList,
    ));
  }
}
