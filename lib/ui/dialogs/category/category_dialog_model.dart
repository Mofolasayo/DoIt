import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/services/category_service.dart';

class CategoryDialogModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _categoryService = locator<CategoryService>();

  List<Category> get categories => _categoryService.category;
  IconData? selectedIcon;

  void initialize() {
    _categoryService.addListener(notifyListeners);
  }

  void setCategory(String title, IconData icon, Color color) {
    _categoryService.setCategory(title, icon, color);
    notifyListeners();
  }

  @override
  void dispose() {
    _categoryService.removeListener(notifyListeners);
    super.dispose();
  }

  void navigateToCategoryView() async {
    await _navigationService.navigateToCategoryView();
    notifyListeners();
  }
}
