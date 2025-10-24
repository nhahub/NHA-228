import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/home/home_constants/category_values.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class MaterialGrid extends StatelessWidget {
  const MaterialGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PostMaterialCubit>();
    final state = cubit.state;
    final wasteItems = CategoryValues.wasteItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.chooseAMaterialType,
          style: TextStyle(
            fontSize: AppSizes.sp18,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.h12),

        GridView.builder(
          itemCount: wasteItems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final item = wasteItems[index];
            final isSelected = state.materialType == item.title;

            return GestureDetector(
              onTap: () {
                cubit.selectMaterial(item.title, item.price);
                cubit.setQuantity(state.quantity ?? 0);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? AppColors.primary.withValues(alpha: 0.15)
                          : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(AppSizes.r16),
                  border: Border.all(
                    color: isSelected ? AppColors.borderSide : AppColors.borderSide,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: AppSizes.r4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item.imagePath,
                      height: AppSizes.h48,
                      width: AppSizes.w48,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: AppSizes.h8),

                    Text(
                      item.title.split(" ").first,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        color:
                            isSelected
                                ? AppColors.whiteColor
                                : AppColors.chooseMaterialIsNotSelected,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
