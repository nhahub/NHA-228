import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 5.h,
      width: active ? 25.w : 5.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: active
            ? AppColors.activeIndcator
            : AppColors.nonactiveIndcator,
      ),
    );
  }
}