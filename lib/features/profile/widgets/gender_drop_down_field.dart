import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';

class GenderDropdownField extends StatefulWidget {
  const GenderDropdownField({super.key});

  @override
  State<GenderDropdownField> createState() => _GenderDropdownFieldState();
}

class _GenderDropdownFieldState extends State<GenderDropdownField> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.gender, style: Theme.of(context).textTheme.labelMedium),
        SizedBox(height: AppSizes.h10),

        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            value: gender,
            hint: Text(AppStrings.gender, style: Theme.of(context).textTheme.labelMedium),
            items:
                [AppStrings.female, AppStrings.male]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: Theme.of(context).textTheme.labelMedium),
                      ),
                    )
                    .toList(),
            onChanged: (v) => setState(() => gender = v),

            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.w8),
              decoration: BoxDecoration(
                color: AppColors.textFieldFillColor,
                borderRadius: BorderRadius.circular(AppSizes.r10),
                border: Border.all(color: AppColors.boarderColor),
              ),
            ),

            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppSizes.sp14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
