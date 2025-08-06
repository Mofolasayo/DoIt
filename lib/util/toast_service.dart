import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/ui/common/app_colors.dart';

class ToastService {
  static showSuccessToast({
    String? message,
    Toast? toastLength,
    double? fontSize,
    ToastGravity? gravity,
    Color? backgroundColor,
    Color? textColor = kWhite,
  }) {
    Fluttertoast.showToast(
      msg: message ?? 'Successful',
      toastLength: toastLength,
      fontSize: fontSize,
      gravity: gravity ?? ToastGravity.TOP,
      backgroundColor: backgroundColor ?? kPrimaryColor,
      textColor: textColor,
    );
  }

  static showErrorToast({
    String? message,
    Toast? toastLength,
    double? fontSize,
    ToastGravity? gravity,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: message ?? 'Something went wrong',
      toastLength: toastLength,
      fontSize: fontSize,
      gravity: gravity ?? ToastGravity.TOP,
      backgroundColor: backgroundColor ?? Colors.red,
      textColor: textColor,
    );
  }
}
