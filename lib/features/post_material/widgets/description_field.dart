import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/utils/validators.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostMaterialCubit>();

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
Text(
  AppStrings.description,
  style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppColors.textPrimary,
      ),
),
          SizedBox(height: AppSizes.h8),

          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: AppStrings.describeYourMaterialCase,
              hintStyle: TextStyle(color: AppColors.addAPhotoOutlined),
              filled: true,
            fillColor: AppColors.whiteColor,
            ),
          
          validator: (value) => value.descriptionValidator(value),
          onChanged: (val) => cubit.setDescription(val.trim()),
        ),
        ],)
    );
  }
}
