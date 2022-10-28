import 'package:flutter/material.dart';
import 'package:nutodo/data/todo_database.dart';
import 'package:nutodo/models/todo.dart';
import 'package:nutodo/utils/colors.dart';
import 'package:nutodo/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoDatabase db = TodoDatabase();

  final TextEditingController _todoTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    db.load();
    db.update();
  }

  void deleteTodo(int index) {
    setState(() {
      db.todos.removeAt(index);
    });
    db.update();
  }

  void addTodo() {
    Todo todo = Todo(text: _todoTextController.text, completed: false);
    setState(() {
      db.todos.add(todo);
    });
    _todoTextController.clear();
    Navigator.of(context).pop();

    db.update();
  }

  void showAddTodoDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: _todoTextController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter todo item',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _todoTextController.clear();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: addTodo,
              child: const Text('Create'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Todos',
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: AppColors.black,
          iconSize: 30.0,
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            Expanded(
              child: db.todos.isEmpty
                  ? const Center(
                      child: Text(
                        'No items in your list',
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: db.todos.length,
                      itemBuilder: (context, index) => TodoItem(
                        todo: db.todos[index],
                        onDeleteTapped: () => deleteTodo(index),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add, size: 30.0),
        onPressed: () => showAddTodoDialog(context),
      ),
    );
  }
}
