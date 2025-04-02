import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/core/theme/fonts.dart';

ThemeData appTheme = ThemeData(
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18.h,
      color: CustomColors.pureWhite,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.defaultFontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 14.h,
      height: 1,
      color: CustomColors.pureWhite,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.defaultFontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: 16.h,
      height: 1.1,
      color: CustomColors.primaryBlue,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.defaultFontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 14.h,
      height: 1.1,
      color: CustomColors.spanishGrey,
      fontWeight: FontWeight.normal,
      fontFamily: FontFamily.defaultFontFamily,
    ),
    displayLarge: TextStyle(
      fontSize: 16.h,
      height: 1.1,
      color: CustomColors.jetGrey,
      fontWeight: FontWeight.normal,
      fontFamily: FontFamily.defaultFontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 15.h,
      height: 1.1,
      color: CustomColors.pureWhite,
      fontWeight: FontWeight.normal,
      fontFamily: FontFamily.defaultFontFamily,
    ),
  ),
  appBarTheme: AppBarTheme(backgroundColor: CustomColors.primaryBlue),
  scaffoldBackgroundColor: CustomColors.pureWhite,
  colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryBlue),
  fontFamily: FontFamily.defaultFontFamily,
);
