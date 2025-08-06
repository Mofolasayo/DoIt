import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/buttons/custom_back_button.dart';
import 'package:todo_app/ui/widgets/buttons/custom_button.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/input/custom_textfield.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'category_viewmodel.dart';

class CategoryView extends StackedView<CategoryViewModel> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CategoryViewModel viewModel,
    Widget? child,
  ) {
    return CustomScaffold(
      // showBackIcon: true,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: ResponsiveText.w600(
          'New Category',
          fontSize: 18,
        ),
        leading: CustomBackButton(),
      ),
      body: PaddedColumn(
        padding: kMainPadding,
        children: [
          verticalSpaceCustom(18),
          const ResponsiveText.w500('Category name:'),
          verticalSpaceCustom(14),
          CustomTextField(
            filled: true,
            controller: viewModel.titleController,
          ),
          verticalSpaceCustom(15),
          const ResponsiveText.w500('Category icon:'),
          verticalSpaceCustom(12),
          viewModel.selectedIcon == null
              ? GestureDetector(
                  onTap: () {
                    viewModel.pickIcon(context);
                  },
                  child: Container(
                      padding: ResponsiveEdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: kGrey36, borderRadius: k12pxBorderRadius),
                      child: ResponsiveText.w400(
                        "Choose Icon",
                        fontSize: 14,
                      )),
                )
              : IconButton(
                  onPressed: () {
                    viewModel.pickIcon(context);
                  },
                  icon: Icon(viewModel.selectedIcon)),
          verticalSpaceCustom(15),
          const ResponsiveText.w500('Category color:'),
          verticalSpaceCustom(12),
          SizedBox(
            height: 48,
            //  width: double.maxFinite,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: viewModel.colors.length,
                itemBuilder: (context, index) {
                  final color = viewModel.colors[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        viewModel.selectColor(color);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: color),
                          ),
                          if (viewModel.selectedColor == color)
                            const Icon(
                              Icons.check,
                              color: kWhite,
                            ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          verticalSpaceLarge,
          CustomRoundedButton(
            text: 'Create Category',
            onPressed: () {
              viewModel.confirmNewCategory(context);
            },
          )
        ],
      ),
    );
  }

  @override
  CategoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CategoryViewModel();
}
