import 'package:uuid/uuid.dart';

class TodoModel {
  final String id = const Uuid().v1();
  String title;
  bool completed = false;

  TodoModel({
    required this.title,
    this.completed = false,
  });
}
