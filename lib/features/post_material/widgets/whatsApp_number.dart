import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import '../cubit/post_material_cubit.dart';

class WhatsappNumber extends StatelessWidget {
  const WhatsappNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostMaterialCubit, PostMaterialState>(
      builder: (context, state) {
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
              autovalidateMode: AutovalidateMode.onUserInteraction,

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

              onChanged: (value) {
                context.read<PostMaterialCubit>().setPhoneNumber(value);
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return AppStrings.pleaseEnterAWhatsAppNumber;
                }
                final phone = value.trim();
                if (!RegExp(r'^\+?\d{10,15}$').hasMatch(phone)) {
                  return AppStrings.invalidWhatsAppNumber;
                }

                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
