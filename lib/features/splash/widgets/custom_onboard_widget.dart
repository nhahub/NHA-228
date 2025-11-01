import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
class CustomOnboardingWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomOnboardingWidget({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath),
           SizedBox(height: AppSizes.h40),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
