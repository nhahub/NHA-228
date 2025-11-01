import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostMaterialCubit, PostMaterialState>(
      listener: (context, state) {
        if (state.status == PostMaterialStatus.error && state.errorMessage != null) {
          CustomSnackBar.show(
            context,
            state.errorMessage!,
            backgroundColor: AppColors.error,
          );
        } else if (state.status == PostMaterialStatus.success) {
          CustomSnackBar.show(
            context,
            AppStrings.materialPostedSuccessfully,
            backgroundColor: AppColors.success,
          );
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.focusedBorderColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
          ),
          onPressed: () async {
            FocusScope.of(context).unfocus(); 
            await PostMaterialCubit();
          },

          child:
              state.status == PostMaterialStatus.loading
                  ? CircularProgressIndicator(color: AppColors.whiteColor)
                  : Text(
                    AppStrings.submit,
                    style: TextStyle(
                      fontSize: AppSizes.sp16,
                      color: AppColors.whiteColor,
                    ),
                  ),
        );
      },
    );
  }
}
