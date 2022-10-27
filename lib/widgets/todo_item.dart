import 'package:flutter/material.dart';
import 'package:nutodo/models/todo.dart';
import 'package:nutodo/utils/colors.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onDeleteTapped,
  });

  final Todo todo;
  final Function() onDeleteTapped;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: ListTile(
        onTap: () {
          setState(() {
            widget.todo.completed = !widget.todo.completed;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 4.0,
        ),
        tileColor: Colors.white,
        leading: widget.todo.completed
            ? const Icon(
                Icons.check_box,
                color: AppColors.blue,
              )
            : const Icon(Icons.check_box_outline_blank),
        title: Text(
          widget.todo.text ?? '',
          style: TextStyle(
            fontSize: 16.0,
            color: AppColors.black,
            decoration: widget.todo.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.white,
            iconSize: 20.0,
            onPressed: widget.onDeleteTapped,
          ),
        ),
      ),
    );
  }
}
