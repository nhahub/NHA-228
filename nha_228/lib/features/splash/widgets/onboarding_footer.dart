import 'package:flutter/material.dart';

import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/features/auth/screens/login_screen.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
    required this.controller,
    required this.index,
  });
  final PageController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.loginScreen);
            },
            child: Text(
              AppStrings.skip,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
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
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.whiteColor,
                      ),
                    )
                    : InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),

                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(120),
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
