import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';
import '/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController taskController = TextEditingController();
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    _buildAddTaskName(),
                    SizedBox(
                      width: 16,
                    ),
                    _buildAddTaskButton(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: _buildListViewTasks(),
                ),
                Row(children: [
                  _buildLabelPendingTasks(),
                  _buildClearTasksButton()
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddTaskName() {
    return Expanded(
      child: TextField(
        controller: taskController,
        decoration: InputDecoration(
            hintText: "Inserir tarefa", border: OutlineInputBorder()),
      ),
    );
  }

  Widget _buildAddTaskButton() {
    return ElevatedButton(
      onPressed: addTask,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.all(13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      ),
    );
  }

  Widget _buildClearTasksButton() {
    return ElevatedButton(
        onPressed: clearTasks,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.all(13),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          "Limpar tarefas",
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget _buildLabelPendingTasks() {
    return Expanded(child: Text("Você tem 0 tarefas pendentes"));
  }

  Widget _buildListViewTasks() {
    return Flexible(
      child: ListView(
        shrinkWrap: true,
        children: [
          for (Task task in tasks) TodoListItem(task: task),
        ],
      ),
    );
  }

  void addTask() {
    setState(() {
      DateTime now = DateTime.now();
      Task newTask = Task(taskName: taskController.text, inclusionDate: now);
      tasks.add(newTask);
      taskController.clear();
    });
  }

  void clearTasks() {
    setState(() {
      tasks.clear();
      taskController.clear();
    });
  }
}
