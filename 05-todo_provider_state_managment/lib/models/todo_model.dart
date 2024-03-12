class TodoModel {
  int id;
  String title;
  bool completed;

  TodoModel({
    required this.id,
    required this.title,
    this.completed = false,
  });
}
