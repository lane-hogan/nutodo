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
            const SearchBar(),
            Container(
              margin: const EdgeInsets.only(top: 50.0, bottom: 20.0),
              child: const Text(
                'Todos',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) => TodoItem(
                  todo: todos[index],
                  onDeleteTapped: () => deleteTodo(index),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
