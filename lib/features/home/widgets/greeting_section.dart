import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(AppSizes.h16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [AppDarkColors.categoryBackground, AppDarkColors.cardDarkColor]
              : [
                  AppColors.secondary.withValues(alpha: 0.1),
                  AppColors.primary,
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSizes.r16),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark
                            ? AppColors.whiteColor.withValues(alpha: 0.7)
                            : AppColors.labelMediumColor,
                      ),
                ),
                SizedBox(height: AppSizes.h4),
                Text(
                  'Turn waste into value',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            isDark ? AppColors.whiteColor : AppColors.textPrimary,
                      ),
                ),
                SizedBox(height: AppSizes.h8),
                Text(
                  'Post your materials and earn',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? AppColors.whiteColor.withValues(alpha: 0.8)
                            : AppColors.subtitle,
                      ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppSizes.h12),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.recycling_rounded,
              size: AppSizes.h40,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}