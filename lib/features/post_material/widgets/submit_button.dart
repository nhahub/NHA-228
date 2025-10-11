import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PostMaterialCubit>();
    final state = cubit.state;

    final isLoading = state.status == PostMaterialStatus.loading;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.focusedBorderColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: isLoading
            ? null
            : () async {
                
                if (state.materialType == null) {
                  CustomSnackBar.show(
                    context,
                    "Please choose the material type!",
                    backgroundColor: AppColors.errorBorderColor,
                  );
                  return;
                }

                if (state.location == null || state.location!.trim().isEmpty) {
                  CustomSnackBar.show(
                    context,
                    "Please enter your location!",
                    backgroundColor: AppColors.errorBorderColor,
                  );
                  return;
                }

                if (state.description == null || state.description!.trim().isEmpty) {
                  CustomSnackBar.show(
                    context,
                    "Please enter a description!",
                    backgroundColor: AppColors.errorBorderColor,
                  );
                  return;
                }

                if (state.quantity == null || state.quantity! <= 0) {
                  CustomSnackBar.show(
                    context,
                    "Please enter the correct quantity!",
                    backgroundColor: AppColors.errorBorderColor,
                  );
                  return;
                }

                try {
                  await cubit.postMaterial();
                  CustomSnackBar.show(
                    context,
                    "Material successfully posted!",
                    backgroundColor: AppColors.secondary,
                  );

                  
                  cubit.resetState();
                  Navigator.pop(context);
                } catch (e) {
                  CustomSnackBar.show(
                    context,
                    "Couldn't save, try again!",
                    backgroundColor: AppColors.errorBorderColor,
                  );
                }
              },
        child: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.4,
                ),
              )
            : const Text(
                "Post Your Material",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
