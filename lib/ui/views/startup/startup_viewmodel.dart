import 'package:stacked/stacked.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/services/auth_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    final isAuthenticated = await _authService.checkAuthState();

    await Future.delayed(const Duration(seconds: 3));

    if (isAuthenticated) {
      _navigationService.replaceWithBottomNavView();
    } else {
      _navigationService.replaceWithOnboardingView();
    }
  }
}
