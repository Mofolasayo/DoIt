import 'package:todo_app/app/app.bottomsheets.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/user_task.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/services/category_service.dart';
import 'package:todo_app/services/task_service.dart';
import 'package:todo_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel with ListenableServiceMixin {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _taskService = locator<TaskService>();
  final _authService = locator<AuthService>();
  final _categoryService = locator<CategoryService>();
  get user => _authService.currentUser;
  List<Task> get tasks => _taskService.tasks;
  Category? selectedCategory;
  List<Task> get completedTasks => _taskService.completedTask;

  HomeViewModel() {
    _taskService.addListener(_onTasksChanged);
  }
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void updateSearchQuery(String value) {
    _searchQuery = value.toLowerCase();
    notifyListeners();
  }

  List<Task> get filteredTasks {
    if (_searchQuery.isEmpty) return tasks;
    return tasks
        .where(
          (task) => task.title.toLowerCase().contains(_searchQuery),
        )
        .toList();
  }

  List<Task> get filteredCompletedTasks {
    if (_searchQuery.isEmpty) return completedTasks;
    return completedTasks
        .where(
          (task) => task.title.toLowerCase().contains(_searchQuery),
        )
        .toList();
  }

  void _onTasksChanged() {
    selectedCategory = _categoryService.selectedCategory;

    notifyListeners();
  }

  void toggleCompleteTask(Task task) {
    if (task.isCompleted) {
      task.isCompleted = false;
      _taskService.completedTask.remove(task);
      _taskService.tasks.add(task);
    } else {
      task.isCompleted = true;
      _taskService.completedTask.add(task);
      _taskService.tasks.remove(task);
    }
    //task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void deleteTask(DateTime date) {
    _taskService.tasks.removeWhere((task) => task.createdAt == date);
    _taskService.completedTask.removeWhere((task) => task.createdAt == date);
    notifyListeners();
  }

  void showAddTaskDialog() {
    _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.addTask,
      title: 'Add Task',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void navigateToDetails(Task task) =>
      _navigationService.navigateToTaskDetailsView(task: task);

  @override
  void dispose() {
    _taskService.removeListener(_onTasksChanged);
    super.dispose();
  }
}
