import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/buttons/custom_button.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/input/custom_textfield.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'a_i_task_planner_viewmodel.dart';

class AITaskPlannerView extends StackedView<AiTaskPlannerViewModel> {
  const AITaskPlannerView({super.key});

  @override
  Widget builder(
      BuildContext context, AiTaskPlannerViewModel viewModel, Widget? child) {
    return CustomScaffold(
      appBar: AppBar(
        leading: Text(
          "AI Planner",
          style: GoogleFonts.sacramento(
              color: kPrimaryColor, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        leadingWidth: 200,
        backgroundColor: kBlack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              labelText: "Describe your plan...",
              controller: viewModel.promptController,
              //    decoration: InputDecoration(labelText: "Describe your plan..."),
              maxLines: 3,
            ),
            verticalSpaceMedium,
            CustomRoundedButton(
              isLoading: viewModel.isBusy,
              onPressed: viewModel.generateTasks,
              text: "Generate Tasks",
            ),
            verticalSpaceMedium,
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.generatedTasks.length,
                itemBuilder: (context, index) {
                  final task = viewModel.generatedTasks[index];
                  final isSelected = viewModel.selectedIndexes.contains(index);
                  return ListTile(
                    leading: Checkbox(
                      value: isSelected,
                      onChanged: (_) => viewModel.toggleSelection(index),
                    ),
                    title: ResponsiveText.w500(task.title),
                    // subtitle: ResponsiveText.w400(
                    //   DateFormat('yyyy-MM-dd hh:mm a').format(task.createdAt),
                    // ),
                    onTap: () => viewModel.toggleSelection(index),
                  );
                },
              ),
            ),
            if (viewModel.selectedIndexes.isNotEmpty)
              CustomRoundedButton(
                isLoading: viewModel.isBusy,
                onPressed: () => viewModel.importSelectedTasks(null),
                text: "Import Selected Tasks",
              )
          ],
        ),
      ),
    );
  }

  @override
  AiTaskPlannerViewModel viewModelBuilder(BuildContext context) =>
      AiTaskPlannerViewModel();
}
