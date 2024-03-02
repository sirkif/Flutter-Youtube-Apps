import 'package:uuid/uuid.dart';

class TodoModel {
  final String id = const Uuid().v1();
  String title;
  bool completed;

  TodoModel({
    required this.title,
    this.completed = false,
  });

  TodoModel copyWith({
    String? title,
    bool? completed,
  }) {
    return TodoModel(
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
