import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/core/core.dart';

class ImageInCard extends StatelessWidget {
  const ImageInCard({super.key, required this.m});

  final MaterialModel m;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child:
          m.imageUrl != null && m.imageUrl!.isNotEmpty
              ? Image.network(
                m.imageUrl!,
                width: AppSizes.w100,
                height: AppSizes.h100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: AppSizes.w100,
                    height: AppSizes.h100,
                    color: AppColors.borderSide,
                    child: Icon(
                      Icons.image_not_supported,
                      color: AppColors.skipButtonColor,
                      size: AppSizes.sp35,
                    ),
                  );
                },
              )
              : Container(
                width: AppSizes.w100,
                height: AppSizes.h100,
                decoration: BoxDecoration(color: AppColors.borderSide),
                child: Icon(
                  Icons.image_not_supported,
                  size: AppSizes.sp35,
                  color: AppColors.skipButtonColor,
                ),
              ),
    );
  }
}
