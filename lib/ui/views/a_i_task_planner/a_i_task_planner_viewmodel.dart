import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/user_task.dart';
import 'package:todo_app/services/ai_service.dart';
import 'package:todo_app/services/task_service.dart';

class AiTaskPlannerViewModel extends BaseViewModel {
  final _aiService = locator<AiService>();
  final _taskService = locator<TaskService>();
  final _navigationService = locator<NavigationService>();

  final promptController = TextEditingController();
  List<Task> generatedTasks = [];
  final Set<int> selectedIndexes = {};

  Future<void> generateTasks() async {
    setBusy(true);
    generatedTasks =
        await _aiService.generateTasksFromPrompt(promptController.text);
    selectedIndexes.clear();
    setBusy(false);
    notifyListeners();
  }

  void toggleSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }
    notifyListeners();
  }

  void importSelectedTasks(Category? category) async {
    for (var index in selectedIndexes) {
      final task = generatedTasks[index];
      _taskService.addTask(task.title, task.createdAt, category: category);
    }
    generatedTasks.clear();
    selectedIndexes.clear();
    await _navigationService.replaceWithBottomNavView();
    notifyListeners();
  }

  void navigateToHomeView() => _navigationService.replaceWithBottomNavView();
}
