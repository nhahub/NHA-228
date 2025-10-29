import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class LocationField extends StatelessWidget {
  const LocationField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostMaterialCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.yourLocation,
          style: TextStyle(
            fontSize: AppSizes.sp16,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.h8),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: AppStrings.enterYourLocation,
            hintStyle: TextStyle(color: AppColors.addAPhotoOutlined),
            filled: true,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
          ),
          onChanged: (val) => cubit.setLocation(val),
        ),
      ],
    );
  }
}
