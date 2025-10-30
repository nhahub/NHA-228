import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/splash/widgets/custom_onboard_widget.dart';

class LocationOnboard extends StatelessWidget {
  const LocationOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingWidget(
      imagePath: AppAssets.secondOnboard,
      text: AppStrings.onboarding2Text,
    );
  }
}
