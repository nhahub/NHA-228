import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 38.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      labelMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.labelMediumColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.onboardTextColor,
      ),
      labelSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.skipButtonColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.skipButtonColor,
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        color: AppColors.appBar,
        fontFamily: 'otama.ep',
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.appBar),
      titleTextStyle: TextStyle(
        color: AppColors.appBar,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.whiteColor,
      circularTrackColor: Colors.transparent,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.focusedBorderColor),
        foregroundColor: WidgetStatePropertyAll(AppColors.whiteColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
      ),
    ),
  );
}
