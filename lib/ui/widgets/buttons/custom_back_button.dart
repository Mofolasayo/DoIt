import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_icon.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveEdgeInsets.only(left: 10),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const ResponsiveIcon(
          Icons.arrow_back_ios,
          size: 20,
          color: kWhite,
        ),
      ),
    );
  }
}
