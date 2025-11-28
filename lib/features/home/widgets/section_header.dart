import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showSeeAll;
  final VoidCallback? onSeeAllPressed;

  const SectionHeader({
    super.key,
    required this.title,
    this.showSeeAll = false,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: AppSizes.h20,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(width: AppSizes.w8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.whiteColor : AppColors.textPrimary,
                  ),
            ),
          ],
        ),
        if (showSeeAll)
          TextButton(
            onPressed: onSeeAllPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w8,
                vertical: AppSizes.h4,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'See all',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(width: AppSizes.w4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: AppSizes.sp12,
                  color: AppColors.secondary,
                ),
              ],
            ),
          ),
      ],
    );
  }
}