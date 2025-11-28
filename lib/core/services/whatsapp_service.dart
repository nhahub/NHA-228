import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/home/widgets/phone_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppService {
  static Future<void> openWhatsApp(BuildContext context, String? rawNumber) async {
    final uri = buildWhatsAppUri(rawNumber);
    if (uri == null) {
      CustomSnackBar.show(context, 'رقم الواتساب غير صالح: "${rawNumber ?? ''}"');
      return;
    }

    try {
      final bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (launched) return;
    } catch (_) {}

    try {
      final fallback = Uri.parse(
        'https://api.whatsapp.com/send?phone=${uri.path.replaceFirst('/', '')}',
      );
      final bool launchedFallback = await launchUrl(
        fallback,
        mode: LaunchMode.externalApplication,
      );
      if (launchedFallback) return;

      CustomSnackBar.show(
        context,
        'تعذر فتح WhatsApp.',
        backgroundColor: AppColors.error,
      );
    } catch (e) {
      CustomSnackBar.show(
        context,
        'حدث خطأ أثناء فتح WhatsApp: ${e.toString()}',
        backgroundColor: AppColors.error,
      );
    }
  }
}
