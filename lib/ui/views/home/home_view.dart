import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/models/user_task.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/general/custom_layouts.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/input/custom_textfield.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';
import 'package:todo_app/util/app_values.dart';

import 'home_viewmodel.dart';

/*Todo
Date and time customization
Delete Task Dialog
Toasts eg "Task created successfully"
customise dismissable
new screen for task details
*/
class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 14),
          child: Text(
            "Do-it",
            style: GoogleFonts.sacramento(
                color: kPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          Lottie.asset("assets/animations/profile.json", height: 60, width: 80),
        ],
      ),
      body: viewModel.tasks.isNotEmpty || viewModel.completedTasks.isNotEmpty
          ? ScrollableColumn(
              children: [
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField.filled(
                    onChanged: viewModel.updateSearchQuery,
                    hintText: "Search for your task...",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: kPrimaryColor,
                    ),
                    borderRadius: k64pxBorderRadius,
                  ),
                ),
                verticalSpaceCustom(25),
                viewModel.filteredTasks.isNotEmpty
                    ? TaskTiles(
                        viewModel: viewModel,
                        tasks: viewModel.filteredTasks,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: ResponsiveText.w400(
                            "${viewModel.searchQuery} not found",
                            fontSize: 16,
                            color: kWhiteLight,
                          ),
                        ),
                      ),
                // verticalSpaceLarge,

                if (viewModel.completedTasks.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceMedium,

                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 8.0),
                        child: ResponsiveText.w400(
                          "Completed Tasks",
                        ),
                      ),
                      verticalSpaceCustom(20),
                      TaskTiles(
                        viewModel: viewModel,
                        tasks: viewModel.completedTasks,
                      ),
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: viewModel.completedTasks.length,
                      //     itemBuilder: (context, index) {
                      //       final task = viewModel.completedTasks[index];
                      //       return ResponsiveText.w400(task.title);
                      //     })
                    ],
                  )
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/home_screen.png",
                  ),
                  const ResponsiveText.w400(
                    "What do you want to do today?",
                    fontSize: 20,
                    color: kWhite,
                  ),
                  verticalSpaceSmall,
                  const ResponsiveText.w400(
                    "Tap + to add your tasks",
                    fontSize: 16,
                    color: kWhiteLight,
                  ),
                  verticalSpaceMassive,
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: viewModel.showAddTaskDialog,
        //  shape: CircleBorder(),
        tooltip: "Add new task",
        child: const Icon(
          Icons.add,
          color: kBlack,
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class TaskTiles extends StatelessWidget {
  final HomeViewModel viewModel;

  final List<Task> tasks;
  const TaskTiles({
    super.key,
    required this.viewModel,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          final isCompleted = task.isCompleted;

          return Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 10.0,
            ),
            child: Dismissible(
                key: Key(task.createdAt.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  viewModel.deleteTask(task.createdAt);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: ResponsiveEdgeInsets.symmetric(horizontal: 20),
                ),
                child: Card(
                  color: const Color.fromARGB(196, 20, 20, 20),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    onTap: () {
                      viewModel.navigateToDetails(task);
                    },
                    leading: IconButton(
                      onPressed: () {
                        viewModel.toggleCompleteTask(task);
                      },
                      icon: Icon(
                        isCompleted
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: kPrimaryColor,
                      ),
                    ),
                    title: ResponsiveText.w400(
                      task.title,
                      fontSize: 16,
                      decoration:
                          isCompleted ? TextDecoration.lineThrough : null,
                      color: isCompleted ? kGrey97 : kWhite,
                    ),
                    subtitle: ResponsiveText.w400(
                      kDateFormatEdMhmma.format(task.createdAt),
                      decoration:
                          isCompleted ? TextDecoration.lineThrough : null,
                      color: isCompleted ? kGrey97 : kWhite,
                      fontSize: 14,
                    ),
                    trailing: Container(
                      //height: 48,
                      padding: ResponsiveEdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                          color: task.category?.color,
                          borderRadius: k4pxBorderRadius),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            task.category?.icon,
                            color: kWhite,
                            size: 20,
                          ),
                          horizontalSpaceTiny,
                          ResponsiveText.w400(
                            task.category?.title ?? '',
                            fontSize: 14,
                          )
                        ],
                      ),
                    ),
                    //   IconButton(
                    //       onPressed: () {
                    //         viewModel.deleteTask(task.createdAt);
                    //       },
                    //       icon: const Icon(
                    //         Icons.delete,
                    //         color: Colors.red,
                    //       )),
                    // ),
                  ),
                )),
          );
        });
  }
}
