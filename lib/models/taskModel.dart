class TaskModel {
  final int id;
  final String title;
  bool completed;

  TaskModel({required this.id, required this.title, required this.completed});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
