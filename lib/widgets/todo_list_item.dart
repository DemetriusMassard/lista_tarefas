import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.inclusionDate.toString(),
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            task.taskName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
