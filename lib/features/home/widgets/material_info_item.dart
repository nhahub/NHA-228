import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class MaterialInfoItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const MaterialInfoItem({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.h6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.whiteColor, size: AppSizes.sp20),
          SizedBox(width: AppSizes.w18),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSizes.sp15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
