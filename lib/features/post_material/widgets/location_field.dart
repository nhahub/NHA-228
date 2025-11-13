import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class LocationField extends StatelessWidget {
  const LocationField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostMaterialCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.yourLocation, style: Theme.of(context).textTheme.labelMedium),
        SizedBox(height: AppSizes.h8),
        TextFormField(
          maxLines: 3,
          cursorColor: AppColors.success,
          decoration: InputDecoration(
            hintText: AppStrings.enterYourLocation,
            hintStyle: TextStyle(color: AppColors.addAPhotoOutlined),
            filled: true,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please enter your location";
            }
            return null;
          },
          onChanged: (val) => cubit.setLocation(val.trim()),
        ),
      ],
    );
  }
}
