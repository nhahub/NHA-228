import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/features/home/widgets/image_in_card.dart';
import 'package:nha_228/features/home/widgets/material_info_item.dart';

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
          return const Center(child: Text(AppStrings.noPublishedMaterialYet));
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
            final m = materials[index];

            return GestureDetector(
              onTap: () => context.push(AppRouter.cardDetilesScreen, extra: m),
              child: Container(
                margin: EdgeInsets.only(bottom: AppSizes.h16),
                padding: EdgeInsets.all(AppSizes.w12),
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
                  borderRadius: BorderRadius.circular(AppSizes.r14),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textPrimary.withOpacity(.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageInCard(m: m),

                        SizedBox(width: AppSizes.w12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                m.materialType,
                                style: TextStyle(
                                  fontSize: AppSizes.sp17,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                ),
                              ),

                              SizedBox(height: AppSizes.h4),
                              Text(
                                m.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: AppSizes.sp14,
                                  color: AppColors.whiteColor.withOpacity(.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSizes.h10),
                    Divider(color: AppColors.whiteColor.withOpacity(.3)),
                    SizedBox(height: AppSizes.h10),

                    Row(
                      children: [
                        Expanded(
                          child: MaterialInfoItem(
                            icon: Icons.location_on,
                            value: m.location,
                          ),
                        ),
                        Expanded(
                          child: MaterialInfoItem(
                            icon: Icons.payments,

                            value: "${m.totalPrice} EG",
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSizes.h10),

                    Row(
                      children: [
                        Expanded(
                          child: MaterialInfoItem(
                            icon: Icons.inventory,

                            value: "${m.quantity} KG",
                          ),
                        ),
                        Expanded(
                          child: MaterialInfoItem(
                            icon: Icons.calendar_month,
                            value: m.date,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSizes.h10),

                    Row(
                      children: [
                        Expanded(
                          child: MaterialInfoItem(icon: Icons.access_time, value: m.time),
                        ),
                        Expanded(
                          child: MaterialInfoItem(
                            icon: Icons.phone,
                            value: m.whatsappNumber,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
