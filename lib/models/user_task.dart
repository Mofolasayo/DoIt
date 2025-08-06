import 'package:todo_app/models/models.dart';

class Task {
  final String title;
  final DateTime createdAt;
  bool isCompleted;
  Category? category;
  Priority? piority;
  Task({
    required this.title,
    required this.createdAt,
    required this.isCompleted,
    this.category,
  });
}
