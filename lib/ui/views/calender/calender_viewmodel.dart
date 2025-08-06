import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';

class CalenderViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  DateTime selectedDate = DateTime.now();

  List<DateTime> get weekDates {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday % 7));
    return List.generate(14, (i) => startOfWeek.add(Duration(days: i)));
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void cancel() {
    _dialogService.completeDialog(DialogResponse(confirmed: false));
  }

  void confirm() {
    _dialogService.completeDialog(
      DialogResponse(confirmed: true, data: selectedDate),
    );
  }
}
