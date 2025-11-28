import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/core.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final categories = [
      {'icon': Icons.settings, 'label': AppStrings.metal},
      {'icon': Icons.local_drink, 'label': AppStrings.plastic},
      {'icon': Icons.description, 'label': AppStrings.paper},
      {'icon': Icons.memory, 'label': AppStrings.eWaste},
      {'icon': Icons.inventory_2, 'label': AppStrings.carton},
    ];

    return SizedBox(
      height: AppSizes.h44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: AppSizes.w8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              context.push(AppRouter.searchScreen, extra: category['label']);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w14,
                vertical: AppSizes.h8,
              ),
              decoration: BoxDecoration(
                color: isDark
                    ? AppDarkColors.categoryBackground
                    : AppColors.categoryBackground,
                borderRadius: BorderRadius.circular(AppSizes.r40),
                border: Border.all(
                  color: AppColors.secondary.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category['icon'] as IconData,
                    size: AppSizes.sp16,
                    color: AppColors.secondary,
                  ),
                  SizedBox(width: AppSizes.w6),
                  Text(
                    category['label'] as String,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.textPrimary,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}