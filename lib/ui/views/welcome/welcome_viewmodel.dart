import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/ui/views/login/login_view.dart';
import 'package:todo_app/ui/views/signup/signup_view.dart';

class WelcomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void navigateToLogin() {
    _navigationService.navigateToView(const LoginView(),
        transitionStyle: Transition.fade, duration: const Duration(seconds: 1));
  }

  void navigateToSignup() {
    _navigationService.navigateToView(const SignupView(),
        transitionStyle: Transition.fade, duration: const Duration(seconds: 1));
  }
}
