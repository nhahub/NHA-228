import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
     primaryColor: AppColors.primary,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: AppSizes.sp38 ,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes.sp24,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      labelMedium: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w400,
        color: AppColors.labelMediumColor,
      ),
      bodySmall: TextStyle(
        fontSize: AppSizes.sp12,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: AppSizes.sp14,
        fontWeight: FontWeight.w400,
        color: AppColors.onboardTextColor,
      ),
      labelSmall: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w500,
        color: AppColors.skipButtonColor,
      ),
      bodyMedium: TextStyle(
        fontSize: AppSizes.sp12,
        fontWeight: FontWeight.w600,
        color: AppColors.skipButtonColor,
      ),
      displaySmall: TextStyle(
        fontSize: AppSizes.sp12,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontSize: AppSizes.sp18,
        fontWeight: FontWeight.bold
      ),
      headlineSmall: TextStyle(
        fontSize: AppSizes.sp24,
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
        fontSize: AppSizes.sp24,
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
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r4)),
        ),
      ),
    ),
  );
}
