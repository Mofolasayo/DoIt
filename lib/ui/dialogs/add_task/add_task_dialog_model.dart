import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';

import 'package:todo_app/services/category_service.dart';
import 'package:todo_app/services/task_service.dart';

import '../../../models/models.dart';

class AddTaskDialogModel extends ReactiveViewModel {
  final _dialogService = locator<DialogService>();
  final _taskService = locator<TaskService>();
  final _categoryService = locator<CategoryService>();
  final taskController = TextEditingController();
  Category? selectedCategory;
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  void initialize() {
    _categoryService.addListener(notifyListeners);
  }

  void addTask(String title, {Category? category}) {
    if (selectedDate != null && selectedTime != null) {
      final fullDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      _taskService.addTask(title, fullDateTime, category: category);
    }
    notifyListeners();
  }

  void showCalenderDialog() {
    _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.calenderPicker,
    );
  }

  void showCategoryDialog() async {
    final response = await _dialogService.showCustomDialog(
        title: "Cateogry",
        barrierDismissible: true,
        variant: DialogType.category);

    if (response != null && response.confirmed && response.data is Category) {
      selectedCategory = response.data as Category;
    }
    _categoryService.selectedCategory = selectedCategory;

    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        barrierColor: const Color.fromARGB(191, 0, 0, 0),
        context: context,
        firstDate: DateTime(2000),
        initialDate: DateTime.now(),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      selectedDate = pickedDate;
      if (context.mounted) {
        selectTime(context);
      }
      notifyListeners();
    }
  }

  void selectTime(BuildContext context) async {
    final pickedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    selectedTime = await pickedTime;
    notifyListeners();
  }
}
