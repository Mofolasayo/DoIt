import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';

import 'calender_viewmodel.dart';

class CalenderView extends StackedView<CalenderViewModel> {
  const CalenderView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CalenderViewModel viewModel,
    Widget? child,
  ) {
    final selectedDate = viewModel.selectedDate;
    final weekDates = viewModel.weekDates;
    return CustomScaffold(
        showBackIcon: false,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Calendar",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                const SizedBox(height: 10),
                Text(
                  DateFormat('MMMM yyyy').format(selectedDate),
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weekDates.length,
                    itemBuilder: (context, index) {
                      final date = weekDates[index];
                      final isSelected = date.day == selectedDate.day;

                      final dayName =
                          DateFormat('E').format(date).toUpperCase();
                      final isWeekend = dayName == 'SAT' || dayName == 'SUN';

                      return GestureDetector(
                        onTap: () => viewModel.selectDate(date),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.deepPurpleAccent
                                : const Color(0xFF2C2C2E),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayName,
                                style: TextStyle(
                                  color: isWeekend
                                      ? Colors.redAccent
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${date.day}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (index % 3 ==
                                  0) // Dummy condition for a dot (events)
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Icon(Icons.circle,
                                      size: 6, color: Colors.deepPurpleAccent),
                                )
                            ],
                          ),
                        ),
                      );
                    },
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
                          backgroundColor: Colors.deepPurpleAccent),
                      child: const Text("Choose Time"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  @override
  CalenderViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CalenderViewModel();
}
