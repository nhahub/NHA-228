import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/features/home/widgets/image_in_card.dart';

class MaterialCard extends StatelessWidget {
  final MaterialModel material;
  final int index;

  const MaterialCard({super.key, required this.material, required this.index});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 400 + (index * 100)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: GestureDetector(
        onTap: () => context.push(AppRouter.cardDetailsScreen, extra: material),
        child: Container(
          margin: EdgeInsets.only(bottom: AppSizes.h16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
                  isDark
                      ? [AppDarkColors.categoryBackground, AppDarkColors.cardDarkColor]
                      : [
                        AppColors.secondary.withValues(alpha: 0.85),
                        AppColors.navBarColor,
                      ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppSizes.r16),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: 0.25),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: EdgeInsets.all(AppSizes.w12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image with badge
                    Stack(
                      children: [
                        ImageInCard(m: material),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.w6,
                              vertical: AppSizes.h2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(AppSizes.r8),
                            ),
                            child: Text(
                              '${material.quantity} KG',
                              style: TextStyle(
                                fontSize: AppSizes.sp12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: AppSizes.w12),

                    // Title and Description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  material.materialType,
                                  style: TextStyle(
                                    fontSize: AppSizes.sp18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.w8,
                                  vertical: AppSizes.h4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(AppSizes.r8),
                                ),
                                child: Text(
                                  '${material.totalPrice} EGP',
                                  style: TextStyle(
                                    fontSize: AppSizes.sp14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: AppSizes.h8),

                          Text(
                            material.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: AppSizes.sp14,
                              color: AppColors.whiteColor.withValues(alpha: 0.9),
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Info Section
              Container(
                padding: EdgeInsets.all(AppSizes.w12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizes.r16),
                    bottomRight: Radius.circular(AppSizes.r16),
                  ),
                ),
                child: Row(
                  children: [
                    _buildInfoChip(
                      icon: Icons.location_on_outlined,
                      value: material.location,
                      flex: 2,
                    ),
                    SizedBox(width: AppSizes.w8),
                    _buildInfoChip(
                      icon: Icons.calendar_today_outlined,
                      value: material.date,
                      flex: 1,
                    ),
                    SizedBox(width: AppSizes.w8),
                    _buildInfoChip(
                      icon: Icons.access_time_outlined,
                      value: material.time,
                      flex: 1,
                    ),
                  ],
                ),
              ),

              // Contact Footer
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w12,
                  vertical: AppSizes.h10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppSizes.h6),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.phone_outlined,
                            size: AppSizes.sp14,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(width: AppSizes.w8),
                        Text(
                          material.whatsappNumber,
                          style: TextStyle(
                            fontSize: AppSizes.sp14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: AppSizes.sp12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor.withValues(alpha: 0.8),
                          ),
                        ),
                        SizedBox(width: AppSizes.w4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: AppSizes.sp12,
                          color: AppColors.whiteColor.withValues(alpha: 0.8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String value, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Row(
        children: [
          Icon(
            icon,
            size: AppSizes.sp14,
            color: AppColors.whiteColor.withValues(alpha: 0.8),
          ),
          SizedBox(width: AppSizes.w4),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: AppSizes.sp12,
                color: AppColors.whiteColor.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
