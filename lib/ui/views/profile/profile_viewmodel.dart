import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/auth_service.dart';

class ProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  get user => _authService.currentUser?.displayName;

  void signOut() {
    _authService.signOut();
    _navigationService.clearStackAndShow(Routes.startupView);
    notifyListeners();
  }
}
