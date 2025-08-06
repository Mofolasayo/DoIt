import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/views/a_i_task_planner/a_i_task_planner_view.dart';
import 'package:todo_app/ui/views/calender/calender_view.dart';
import 'package:todo_app/ui/views/home/home_view.dart';
import 'package:todo_app/ui/views/profile/profile_view.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_svg.dart';
import 'bottom_nav_viewmodel.dart';

class BottomNavView extends StackedView<BottomNavViewModel> {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomNavViewModel viewModel,
    Widget? child,
  ) {
    List<Widget> views = [
      const HomeView(),
      const CalenderView(),
      //  const PiorityView(),
      AITaskPlannerView(),

      const ProfileView()
    ];
    return Scaffold(
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBlack,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        onTap: viewModel.setIndex,
        currentIndex: viewModel.currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kGrey9A,
        selectedLabelStyle: kLato400.copyWith(color: kPrimaryColor),
        unselectedLabelStyle: kLato400.copyWith(color: kGrey9A),
        items: [
          BottomNavigationBarItem(
            icon: ResponsiveSvg(
              "home",
              size: 28,
              color: viewModel.currentIndex == 0 ? kPrimaryColor : null,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: ResponsiveSvg(
                "calendar",
                size: 28,
                color: viewModel.currentIndex == 1 ? kPrimaryColor : null,
              ),
              label: "Calender"),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome,
                  size: 28,
                  color: viewModel.currentIndex == 2 ? kPrimaryColor : null),
              label: "AI"),
          BottomNavigationBarItem(
              icon: ResponsiveSvg(
                "profile",
                size: 28,
                color: viewModel.currentIndex == 3 ? kPrimaryColor : null,
              ),
              label: "Profile")
        ],
      ),
    );
  }

  @override
  BottomNavViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavViewModel();
}
