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
        TextField(
          decoration: InputDecoration(
            hintText: AppStrings.enterYourLocation,
            hintStyle: TextStyle(color: AppColors.addAPhotoOutlined),
          ),
          onChanged: (val) => cubit.setLocation(val),
        ),
      ],
    );
  }
}
