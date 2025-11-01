import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/models/waste_item_model.dart';

class CustomElevatedItemBotton extends StatelessWidget {
  final WasteItem item;

  const CustomElevatedItemBotton({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {},
      child: Container(
        height: AppSizes.h32,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? AppDarkColors.textFieldFillColor : AppColors.categoryFoot,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSizes.r18),
            bottomRight: Radius.circular(AppSizes.r18),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w12, vertical: AppSizes.h8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    item.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),

              //Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
