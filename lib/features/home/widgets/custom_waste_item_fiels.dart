import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/features/home/models/waste_item_model.dart';
import 'package:nha_228/features/home/widgets/custom_elevated_item_botton.dart';

class CustomWasteItemFiels extends StatelessWidget {
  final WasteItem item;

  const CustomWasteItemFiels({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.categorybackground,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              item.imagePath,
              width: AppValues.w148,
              height: AppValues.h200,
            ),
          ),
          SizedBox(height: AppValues.h8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppValues.w8,
                  vertical: AppValues.h2,
                ),
                child: Text(item.price, style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),

          SizedBox(height: AppValues.h4),
          CustomElevatedItemBotton(item: item),
        ],
      ),
    );
  }
}
