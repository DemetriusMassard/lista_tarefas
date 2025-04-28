class Task {
  Task({required this.taskName, required this.inclusionDate});

  String taskName;
  DateTime inclusionDate;

  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'inclusionDate': inclusionDate.toIso8601String()
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(taskName: map['taskName'], inclusionDate: DateTime.parse(map['inclusionDate']));
  }
}
