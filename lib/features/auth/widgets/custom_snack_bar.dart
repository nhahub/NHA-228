import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_colors.dart';

class CustomSnackBar {
  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor ?? AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
