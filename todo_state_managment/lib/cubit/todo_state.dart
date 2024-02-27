part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoEmptyList extends TodoState {}

final class TodoActiveList extends TodoState {
  final List<Todo> todoList;

  TodoActiveList({required this.todoList});
}

final class TodoCompletedList extends TodoState {}
