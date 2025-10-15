import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';

class ImagePickerField extends StatefulWidget {
  const ImagePickerField({super.key});

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => selectedImage = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          AppStrings.addAPhoto,
          style: TextStyle(fontSize: AppSizes.sp16, fontWeight: FontWeight.w600),
        ),
         SizedBox(height: AppSizes.h8),
        GestureDetector(
          onTap: pickImage,
          child: Container(
            height: AppSizes.h150,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(AppSizes.r16),
              border: Border.all(color: AppColors.borderSide),
            ),
            child:
                selectedImage == null
                    ?  Center(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 40,
                        color: AppColors.borderSide,
                      ),
                    )
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.r16),
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
          ),
        ),
      ],
    );
  }
}
