import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';

import 'piority_viewmodel.dart';

class PiorityView extends StackedView<PiorityViewModel> {
  const PiorityView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PiorityViewModel viewModel,
    Widget? child,
  ) {
    return CustomScaffold(
      showBackIcon: false,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(
            child: Text("PiorityView", style: TextStyle(color: Colors.white))),
      ),
    );
  }

  @override
  PiorityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PiorityViewModel();
}
