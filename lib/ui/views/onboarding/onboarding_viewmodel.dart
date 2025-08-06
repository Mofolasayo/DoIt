import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final _navigationService = locator<NavigationService>();

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/splash0.png",
      "title": "Manage your tasks",
      "description":
          "You can easily manage all of your daily tasks in Do-It for free."
    },
    {
      "image": "assets/images/splash1.png",
      "title": "Create daily routine",
      "description":
          "In Do-It you can create your personalized routine to stay productive"
    },
    {
      "image": "assets/images/splash2.png",
      "title": "Organize your tasks!",
      "description":
          "You can organize your daily tasks by adding your tasks into separate categories"
    }
  ];
  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();

    if (_currentIndex == onboardingData.length - 1) {
      Future.delayed(const Duration(seconds: 1), () {
        _navigationService.navigateToWelcomeView();
      });
    }
  }
}
