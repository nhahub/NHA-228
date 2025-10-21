import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    // primaryColor: Color(0xffFFFFFF),
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
