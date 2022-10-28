import 'package:hive_flutter/hive_flutter.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  String? text;

  @HiveField(1)
  bool completed;

  Todo({
    required this.text,
    this.completed = false,
  });
}
