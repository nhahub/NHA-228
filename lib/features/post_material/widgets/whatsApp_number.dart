import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/core.dart';

import '../cubit/post_material_cubit.dart';

class WhatsappNumber extends StatelessWidget {
  const WhatsappNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.whatsAppNumber,
          style: TextStyle(
            fontSize: AppSizes.sp16,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.h8),
        TextFormField(
          keyboardType: TextInputType.phone,
          cursorColor: AppColors.success,
          decoration: InputDecoration(
            hintText: AppStrings.hintWhatsAppNumber,
            hintStyle: TextStyle(color: AppColors.addAPhotoOutlined),
            filled: true,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppSizes.r12),
            ),
          ),
          validator: (value) => value.whatsAppNumberValidator(value),
          onChanged: (value) {
            context.read<PostMaterialCubit>().setWhatsAppNumber(value);
          },
        ),
      ],
    );
  }
}
