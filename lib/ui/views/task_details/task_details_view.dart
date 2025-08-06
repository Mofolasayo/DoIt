import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/models/user_task.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/buttons/custom_button.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_svg.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';
import 'package:todo_app/util/app_values.dart';

import 'task_details_viewmodel.dart';

class TaskDetailsView extends StackedView<TaskDetailsViewModel> {
  const TaskDetailsView(this.task, {Key? key}) : super(key: key);
  final Task task;
  @override
  Widget builder(
    BuildContext context,
    TaskDetailsViewModel viewModel,
    Widget? child,
  ) {
    return CustomScaffold(
      body: PaddedColumn(
        padding: kMainPadding,
        children: [
          Row(
            children: [
              Radio(value: 1, groupValue: 1, onChanged: (_) {}),
              ResponsiveText.w400(task.title),
              const Spacer(),
              ResponsiveSvg(
                "edit",
                onTap: viewModel.editTask,
              ),
            ],
          ),
          verticalSpaceMedium,
          Row(
            children: [
              ResponsiveSvg("timer"),
              horizontalSpaceTiny,
              const ResponsiveText.w400("Task Time:"),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  height: 40,
                  padding: kMainPadding,
                  decoration: const BoxDecoration(
                      color: kGrey36, borderRadius: k8pxBorderRadius),
                  child: ResponsiveText.w400(
                    kDateFormatEdMhmma.format(task.createdAt),
                  ))
            ],
          ),
          verticalSpaceMedium,
          Row(
            children: [
              const ResponsiveText.w400("Task Category:"),
              const Spacer(),
              Container(
                //height: 48,
                padding: ResponsiveEdgeInsets.symmetric(
                    vertical: 2.0, horizontal: 8.0),
                decoration: BoxDecoration(
                    color: task.category?.color,
                    borderRadius: k4pxBorderRadius),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      task.category?.icon,
                      color: kWhite,
                      size: 20,
                    ),
                    horizontalSpaceTiny,
                    ResponsiveText.w400(
                      task.category?.title ?? '',
                      fontSize: 14,
                    )
                  ],
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
          Row(
            children: [
              ResponsiveSvg("sub"),
              horizontalSpaceSmall,
              const ResponsiveText.w400("Sub - Task"),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  height: 40,
                  padding: kMainPadding,
                  decoration: const BoxDecoration(
                      color: kGrey36, borderRadius: k8pxBorderRadius),
                  child: const ResponsiveText.w400(
                    "Add Sub - Task",
                  ))
            ],
          ),
          verticalSpaceMedium,
          Row(
            children: [
              ResponsiveSvg("trash"),
              horizontalSpaceTiny,
              ResponsiveText.w400(
                "Delete Task",
                color: kRed,
              )
            ],
          ),
          const Spacer(),
          const CustomRoundedButton(
            text: "Save",
          ),
          verticalSpaceMassive,
        ],
      ),
    );
  }

  @override
  TaskDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TaskDetailsViewModel();
}
