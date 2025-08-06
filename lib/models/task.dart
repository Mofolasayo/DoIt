import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime createdAt;

  @HiveField(2)
  bool isCompleted;

  @HiveField(3)
  String? categoryName;

  @HiveField(4)
  String? priorityName;

  Task({
    required this.title,
    required this.createdAt,
    required this.isCompleted,
    this.categoryName,
    this.priorityName,
  });
}
