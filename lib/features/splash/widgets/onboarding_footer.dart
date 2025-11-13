import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/core.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({super.key, required this.controller, required this.index});

  final PageController controller;
  final int index;

  onboardingSeen(BuildContext context) async {
    await HiveManager().setBool(AppConstants.seenOnboarding, true);
    context.go(AppRouter.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => onboardingSeen(context),
            child: Text(AppStrings.skip, style: Theme.of(context).textTheme.labelSmall),
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
            child:
                index < 2
                    ? IconButton(
                      onPressed: () {
                        controller.animateToPage(
                          index + 1,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                        );
                      },
                      icon: Icon(Icons.arrow_forward_ios, color: AppColors.whiteColor),
                    )
                    : InkWell(
                      onTap: () => onboardingSeen(context),
                      child: Container(
                        padding: EdgeInsets.all(AppSizes.w16),

                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(AppSizes.r120),
                        ),
                        child: Text(
                          AppStrings.getStarted,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
