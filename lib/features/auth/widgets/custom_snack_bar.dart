import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
class CustomSnackBar {
  static void show(BuildContext context, String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style:  TextStyle(color:AppColors.whiteColor)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor ?? AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
