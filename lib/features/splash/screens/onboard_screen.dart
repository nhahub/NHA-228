import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/core/cubit/theme_cubit.dart';
import 'package:nha_228/features/splash/widgets/custom_indicator.dart';
import 'package:nha_228/features/splash/widgets/first_onboard_widget.dart';
import 'package:nha_228/features/splash/widgets/onboarding_footer.dart';
import 'package:nha_228/features/splash/widgets/second_onboard_widget.dart';
import 'package:nha_228/features/splash/widgets/third_onboard_widget.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: AppSizes.w16),
          child: Container(
            width: AppSizes.w30,
            height: AppSizes.h30,
            decoration: BoxDecoration(
              color: AppColors.navBarColor,
              shape: BoxShape.circle,
            ),
            child: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, state) {
                return IconButton(
                  icon: SvgPicture.asset(
                    state == ThemeMode.dark ? AppAssets.sun : AppAssets.moon,
                    colorFilter: ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
                    width: AppSizes.w20,
                    height: AppSizes.h20,
                  ),
                  onPressed: () {
                    context.read<ThemeCubit>().selectedTheme();
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: _controller,
                children: [RecyclingOnboard(), LocationOnboard(), MobileOnboard()],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(active: index == 0),
                CustomIndicator(active: index == 1),
                CustomIndicator(active: index == 2),
              ],
            ),
            SizedBox(height: AppSizes.h40),
            OnboardingFooter(controller: _controller, index: index),
            SizedBox(height: AppSizes.h20),
          ],
        ),
      ),
    );
  }
}
