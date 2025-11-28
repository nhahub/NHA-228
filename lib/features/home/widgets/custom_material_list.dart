import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/features/home/widgets/material_card.dart';

class CustomMaterialList extends StatelessWidget {
  const CustomMaterialList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('materials')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingState();
        }

        if (snapshot.hasError) {
          return _buildErrorState(context);
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return _buildEmptyState(context);
        }

        final materials = snapshot.data!.docs
            .map((doc) =>
                MaterialModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: materials.length,
          itemBuilder: (context, index) {
            return MaterialCard(
              material: materials[index],
              index: index,
            );
          },
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.h40),
      child: Column(
        children: [
          SizedBox(
            width: AppSizes.h40,
            height: AppSizes.h40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
            ),
          ),
          SizedBox(height: AppSizes.h16),
          Text(
            'Loading materials...',
            style: TextStyle(
              color: AppColors.subtitle,
              fontSize: AppSizes.sp14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(AppSizes.h32),
      decoration: BoxDecoration(
        color: isDark
            ? AppDarkColors.categoryBackground
            : AppColors.categoryBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(
          color: AppColors.secondary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.h16),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              size: AppSizes.h48,
              color: AppColors.secondary,
            ),
          ),
          SizedBox(height: AppSizes.h16),
          Text(
            'No materials yet',
            style: TextStyle(
              fontSize: AppSizes.sp18,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.whiteColor : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.h8),
          Text(
            'Be the first to post your recyclable materials!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppSizes.sp14,
              color: isDark
                  ? AppColors.whiteColor.withValues(alpha: 0.7)
                  : AppColors.subtitle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(AppSizes.h32),
      decoration: BoxDecoration(
        color: AppColors.errorBorderColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: AppSizes.h48,
            color: AppColors.errorBorderColor,
          ),
          SizedBox(height: AppSizes.h16),
          Text(
            AppStrings.somethingWentWrong,
            style: TextStyle(
              fontSize: AppSizes.sp16,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}