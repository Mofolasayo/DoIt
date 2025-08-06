import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'category_dialog_model.dart';

class CategoryDialog extends StackedView<CategoryDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CategoryDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CategoryDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: kblack20,
      child: PaddedColumn(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 16,
                          color: kWhite,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    Wrap(
                      children: [
                        GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            shrinkWrap: true,
                            itemCount: viewModel.categories.length,
                            itemBuilder: (context, index) {
                              final category = viewModel.categories[index];
                              return IconTiles(
                                title: category.title,
                                color: category.color,
                                icon: category.icon,
                                onTap: () {
                                  viewModel.setCategory(category.title,
                                      category.icon, category.color);
                                  completer(DialogResponse(
                                      confirmed: true, data: category));
                                },
                              );
                            }),
                        // IconTiles(
                        //   color: Colors.purple,
                        //   title: "Create New",
                        //   icon: Icons.add,
                        //   //  onTap: () => viewModel.pickIcon(context),
                        //   onTap: () => viewModel.navigateToCategoryView(),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
          GestureDetector(
            onTap: () => viewModel.navigateToCategoryView(),
            child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.add,
                  color: kWhite,
                )),
          ),
          verticalSpaceSmall
        ],
      ),
    );
  }

  @override
  CategoryDialogModel viewModelBuilder(BuildContext context) =>
      CategoryDialogModel();

  @override
  void onViewModelReady(CategoryDialogModel viewModel) {
    viewModel.initialize();

    super.onViewModelReady(viewModel);
  }
}

class IconTiles extends StatelessWidget {
  const IconTiles({
    super.key,
    required this.title,
    required this.color,
    this.onTap,
    required this.icon,
  });
  final String title;
  final Color color;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 64,
              width: 64,
              decoration:
                  BoxDecoration(color: color, borderRadius: k12pxBorderRadius),
              child: Icon(
                icon,
                color: kWhite,
              ),
            ),
          ),
          verticalSpaceTiny,
          ResponsiveText.w400(
            title,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}
