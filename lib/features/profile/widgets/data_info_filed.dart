import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class DataInfoFiled extends StatelessWidget {
  const DataInfoFiled({super.key, this.data});
  final String? data;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: AppSizes.h56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppDarkColors.textFieldFillColor : AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(AppSizes.r10),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: AppSizes.w20),
          child: Text(data ?? '', style: Theme.of(context).textTheme.labelMedium),
        ),
      ),
    );
  }
}
