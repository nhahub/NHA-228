import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/features/home/widgets/image_in_card.dart';
import 'package:nha_228/features/home/widgets/material_info_item.dart';
import 'package:nha_228/features/profile/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CardDetilesScreen extends StatelessWidget {
  final MaterialModel material;

  const CardDetilesScreen({super.key, required this.material});

  Future<void> openWhatsApp(BuildContext context, String number) async {
    String phone = number.replaceAll(RegExp(r'[^0-9]'), '');

    if (phone.startsWith("01")) phone = "2$phone";
    if (!phone.startsWith("20")) phone = "20$phone";

    final Uri url = Uri.parse("https://wa.me/$phone");

    final bool launched = await launchUrl(url, mode: LaunchMode.externalApplication);

    if (!launched) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Could not open WhatsApp")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.navBarColor,
        title: Text(
          AppStrings.cardDetails,
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.w20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.r16),
                child: ImageInCard(m: material),
              ),
            ),

            SizedBox(height: AppSizes.h24),

            Text(
              material.materialType,
              style: TextStyle(
                fontSize: AppSizes.sp22,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.whiteColor : AppColors.textPrimary,
              ),
            ),

            SizedBox(height: AppSizes.h12),

            Text(
              material.description,
              style: TextStyle(
                fontSize: AppSizes.sp16,
                height: 1.4,
                color:
                    isDark
                        ? AppColors.whiteColor.withOpacity(0.7)
                        : AppColors.textPrimary.withOpacity(0.87),
              ),
            ),

            SizedBox(height: AppSizes.h24),

            Divider(),

            SizedBox(height: AppSizes.h20),

            _buildInfoCard(
              isDark: isDark,
              children: [
                MaterialInfoItem(icon: Icons.location_on, value: material.location),
                MaterialInfoItem(
                  icon: Icons.payments,
                  value: "${material.totalPrice} EG",
                ),
                MaterialInfoItem(icon: Icons.inventory, value: "${material.quantity} KG"),
              ],
            ),

            _buildInfoCard(
              isDark: isDark,
              children: [
                MaterialInfoItem(icon: Icons.calendar_month, value: material.date),
                MaterialInfoItem(icon: Icons.access_time, value: material.time),
              ],
            ),

            SizedBox(height: AppSizes.h50),

            Center(
              child: CustomElevatedButton(
                title: 'Contact on WhatsApp',

                onPressed: () {
                  openWhatsApp(context, material.whatsappNumber);
                },
              ),
            ),

            SizedBox(height: AppSizes.h16),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required bool isDark, required List<Widget> children}) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.h16),
      padding: EdgeInsets.all(AppSizes.w16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.r16),
        gradient: LinearGradient(
          colors:
              isDark
                  ? [AppDarkColors.categoryBackground, AppDarkColors.cardDarkColor]
                  : [AppColors.navBarColor, AppColors.categoryFoot],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }
}
