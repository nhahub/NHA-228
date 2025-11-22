import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/features/home/widgets/image_in_card.dart';
import 'package:nha_228/features/home/widgets/material_info_item.dart';

class MaterialCardItem extends StatelessWidget {
  final MaterialModel material;

  const MaterialCardItem({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => context.push(AppRouter.cardDetailsScreen, extra: material),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
                isDark
                    ? [AppDarkColors.categoryBackground, AppDarkColors.cardDarkColor]
                    : [AppColors.navBarColor, AppColors.categoryFoot],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageInCard(m: material),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        material.materialType,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        material.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.whiteColor.withOpacity(.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: AppColors.whiteColor.withOpacity(.3)),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: MaterialInfoItem(
                    icon: Icons.location_on,
                    value: material.location,
                  ),
                ),
                Expanded(
                  child: MaterialInfoItem(
                    icon: Icons.payments,
                    value: "${material.totalPrice} EG",
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: MaterialInfoItem(
                    icon: Icons.inventory,
                    value: "${material.quantity} KG",
                  ),
                ),
                Expanded(
                  child: MaterialInfoItem(
                    icon: Icons.calendar_month,
                    value: material.date,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: MaterialInfoItem(icon: Icons.access_time, value: material.time),
                ),
                Expanded(
                  child: MaterialInfoItem(
                    icon: Icons.phone,
                    value: material.whatsappNumber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
