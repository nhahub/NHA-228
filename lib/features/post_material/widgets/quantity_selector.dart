import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quantity (${quantity.toStringAsFixed(0)} kg)",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Total: ${totalPrice.toStringAsFixed(1)} EGP",
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => cubit.setQuantity(quantity + 1),
                    borderRadius: BorderRadius.circular(6),
                    child: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      size: 28,
                      color: AppColors.textprimary,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (quantity > 0) cubit.setQuantity(quantity - 1);
                    },
                    borderRadius: BorderRadius.circular(6),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 28,
                      color: AppColors.textprimary,
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
