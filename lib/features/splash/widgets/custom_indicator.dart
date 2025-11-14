import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: AppSizes.h4,
      width: active ? AppSizes.w24 : AppSizes.w4,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.w4),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.r100),
        color: active ? AppColors.activeIndicatorColor : AppColors.inactiveIndicatorColor,
      ),
    );
  }
}
