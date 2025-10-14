import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/features/home/models/waste_item_model.dart';

class CustomElevatedItemBotton extends StatelessWidget {
  final WasteItem item;
  const CustomElevatedItemBotton({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: AppValues.h33,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.categoryfoot,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppValues.r18),
            bottomRight: Radius.circular(AppValues.r18),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppValues.w12,
            vertical: AppValues.h8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
