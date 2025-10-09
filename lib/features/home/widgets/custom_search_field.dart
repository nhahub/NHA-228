import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_values.dart';

class CustomSearchfield extends StatelessWidget {
  final String hintText;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;

  const CustomSearchfield({
    super.key,
    required this.hintText,
    this.onSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        fillColor: AppColors.whiteColor,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColors.secondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.r10),
          borderSide: BorderSide(color: AppColors.boarderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.r10),
          borderSide: BorderSide(color: AppColors.boarderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.r10),
          borderSide: BorderSide(color: AppColors.focusedBorderColor),
        ),
      ),
    );
  }
}
