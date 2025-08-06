import 'package:todo_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo_app/ui/views/home/home_view.dart';
import 'package:todo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/views/onboarding/onboarding_view.dart';
import 'package:todo_app/ui/views/welcome/welcome_view.dart';
import 'package:todo_app/ui/views/login/login_view.dart';
import 'package:todo_app/ui/views/signup/signup_view.dart';
import 'package:todo_app/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:todo_app/ui/views/calender/calender_view.dart';
import 'package:todo_app/ui/views/piority/piority_view.dart';
import 'package:todo_app/ui/views/profile/profile_view.dart';
import 'package:todo_app/ui/dialogs/add_task/add_task_dialog.dart';
import 'package:todo_app/services/task_service.dart';
import 'package:todo_app/ui/dialogs/calender_picker/calender_picker_dialog.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/ui/dialogs/category/category_dialog.dart';
import 'package:todo_app/ui/dialogs/forgot_password/forgot_password_dialog.dart';
import 'package:todo_app/ui/views/category/category_view.dart';
import 'package:todo_app/services/category_service.dart';
import 'package:todo_app/services/storage_service.dart';
import 'package:todo_app/ui/views/task_details/task_details_view.dart';
import 'package:todo_app/ui/dialogs/edit_task/edit_task_dialog.dart';
import 'package:todo_app/services/ai_service.dart';
import 'package:todo_app/ui/views/a_i_task_planner/a_i_task_planner_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: WelcomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: BottomNavView),
    MaterialRoute(page: CalenderView),
    MaterialRoute(page: PiorityView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: CategoryView),
    MaterialRoute(page: TaskDetailsView),
    MaterialRoute(page: AITaskPlannerView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TaskService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: CategoryService),
    LazySingleton(classType: StorageService),
    LazySingleton(classType: AiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: AddTaskDialog),
    StackedDialog(classType: CalenderPickerDialog),
    StackedDialog(classType: CategoryDialog),
    StackedDialog(classType: ForgotPasswordDialog),
    StackedDialog(classType: EditTaskDialog),
// @stacked-dialog
  ],
)
class App {}
