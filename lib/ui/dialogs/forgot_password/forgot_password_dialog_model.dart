import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/util/extensions.dart';
import 'package:todo_app/util/toast_service.dart';

class ForgotPasswordDialogModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void resetPassword(BuildContext context) async {
    setBusy(true);
    var result = await _authService
        .resetPassword(emailController.text.trim())
        .tryCatch();
    if (result != null) {
      ToastService.showSuccessToast(
          message:
              "password reset link has been sent to ${emailController.text.trim()}");
      _navigationService.back();
    }
    Navigator.of(context).pop();

    setBusy(false);
  }
}
