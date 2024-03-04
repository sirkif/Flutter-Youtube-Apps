import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part "todo_model.g.dart";

const uiid = Uuid();

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  bool completed;

  TodoModel({
    required this.id,
    required this.title,
    this.completed = false,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    bool? completed,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
