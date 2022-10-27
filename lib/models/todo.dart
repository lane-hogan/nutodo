class Todo {
  String? id;
  String? text;
  bool completed;

  Todo({
    required this.id,
    required this.text,
    this.completed = false,
  });
}
