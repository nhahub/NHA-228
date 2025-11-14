import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_dark_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppDarkColors.scaffoldBackgroundColor,
    primaryColor: AppDarkColors.primary,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: AppSizes.sp38,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes.sp24,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: AppSizes.sp14,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.whiteColor,
      ),
      labelMedium: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: AppSizes.sp12,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.grey300,
      ),
      displaySmall: TextStyle(
        fontSize: AppSizes.sp12,
        color: AppDarkColors.whiteColor,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(fontSize: AppSizes.sp18, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
        fontSize: AppSizes.sp24,
        color: AppDarkColors.whiteColor,
        fontFamily: 'otama.ep',
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        fontSize: AppSizes.sp14,
        color: AppDarkColors.otpVerificationScreenTextColor,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.bold,
        color: AppDarkColors.skipButtonColor,
      ),
      headlineMedium: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w500,
        color: AppDarkColors.whiteColor,
      ),
      labelSmall: TextStyle(
        fontSize: AppSizes.sp16,
        fontWeight: FontWeight.w500,
        color: AppDarkColors.whiteColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppDarkColors.scaffoldBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppDarkColors.whiteColor),
      titleTextStyle: TextStyle(
        color: AppDarkColors.whiteColor,
        fontSize: AppSizes.sp24,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppDarkColors.focusedBorderColor),
        foregroundColor: WidgetStatePropertyAll(AppDarkColors.whiteColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r4)),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppDarkColors.darkTextFieldFill,
      prefixIconColor: AppDarkColors.whiteColor,
      hintStyle: TextStyle(
        fontSize: AppSizes.sp14,
        fontWeight: FontWeight.w400,
        color: AppDarkColors.grey500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppDarkColors.cameraBackground),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppDarkColors.boarderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppDarkColors.cameraBackground),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppDarkColors.errorBorderColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
        borderSide: BorderSide(color: AppDarkColors.errorBorderColor),
      ),
    ),
    cardTheme: CardThemeData(color: AppDarkColors.textFieldFillColor),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      height: AppSizes.h60,
      color: AppDarkColors.navBarColor,
    ),
    cardColor: AppDarkColors.categoryBackground,
  );
}
