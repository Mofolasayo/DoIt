import 'package:stacked/stacked.dart';

class TaskDetailsViewModel extends BaseViewModel {
  bool edit = false;

  void editTask() {
    edit = !edit;
    notifyListeners();
  }
}
