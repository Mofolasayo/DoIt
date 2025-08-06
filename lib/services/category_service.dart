import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/ui/common/app_colors.dart';

class CategoryService extends ChangeNotifier {
  final List<Category> _categories = [
    Category(
        title: "Grocies", icon: CupertinoIcons.cart_fill, color: Colors.blue),
    Category(
        title: "Work", icon: CupertinoIcons.briefcase_fill, color: Colors.red),
    Category(
        title: "Fitness",
        icon: CupertinoIcons.sportscourt_fill,
        color: kFF9680),
    Category(
        title: "School",
        icon: CupertinoIcons.book,
        color: const Color.fromARGB(255, 3, 48, 48)),
    Category(title: "Music", icon: CupertinoIcons.music_note, color: k00A32F),
    Category(
        title: "Health", icon: CupertinoIcons.heart_fill, color: Colors.pink),
    Category(
        title: "Social",
        icon: CupertinoIcons.chat_bubble_2_fill,
        color: k00A3A3),
    Category(title: "Home", icon: CupertinoIcons.house, color: kA000A3),
    Category(
        title: "Leisure", icon: CupertinoIcons.airplane, color: Colors.red),
  ];
  List<Category> get category => _categories;

  Category? selectedCategory;

  void setCategory(String title, IconData icon, Color color) {
    selectedCategory = Category(title: title, icon: icon, color: color);
    notifyListeners();
  }
}
