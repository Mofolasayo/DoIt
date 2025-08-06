import 'package:stacked/stacked.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/user_task.dart';

class TaskService with ListenableServiceMixin {
  final List<Task> _tasks = [];
  final List<Task> _completedTask = [];

  List<Task> get completedTask => _completedTask;
  List<Task> get tasks => _tasks;

  TaskService() {
    listenToReactiveValues([_tasks, _completedTask]);
  }

  void addTask(String title, DateTime selectedDate, {Category? category}) {
    _tasks.add(
      Task(
          title: title,
          createdAt: selectedDate,
          isCompleted: false,
          category: category),
    );

    notifyListeners();
  }

  void addCompletedTask(String title, DateTime selectedDate) {
    _completedTask.add(
      Task(title: title, createdAt: selectedDate, isCompleted: true),
    );
    notifyListeners();
  }
}
