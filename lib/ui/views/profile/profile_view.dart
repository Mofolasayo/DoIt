import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_svg.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return CustomScaffold(
      showBackIcon: false,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: PaddedColumn(
          padding:
              ResponsiveEdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              child: Lottie.asset("assets/animations/profile.json",
                  height: 120, width: 160),
            ),
            ResponsiveText.w400(
              viewModel.user ?? 'Guest',
              fontSize: 20,
              color: kWhite,
            ),
            verticalSpaceCustom(20),
            const ProfileListTile(
              icon: "user",
              title: "Change Username",
            ),
            const ProfileListTile(
              icon: "menu",
              title: "About Us",
            ),
            const ProfileListTile(
              icon: "info-circle",
              title: "FAQ",
            ),
            const ProfileListTile(
              icon: "flash",
              title: "Help & Feedback",
            ),
            const ProfileListTile(
              icon: "like",
              title: "Support Us",
            ),
            ProfileListTile(
              icon: "logout",
              title: "Log out",
              isLogout: true,
              onTap: () {
                viewModel.signOut();
              },
            ),
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.isLogout = false,
  });
  final String title;
  final String icon;
  final void Function()? onTap;
  final bool isLogout;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            color: kblack20,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              leading: ResponsiveSvg(icon),
              title: ResponsiveText.w500(title, color: isLogout ? kRed : null),
              trailing: !isLogout ? const Icon(Icons.chevron_right) : null,
            ),
          ),
        ),
        verticalSpaceSmall
      ],
    );
  }
}
