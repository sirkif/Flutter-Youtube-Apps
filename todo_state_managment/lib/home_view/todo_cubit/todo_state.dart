import '../../models/todo_model.dart';

class TodoState {
  final List<TodoModel> activeTodos;
  final List<TodoModel> completedTodos;

  TodoState({required this.activeTodos, required this.completedTodos});

  TodoState copyWith({
    List<TodoModel>? activeTodos,
    List<TodoModel>? completedTodos,
  }) {
    return TodoState(
      activeTodos: activeTodos ?? this.activeTodos,
      completedTodos: completedTodos ?? this.completedTodos,
    );
  }
}
