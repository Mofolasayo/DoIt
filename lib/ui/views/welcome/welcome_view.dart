import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/buttons/custom_button.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'welcome_viewmodel.dart';

class WelcomeView extends StackedView<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WelcomeViewModel viewModel,
    Widget? child,
  ) {
    return CustomScaffold(
      showBackIcon: true,
      body: PaddedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: kMainPadding,
        children: [
          verticalSpaceMedium,
          const ResponsiveText.w700(
            "Welcome to Do-It",
            color: kWhite,
            fontSize: 32,
          ),
          verticalSpaceSmall,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: ResponsiveText.w400(
              "Please login to your account or create new account to continue",
              fontSize: 16,
              color: kWhiteLight,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpaceCustom(400),
          CustomRoundedButton(
            onPressed: viewModel.navigateToLogin,
            text: "LOGIN",
          ),
          verticalSpaceCustom(20),
          CustomRoundedButton(
            onPressed: viewModel.navigateToSignup,
            text: "CREATE ACCOUNT",
            color: kBlack,
            borderColor: kPrimaryColor,
          )
        ],
      ),
    );
  }

  @override
  WelcomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WelcomeViewModel();
}
