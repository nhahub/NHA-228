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
        color: AppColors.textprimary,
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
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.onboardtextColor,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.skipbuttonColor,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xff009639)),
        foregroundColor: WidgetStatePropertyAll(Color(0xffFFFFFF)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
      ),
    ),
  );
}
