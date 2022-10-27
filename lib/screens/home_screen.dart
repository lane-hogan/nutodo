import 'package:flutter/material.dart';
import 'package:nutodo/models/todo.dart';
import 'package:nutodo/utils/colors.dart';
import 'package:nutodo/widgets/search_bar.dart';
import 'package:nutodo/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> todos = [
    Todo(id: '01', text: 'Morning Exercise', completed: true),
    Todo(id: '02', text: 'Buy Groceries', completed: true),
    Todo(id: '03', text: 'Check Emails'),
    Todo(id: '04', text: 'Team Meeting'),
    Todo(id: '05', text: 'Work on apps for 2 hours'),
    Todo(id: '06', text: 'Dinner with John'),
  ];

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

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
              child: todos.isEmpty
                  ? const Center(
                      child: Text(
                        'No items in your list',
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) => TodoItem(
                        todo: todos[index],
                        onDeleteTapped: () => deleteTodo(index),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
