import 'package:uuid/uuid.dart';

class Todo {
  final String id = const Uuid().v1();
  String title;
  bool completed;

  Todo({
    required this.title,
    this.completed = false,
  });
}
