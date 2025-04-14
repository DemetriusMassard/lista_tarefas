import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              SizedBox(height: 16),
              Row(children: [
                _buildLabelPendingTasks(),
                _buildClearTasksButton()
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddTaskName() {
    return Expanded(
      child: TextField(
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
        onPressed: addTask,
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

  void addTask() {}
}
