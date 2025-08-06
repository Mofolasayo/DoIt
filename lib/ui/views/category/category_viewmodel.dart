import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/services/category_service.dart';
import 'package:todo_app/ui/common/app_colors.dart';

class CategoryViewModel extends BaseViewModel {
  final _categoryService = locator<CategoryService>();

  IconData? selectedIcon;
  final titleController = TextEditingController();

  List<Category> get categories => _categoryService.category;

  Color selectedColor = Colors.red;

  Future<void> pickIcon(BuildContext context) async {
    final icon = await showIconPicker(
      context,
      iconPackModes: [IconPack.cupertino],
      backgroundColor: const Color.fromARGB(247, 20, 20, 20),
      iconColor: kWhite,
    );
    if (icon != null) {
      selectedIcon = icon;
      notifyListeners();
    }
  }

  void selectColor(Color color) {
    selectedColor = color;
    notifyListeners();
  }

  void confirmNewCategory(BuildContext context) {
    final icon = selectedIcon;
    if (titleController.text.isNotEmpty) {
      final newCategory = Category(
          title: titleController.text, icon: icon!, color: selectedColor);
      _categoryService.category.add(newCategory);
      selectedIcon = null;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  final List<Color> colors = [
    Colors.red,
    kPrimaryColor,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.teal,
    Colors.brown,
  ];
}
