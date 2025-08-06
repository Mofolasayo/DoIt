import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/util/extensions.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void navigateToSignup() {
    _navigationService.navigateToSignupView();
  }

  void replaceWithSignup() {
    _navigationService.replaceWithSignupView();
  }

  void navigateToHomePage() {
    _navigationService.clearStackAndShow('/bottom-nav-view');
  }

  void login() async {
    setBusy(true);
    var result = await _authService
        .signInWithEmailAndPassword(
            emailController.text.trim(), passwordController.text.trim())
        .tryCatch();

    setBusy(false);
    //add successful login toast
    navigateToHomePage();

    if (result != null) {
      navigateToHomePage();
    }
  }

  void showRestPassword() {
    _dialogService.showCustomDialog(
        barrierDismissible: true,
        variant: DialogType.forgotPassword,
        title: 'Reset Password');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
