import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/buttons/custom_button.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/input/custom_textfield.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return CustomScaffold(
      showBackIcon: false,
      body: Form(
        key: viewModel.formKey,
        child: PaddedColumn(
          padding: kMainPadding,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: ResponsiveText.w700(
                "Create Account",
                color: kWhite,
                fontSize: 32,
              ),
            ),
            verticalSpaceLarge,
            const ResponsiveText.w400(
              "Username",
              fontSize: 16,
              color: kWhiteLight,
            ),
            verticalSpaceSmall,
            CustomTextField(
              keyboardType: TextInputType.text,
              filled: true,
              controller: viewModel.usernameController,

              // controller: viewModel.emailController,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return "Email is required";
              //   }
              //   return null;
              // },
            ),
            verticalSpaceMedium,
            const ResponsiveText.w400(
              "Email",
              fontSize: 16,
              color: kWhiteLight,
            ),
            verticalSpaceSmall,
            CustomTextField(
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.text,
              filled: true,
              controller: viewModel.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                return null;
              },
            ),
            verticalSpaceMedium,
            const ResponsiveText.w400(
              "Password",
              fontSize: 16,
              color: kWhiteLight,
            ),
            verticalSpaceSmall,
            CustomTextField.password(
                textCapitalization: TextCapitalization.none,
                filled: true,
                controller: viewModel.passwordController,
                validator: (value) {
                  if (value == null) {
                    return "Password is required";
                  }
                  return null;
                }),
            verticalSpaceMedium,
            const ResponsiveText.w400(
              "Confirm Password",
              fontSize: 16,
              color: kWhiteLight,
            ),
            verticalSpaceSmall,
            CustomTextField.password(
              textCapitalization: TextCapitalization.none,
              filled: true,
              controller: viewModel.confirmPasswordController,
              validator: (value) {
                if (value != viewModel.passwordController.text) {
                  return 'Password do not match';
                }
                return null;
              },
            ),
            verticalSpaceMedium,
            verticalSpaceLarge,
            CustomRoundedButton(
              isLoading: viewModel.isBusy,
              onPressed: viewModel.signUp,
              text: "Create Account",
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: viewModel.replaceWithLogin,
                child: RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: kLato400Responsive(16),
                        children: [
                      TextSpan(
                          text: " Login",
                          style: kLato500Responsive(16, color: kPrimaryColor))
                    ])),
              ),
            ),
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
