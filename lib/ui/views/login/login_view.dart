import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/buttons/custom_button.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/input/custom_textfield.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return CustomScaffold(
      showBackIcon: false,
      body: PaddedColumn(
        padding: kMainPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: ResponsiveText.w700(
              "Login",
              color: kWhite,
              fontSize: 32,
            ),
          ),
          verticalSpaceCustom(100),

          // verticalSpaceLarge,
          const ResponsiveText.w400(
            "Email",
            fontSize: 16,
            color: kWhiteLight,
          ),
          verticalSpaceSmall,
          CustomTextField(
            filled: true,
            controller: viewModel.emailController,
            textCapitalization: TextCapitalization.none,
          ),
          verticalSpaceMedium,
          const ResponsiveText.w400(
            "Password",
            fontSize: 16,
            color: kWhiteLight,
          ),
          verticalSpaceSmall,
          CustomTextField.password(
            filled: true,
            controller: viewModel.passwordController,
            textCapitalization: TextCapitalization.none,
          ),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ResponsiveText.w300(
                "Forgot Password?",
                onTap: viewModel.showRestPassword,
              ),
            ],
          ),
          verticalSpaceLarge,
          CustomRoundedButton(
            isLoading: viewModel.isBusy,
            onPressed: viewModel.login,
            text: "LOGIN",
          ),
          const Spacer(),
          Center(
            child: GestureDetector(
              onTap: viewModel.replaceWithSignup,
              child: RichText(
                  text: TextSpan(
                      text: "Don’t have an account? ",
                      style: kLato400Responsive(16),
                      children: [
                    TextSpan(
                        text: " Register",
                        style: kLato500Responsive(16, color: kPrimaryColor))
                  ])),
            ),
          ),
          verticalSpaceLarge
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
