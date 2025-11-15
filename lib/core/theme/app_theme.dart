import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: AppSizes.sp38,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes.sp24,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: AppSizes.sp14,
        fontWeight: FontWeight.w400,
        color: AppColors.onboardTextColor,
      ),
      labelMedium: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w400,
        color: AppColors.labelMediumColor,
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
      bodySmall: TextStyle(
        fontSize: AppSizes.sp12,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
      ),
      headlineLarge: TextStyle(
        fontSize: AppSizes.sp14,
        color: AppColors.otpVerificationScreenTextColor,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      displayLarge: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.bold,
        color: AppColors.skipButtonColor,
      ),
      displayMedium: TextStyle(fontSize: AppSizes.sp18, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
        fontSize: AppSizes.sp12,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFieldFillColor,
      prefixIconColor: AppColors.secondary,
      hintStyle: TextStyle(
        fontSize: AppSizes.sp14,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppColors.boarderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppColors.boarderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppColors.focusedBorderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppColors.errorBorderColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppColors.errorBorderColor),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.w12,
        vertical: AppSizes.h12,
      ),
    ),
    cardTheme: CardThemeData(color: AppColors.textFieldFillColor),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      height: AppSizes.h60,
      color: AppColors.navBarColor,
    ),
    cardColor: AppColors.categoryBackground,
  );
}
