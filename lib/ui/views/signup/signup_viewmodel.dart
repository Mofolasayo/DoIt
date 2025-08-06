import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/util/extensions.dart';

class SignupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final usernameController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void navigateToHomePage() =>
      _navigationService.clearStackAndShow('/bottom-nav-view');

  void replaceWithLogin() {
    _navigationService.replaceWithLoginView();
  }

  void signUp() async {
    if (!formKey.currentState!.validate()) return;
    setBusy(true);
    var result = await _authService
        .registerWithEmailAndPassword(
          emailController.text.trim(),
          passwordController.text.trim(),
          usernameController.text.trim(),
        )
        .tryCatch();
    if (result != null) {
      navigateToHomePage();
    }
    setBusy(false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
