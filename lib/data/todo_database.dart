import 'package:hive_flutter/hive_flutter.dart';

final _box = Hive.box('todos');

class TodoDatabase {
  List todos = [];

  void load() {
    todos = _box.get('items');
  }

  void update() {
    _box.put('items', todos);
  }
}
