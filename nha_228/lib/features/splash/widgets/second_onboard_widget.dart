import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/splash/widgets/custom_onboard_widget.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingWidget(
      imagePath: AppAssets.secondOnboard,
      text: AppStrings.onboarding2Text,
    );
  }
}