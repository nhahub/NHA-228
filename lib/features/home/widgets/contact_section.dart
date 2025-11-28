// lib/widgets/contact_section.dart  (or inline replacement)
import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/core/services/whatsapp_service.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';

class ContactSection extends StatelessWidget {
  final String? whatsappNumber;

  const ContactSection({super.key, this.whatsappNumber});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(AppSizes.w16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              isDark
                  ? [AppDarkColors.categoryBackground, AppDarkColors.cardDarkColor]
                  : [
                    AppColors.secondary.withValues(alpha: 0.1),
                    AppColors.secondary.withValues(alpha: 0.05),
                  ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(color: AppColors.secondary.withValues(alpha: 0.2), width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppSizes.h10),
                decoration: BoxDecoration(
                  color: const Color(0xFF25D366).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chat,
                  color: const Color(0xFF25D366),
                  size: AppSizes.sp20,
                ),
              ),
              SizedBox(width: AppSizes.w12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Interested in this material?',
                      style: TextStyle(
                        fontSize: AppSizes.sp14,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.whiteColor : AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Contact the seller via WhatsApp',
                      style: TextStyle(
                        fontSize: AppSizes.sp12,
                        color:
                            isDark
                                ? AppColors.whiteColor.withValues(alpha: 0.7)
                                : AppColors.subtitle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.h16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                CustomSnackBar.show(
                  context,
                  'Opening WhatsApp...',
                  backgroundColor: AppColors.success,
                );

                WhatsAppService.openWhatsApp(context, whatsappNumber);
              },
              icon: const Icon(Icons.chat, color: Colors.white),
              label: const Text(
                'Contact on WhatsApp',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                padding: EdgeInsets.symmetric(vertical: AppSizes.h14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.r12),
                ),
                elevation: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
