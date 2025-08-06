import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/ui/common/app_colors.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);
Widget horizontalSpaceCustom(double width) => SizedBox(width: width.sp);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);
Widget verticalSpaceCustom(double height) => SizedBox(height: height.sp);

Widget spacedDivider = const Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

Widget thickDivider({double height = 0, Color? color}) =>
    Divider(height: height.sp, thickness: 10, color: color ?? kBlack);

Widget thinDivider({double thickness = 1}) =>
    Divider(height: 0, thickness: thickness);
double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}

const k120pxBorderRadius = BorderRadius.all(Radius.circular(120));
const k100pxBorderRadius = BorderRadius.all(Radius.circular(100));
const k64pxBorderRadius = BorderRadius.all(Radius.circular(64));
const k32pxBorderRadius = BorderRadius.all(Radius.circular(32));
const k24pxBorderRadius = BorderRadius.all(Radius.circular(24));
const k16pxBorderRadius = BorderRadius.all(Radius.circular(16));
const k12pxBorderRadius = BorderRadius.all(Radius.circular(12));
const k8pxBorderRadius = BorderRadius.all(Radius.circular(8));
const k4pxBorderRadius = BorderRadius.all(Radius.circular(4));

const k24pxSheetRadius = BorderRadius.vertical(top: Radius.circular(24));

final kMainPadding = EdgeInsets.symmetric(horizontal: 20.sp);
final kLato300 = TextStyle(
  fontFamily: 'Lato',
  color: kTextColor,
  fontWeight: FontWeight.w300,
  fontSize: 14.sp,
  letterSpacing: -0.64,
);

TextStyle kLato300Responsive(double fontSize) => TextStyle(
      fontFamily: 'Lato',
      color: kTextColor,
      fontWeight: FontWeight.w300,
      fontSize: fontSize.sp,
      letterSpacing: -0.64,
    );

final kLato400 = TextStyle(
  fontFamily: 'Lato',
  color: kTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
  letterSpacing: -0.64,
);

TextStyle kLato400Responsive(double fontSize, {Color? color}) => TextStyle(
      fontFamily: 'Lato',
      color: color ?? kTextColor,
      fontWeight: FontWeight.w400,
      fontSize: fontSize.sp,
      letterSpacing: -0.64,
    );

final kLato500 = TextStyle(
  fontFamily: 'Lato',
  color: kTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 14.sp,
  letterSpacing: -0.64,
);

TextStyle kLato500Responsive(double fontSize, {Color? color}) => TextStyle(
      fontFamily: 'Lato',
      color: color ?? kTextColor,
      fontWeight: FontWeight.w500,
      fontSize: fontSize.sp,
      letterSpacing: -0.64,
    );

final kLato600 = TextStyle(
  fontFamily: 'Lato',
  color: kTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 14.sp,
  letterSpacing: -0.64,
);

TextStyle kLato600Responsive(double fontSize) => TextStyle(
      fontFamily: 'Lato',
      color: kTextColor,
      fontWeight: FontWeight.w600,
      fontSize: fontSize.sp,
      letterSpacing: -0.64,
    );

final kLato700 = TextStyle(
  fontFamily: 'Lato',
  color: kTextColor,
  fontWeight: FontWeight.w700,
  fontSize: 14.sp,
  letterSpacing: -0.64,
);

TextStyle kLato700Responsive(double fontSize) => TextStyle(
      fontFamily: 'Lato',
      color: kTextColor,
      fontWeight: FontWeight.w700,
      fontSize: fontSize.sp,
      letterSpacing: -0.64,
    );

class ResponsiveEdgeInsets extends EdgeInsets {
  ResponsiveEdgeInsets.only({
    num left = 0.0,
    num top = 0.0,
    num right = 0.0,
    num bottom = 0.0,
  }) : super.only(
          left: left.sp,
          top: top.sp,
          right: right.sp,
          bottom: bottom.sp,
        );

  ResponsiveEdgeInsets.symmetric({
    num vertical = 0.0,
    num horizontal = 0.0,
  }) : super.symmetric(
          horizontal: horizontal.sp,
          vertical: vertical.sp,
        );

  ResponsiveEdgeInsets.all(num value) : super.all(value.sp);
}
