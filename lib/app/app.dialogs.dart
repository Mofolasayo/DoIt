// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/add_task/add_task_dialog.dart';
import '../ui/dialogs/calender_picker/calender_picker_dialog.dart';
import '../ui/dialogs/category/category_dialog.dart';
import '../ui/dialogs/edit_task/edit_task_dialog.dart';
import '../ui/dialogs/forgot_password/forgot_password_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';

enum DialogType {
  infoAlert,
  addTask,
  calenderPicker,
  category,
  forgotPassword,
  editTask,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.addTask: (context, request, completer) =>
        AddTaskDialog(request: request, completer: completer),
    DialogType.calenderPicker: (context, request, completer) =>
        CalenderPickerDialog(request: request, completer: completer),
    DialogType.category: (context, request, completer) =>
        CategoryDialog(request: request, completer: completer),
    DialogType.forgotPassword: (context, request, completer) =>
        ForgotPasswordDialog(request: request, completer: completer),
    DialogType.editTask: (context, request, completer) =>
        EditTaskDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
