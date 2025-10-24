import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class ImagePickerField extends StatefulWidget {
  const ImagePickerField({super.key});

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  File? _selectedImage;

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() => _selectedImage = file);

      context.read<PostMaterialCubit>().setImage(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderSide),
          borderRadius: BorderRadius.circular(AppSizes.r12),
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            _selectedImage != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.r8),
                  child: Image.file(
                    _selectedImage!,
                    height: AppSizes.h150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                : Column(
                  children: [
                    const Icon(Icons.add_a_photo_outlined, size: 40),
                    SizedBox(height: AppSizes.h8),
                    Text(
                      AppStrings.tapToUploadImage,
                      style: TextStyle(color: AppColors.addAPhotoOutlined),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
