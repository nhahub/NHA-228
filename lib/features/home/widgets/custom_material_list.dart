import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/features/home/models/material_model.dart';

class CustomMaterialList extends StatelessWidget {
  const CustomMaterialList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection('materials')
              .orderBy('createdAt', descending: true)
              .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('لا توجد مواد منشورة بعد 🔄'));
        }

        final materials =
            snapshot.data!.docs
                .map((doc) => MaterialModel.fromMap(doc.data() as Map<String, dynamic>))
                .toList();

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: materials.length,
          itemBuilder: (context, index) {
            final material = materials[index];

            return Container(
              margin: EdgeInsets.only(bottom: AppSizes.h16),
              padding: EdgeInsets.all(AppSizes.h12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      isDark
                          ? [
                            AppDarkColors.categoryBackground,
                            AppDarkColors.cardDarkColor,
                          ]
                          : [AppColors.navBarColor, AppColors.categoryFoot],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppSizes.r16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.r12),
                      child:
                          material.imageUrl != null && material.imageUrl!.isNotEmpty
                              ? Image.network(
                                material.imageUrl!,
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) => Container(
                                      width: 100.w,
                                      height: 100.h,
                                      color: Colors.grey.shade300,
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 40.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                              )
                              : Container(
                                width: 100.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(AppSizes.r12),
                                ),
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 40.sp,
                                  color: AppColors.skipButtonColor,
                                ),
                              ),
                    ),
                  ),
                  SizedBox(width: AppSizes.w12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          material.materialType,
                          style: TextStyle(
                            fontSize: AppSizes.sp16,
                            fontWeight: FontWeight.bold,
                            color:
                                isDark
                                    ? AppDarkColors.categoryFoot
                                    : AppColors.skipButtonColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: AppSizes.h4),
                        Text(
                          material.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppSizes.sp14,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: AppSizes.h4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "📍 ${material.location}",
                                style: TextStyle(color: AppColors.whiteColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "💰 ${material.totalPrice} EG",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
