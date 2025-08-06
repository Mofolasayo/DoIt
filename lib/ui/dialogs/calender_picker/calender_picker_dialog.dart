import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'calender_picker_dialog_model.dart';

class CalenderPickerDialog extends StackedView<CalenderPickerDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CalenderPickerDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CalenderPickerDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
              focusedDay: viewModel.focusedDay,
              firstDay: DateTime.utc(2021, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              selectedDayPredicate: (day) =>
                  isSameDay(viewModel.selectedDay, day),
              onDaySelected: viewModel.onDaySelected,
              calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(color: kWhite),
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(color: kWhite),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: kWhite,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: kWhite,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: kWhite),
                weekendStyle: TextStyle(color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: viewModel.cancel,
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.white70)),
                ),
                ElevatedButton(
                  onPressed: viewModel.confirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: const Text("Choose Time"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  CalenderPickerDialogModel viewModelBuilder(BuildContext context) =>
      CalenderPickerDialogModel();
}
