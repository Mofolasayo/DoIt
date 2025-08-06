import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/widgets/buttons/custom_button.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/input/custom_textfield.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'forgot_password_dialog_model.dart';

class ForgotPasswordDialog extends StackedView<ForgotPasswordDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ForgotPasswordDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      child: PaddedColumn(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(
          //   request.title ?? 'Reset Password',
          //   style: const TextStyle(
          //     color:s kWhite,
          //     fontSize: 16,
          //     fontWeight: FontWeight.w900,
          //   ),
          // ),
          verticalSpaceSmall,
          const ResponsiveText.w400(
            "Enter your email address and we'll send you a link to reset your password.",
            fontSize: 16,
            color: kWhiteLight,
          ),
          verticalSpaceMedium,
          CustomTextField(
            filled: true,
            controller: viewModel.emailController,
            textCapitalization: TextCapitalization.none,
          ),
          verticalSpaceMedium,
          CustomRoundedButton(
            isLoading: viewModel.isBusy,
            onPressed: () {
              viewModel.resetPassword(context);
            },
            text: "Reset Password",
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }

  @override
  ForgotPasswordDialogModel viewModelBuilder(BuildContext context) =>
      ForgotPasswordDialogModel();
}
