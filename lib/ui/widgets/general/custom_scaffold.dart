import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/general/unfocus_widget.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_icon.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final Widget? trailingAppBarWidget;
  final Widget? bottomNavigationBar;
  final bool showDivider;
  final String? title;
  final double? titleSize;
  final double? leadingWidth;
  final PreferredSizeWidget? bottom;
  final Color? titleColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? showBackIcon;
  final bool showAppBar;
  final AppBar? appBar;
  final bool? centerTitle;
  final Widget? drawer;
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final double? trailingPadding;
  final double? titleBottomSpace;
  final double? titleTopSpace;

  const CustomScaffold({
    super.key,
    this.body,
    this.trailingAppBarWidget,
    this.bottomNavigationBar,
    this.showDivider = false,
    this.title,
    this.bottom,
    this.titleSize,
    this.leadingWidget,
    this.titleWidget,
    this.leadingWidth,
    this.titleColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.showBackIcon,
    this.showAppBar = true,
    this.appBar,
    this.centerTitle,
    this.drawer,
    this.scaffoldKey,
    this.backgroundColor,
    this.trailingPadding,
    this.titleBottomSpace,
    this.titleTopSpace,
  });

  @override
  Widget build(BuildContext context) {
    return UnfocusWidget(
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer,
        backgroundColor: backgroundColor ?? kBlack,
        appBar: showAppBar == false
            ? null
            : appBar ??
                AppBar(
                  backgroundColor: kBlack,
                  foregroundColor: kBlack,
                  surfaceTintColor: kBlack,
                  centerTitle: centerTitle ?? false,
                  elevation: 0,
                  leadingWidth: showBackIcon == false ? 0 : leadingWidth,
                  leading: (showBackIcon == false)
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: ResponsiveEdgeInsets.only(left: 10),
                          child: leadingWidget ??
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const ResponsiveIcon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: kWhite,
                                ),
                              ),
                        ),
                  title: title == null
                      ? titleWidget ?? const SizedBox.shrink()
                      : Column(
                          children: [
                            SizedBox(height: titleTopSpace ?? 0),
                            ResponsiveText.w600(
                              title!,
                              fontSize: titleSize ?? 20,
                              color: titleColor,
                            ),
                          ],
                        ),
                  bottom: showDivider
                      ? PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: Column(
                            children: [
                              SizedBox(height: titleBottomSpace ?? 0),
                              thinDivider(),
                            ],
                          ),
                        )
                      : bottom,
                  actions: trailingAppBarWidget != null
                      ? [
                          horizontalSpaceCustom(16),
                          Center(child: trailingAppBarWidget),
                          horizontalSpaceCustom(trailingPadding ?? 16),
                        ]
                      : null,
                ),
        body: body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
