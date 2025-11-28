import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/features/home/widgets/contact_section.dart';
import 'package:nha_228/features/home/widgets/info_item.dart';
import 'package:nha_228/features/home/widgets/smart_image.dart';

class CardDetailsScreen extends StatelessWidget {
  final MaterialModel material;
  final String? pickedImagePath;

  const CardDetailsScreen({super.key, required this.material, this.pickedImagePath});

  Widget _buildPlaceholderImage() {
    return Container(
      color: AppColors.categoryBackground,
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: AppSizes.h60,
          color: AppColors.secondary.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? null : AppColors.primary,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(AppSizes.h8),
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.whiteColor,
              size: AppSizes.sp18,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        elevation: 0,
        title: Text(
          AppStrings.cardDetails,
          style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary,
                    AppColors.secondary.withValues(alpha: 0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSizes.h16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppSizes.w20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.r16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textPrimary.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.r16),
                      child: SizedBox(
                        height: AppSizes.h200,
                        width: double.infinity,
                        child:
                            (pickedImagePath != null && pickedImagePath!.isNotEmpty)
                                ? SmartImage(imageUrlOrPath: pickedImagePath)
                                : (material.imageUrl != null &&
                                        material.imageUrl!.isNotEmpty
                                    ? SmartImage(imageUrlOrPath: material.imageUrl)
                                    : _buildPlaceholderImage()),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.h24),
                ],
              ),
            ),

            // Content
            Container(
              padding: EdgeInsets.all(AppSizes.w20),
              decoration: BoxDecoration(
                color: isDark ? null : AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.r16),
                  topRight: Radius.circular(AppSizes.r16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + price
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              material.materialType,
                              style: TextStyle(
                                fontSize: AppSizes.sp24,
                                fontWeight: FontWeight.bold,
                                color:
                                    isDark ? AppColors.whiteColor : AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: AppSizes.h4),
                            Row(
                              children: [
                                Icon(
                                  Icons.inventory_2_outlined,
                                  size: AppSizes.sp14,
                                  color: AppColors.secondary,
                                ),
                                SizedBox(width: AppSizes.w4),
                                Text(
                                  '${material.quantity} KG',
                                  style: TextStyle(
                                    fontSize: AppSizes.sp14,
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.w14,
                          vertical: AppSizes.h8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(AppSizes.r12),
                        ),
                        child: Text(
                          '${material.totalPrice} EGP',
                          style: TextStyle(
                            fontSize: AppSizes.sp18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.h20),

                  // Description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: AppSizes.sp16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.whiteColor : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSizes.h8),
                  Text(
                    material.description,
                    style: TextStyle(
                      fontSize: AppSizes.sp14,
                      height: 1.5,
                      color:
                          isDark
                              ? AppColors.whiteColor.withValues(alpha: 0.8)
                              : AppColors.subtitle,
                    ),
                  ),
                  SizedBox(height: AppSizes.h24),

                  // Details + InfoGrid (using InfoItem)
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: AppSizes.sp16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.whiteColor : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSizes.h12),
                  Container(
                    padding: EdgeInsets.all(AppSizes.w16),
                    decoration: BoxDecoration(
                      color:
                          isDark
                              ? AppDarkColors.categoryBackground
                              : AppColors.categoryBackground,
                      borderRadius: BorderRadius.circular(AppSizes.r16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InfoItem(
                                icon: Icons.location_on_outlined,
                                label: 'Location',
                                value: material.location,
                                isDark: isDark,
                              ),
                            ),
                            SizedBox(width: AppSizes.w12),
                            Expanded(
                              child: InfoItem(
                                icon: Icons.calendar_today_outlined,
                                label: 'Date',
                                value: material.date,
                                isDark: isDark,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.h16),
                        Row(
                          children: [
                            Expanded(
                              child: InfoItem(
                                icon: Icons.access_time_outlined,
                                label: 'Time',
                                value: material.time,
                                isDark: isDark,
                              ),
                            ),
                            SizedBox(width: AppSizes.w12),
                            Expanded(
                              child: InfoItem(
                                icon: Icons.phone_outlined,
                                label: 'Contact',
                                value: material.whatsappNumber,
                                isDark: isDark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.h24),

                  // Contact section (reusable widget)
                  ContactSection(whatsappNumber: material.whatsappNumber),

                  SizedBox(height: AppSizes.h24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
