import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';

class CalenderPickerDialogModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay = selected;
    focusedDay = focused;
    notifyListeners();
  }

  void cancel() {
    _dialogService.completeDialog(DialogResponse(confirmed: false));
  }

  void confirm() {
    _dialogService.completeDialog(DialogResponse(
      confirmed: true,
      data: selectedDay,
    ));
  }
}
