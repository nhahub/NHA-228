import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';
import 'package:shimmer/shimmer.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostMaterialCubit, PostMaterialState>(
      listener: (context, state) {
        if (state.status == PostMaterialStatus.success) {
          CustomSnackBar.show(
            context,
            "Material posted successfully!",
            backgroundColor: AppColors.success,
          );
        } else if (state.status == PostMaterialStatus.error) {
          CustomSnackBar.show(
            context,
            'Something went wrong',
            backgroundColor: AppColors.error,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<PostMaterialCubit>();

        if (state.status == PostMaterialStatus.loading) {
          return Shimmer.fromColors(
            baseColor: AppColors.borderSide,
            highlightColor: AppColors.highlightColor,
            child: Container(
              height: AppSizes.h50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.borderSide,
                borderRadius: BorderRadius.circular(AppSizes.r12),
              ),
            ),
          );
        }

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.focusedBorderColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () async {
            await cubit.postMaterial();
          },
          child: Text(
            AppStrings.submit,
            style: TextStyle(fontSize: AppSizes.sp16, color: AppColors.whiteColor),
          ),
        );
      },
    );
  }
}
