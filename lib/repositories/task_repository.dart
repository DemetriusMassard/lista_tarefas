import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

class TaskRepository {
  late SharedPreferences sharedPreferences;

  void saveTasks(List<Task> tasks) {
    final String jsonString = json.encode(tasks);
    sharedPreferences.setString("tasks", jsonString);
  }

  Future<List<Task>> loadTasks() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString('tasks') ?? "[]";

    List<dynamic> tasksDecoded = json.decode(jsonString) as List;
    return tasksDecoded.map((e) => Task.fromJson(e)).toList();
    
  }
}
