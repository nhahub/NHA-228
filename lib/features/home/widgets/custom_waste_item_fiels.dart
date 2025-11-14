import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/models/waste_item_model.dart';
import 'package:nha_228/features/home/widgets/custom_elevated_item_botton.dart';

class CustomWasteItemFiels extends StatelessWidget {
  final WasteItem item;

  const CustomWasteItemFiels({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppSizes.r18),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              item.imagePath,
              width: AppSizes.w148,
              height: AppSizes.h200,
            ),
          ),
          SizedBox(height: AppSizes.h8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w8,
                  vertical: AppSizes.h2,
                ),
                child: Text(item.price, style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),

          SizedBox(height: AppSizes.h4),
          CustomElevatedItemBotton(item: item),
        ],
      ),
    );
  }
}
