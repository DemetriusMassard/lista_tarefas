import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({required this.task, super.key, required this.onDelete});
  final Function(Task task) onDelete;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.red.shade900,
              onPressed: (context) {
                onDelete(task);
              },
              icon: Icons.delete,
              label: "Delete",
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat(
                  'dd/MM/yyyy',
                ).format(task.inclusionDate),
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
        ),
      ),
    );
  }
}
