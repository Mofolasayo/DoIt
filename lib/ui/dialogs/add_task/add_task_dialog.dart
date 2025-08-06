import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/input/custom_textfield.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_svg.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';
import 'package:todo_app/util/app_values.dart';

import 'add_task_dialog_model.dart';

class AddTaskDialog extends StackedView<AddTaskDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddTaskDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddTaskDialogModel viewModel,
    Widget? child,
  ) {
    final TextEditingController controller = TextEditingController();
    var category = viewModel.selectedCategory;
    return Dialog(
      insetPadding: ResponsiveEdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      child: PaddedColumn(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          request.title ?? '',
                          style: const TextStyle(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                        if (category != null)
                          Row(
                            children: [
                              Icon(
                                category.icon,
                                color: category.color,
                              ),
                              horizontalSpaceTiny,
                              ResponsiveText.w400(
                                " ${category.title}",
                                color: category.color,
                              ),
                            ],
                          )
                      ],
                    ),
                    verticalSpaceMedium,
                    CustomTextField(
                      height: 50,
                      filled: true,
                      hintText: "Do maths homework",
                      keyboardType: TextInputType.text,
                      controller: controller,
                    ),
                    verticalSpaceMedium,
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              viewModel.selectDate(context);
                            },
                            child: ResponsiveSvg("timer")),
                        horizontalSpaceSmall,
                        GestureDetector(
                            onTap: () {
                              viewModel.showCategoryDialog();
                            },
                            child: ResponsiveSvg("tag")),
                        horizontalSpaceSmall,
                        ResponsiveSvg("flag"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (controller.text.isNotEmpty) {
                              viewModel.addTask(
                                controller.text.trim(),
                                category: viewModel.selectedCategory,
                              );
                              completer(DialogResponse(
                                confirmed: true,
                              ));
                            }
                          },
                          child: ResponsiveSvg(
                            "send",
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        ResponsiveText.w300(
                            kDateFormatEEEMMMd.format(viewModel.selectedDate!)),
                        ResponsiveText.w300(
                            " ${viewModel.selectedTime!.format(context)}"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }

  @override
  AddTaskDialogModel viewModelBuilder(BuildContext context) =>
      AddTaskDialogModel();

  @override
  void onViewModelReady(AddTaskDialogModel viewModel) {
    viewModel.initialize();
    super.onViewModelReady(viewModel);
  }
}
