import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostMaterialCubit, PostMaterialState>(
      builder: (context, state) {
        final cubit = context.read<PostMaterialCubit>();
        final quantity = state.quantity ?? 0;
        final totalPrice = state.totalPrice ?? 0;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w16, vertical: AppSizes.h14),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.r12),
            border: Border.all(color: AppColors.borderSide),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quantity (${quantity.toStringAsFixed(0)} kg)",
                    style: TextStyle(
                      fontSize: AppSizes.sp16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.labelColor,
                    ),
                  ),
                  SizedBox(height: AppSizes.h4),
                  Text(
                    "Total: ${totalPrice.toStringAsFixed(1)} EGP",
                    style: TextStyle(
                      fontSize: AppSizes.sp14,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => cubit.setQuantity(quantity + 1),
                    borderRadius: BorderRadius.circular(AppSizes.r6),
                    child: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      size: 28,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (quantity > 0) cubit.setQuantity(quantity - 1);
                    },
                    borderRadius: BorderRadius.circular(AppSizes.r6),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 28,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
