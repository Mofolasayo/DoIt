import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/progress_indicators/white_circular_indicator.dart';

class CustomRoundedButton extends StatelessWidget {
  final String? text;
  final Widget? leading;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? indicatorColor;
  final bool isLoading;
  final bool activated;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final Color? borderColor;

  const CustomRoundedButton({
    this.onPressed,
    this.leading,
    this.text,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.indicatorColor,
    this.isLoading = false,
    this.activated = true,
    Key? key,
    this.borderRadius,
    this.elevation,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return MaterialButton(
      elevation: elevation,
      onPressed: onPressed ?? () {},
      minWidth: width ?? double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? k64pxBorderRadius,
          side: BorderSide(color: borderColor ?? color ?? kPrimaryColor)),
      height: height ?? 60,
      color:
          color ?? (!activated ? theme.unselectedWidgetColor : kPrimaryColor),
      child: isLoading
          ? CustomCircularProgressIndicator(
              color: indicatorColor ?? Colors.white,
            )
          : Center(
              child: Row(
                mainAxisAlignment: leading == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: leading != null,
                    child: Row(
                      children: [
                        horizontalSpaceMedium,
                        leading ?? Container(),
                        horizontalSpaceMedium
                      ],
                    ),
                  ),
                  Text(
                    text ?? '',
                    style: kLato400Responsive(16).copyWith(
                      color: textColor ?? (activated ? Colors.white : null),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
