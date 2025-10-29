import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';
import 'package:shimmer/shimmer.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostMaterialCubit, PostMaterialState>(
      listener: (context, state) {
        if (state.status == PostMaterialStatus.success) {
          CustomSnackBar.show(
            context,
            AppStrings.materialPostedSuccessfully,
            backgroundColor: AppColors.success,
          );
          Navigator.pop(context); 
        } else if (state.status == PostMaterialStatus.error) {
          CustomSnackBar.show(
            context,
            state.errorMessage ?? AppStrings.somethingWentWrong,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await cubit.postMaterial();
            } else {
              CustomSnackBar.show(
                context,
                "Please fill all required fields",
                backgroundColor: AppColors.error,
              );
            }
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
