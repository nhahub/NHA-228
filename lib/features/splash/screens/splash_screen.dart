import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_constants.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/services/hive_service.dart';
import 'package:nha_228/core/utils/app_routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () {
      final bool seenOnboarding = HiveManager().getBool(AppConstants.seenOnboarding);
      final bool isLoggedIn = HiveManager().getBool(AppConstants.isLoggedIn);
      if (!seenOnboarding) {
        context.go(AppRouter.onboardScreen);
      } else {
        if (isLoggedIn) {
          context.go(AppRouter.homeScreen);
        } else {
          context.go(AppRouter.loginScreen);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value * 2 * 3.14,

                    child: Transform.scale(scale: _scaleAnimation.value, child: child),
                  );
                },
                child: Image.asset(AppAssets.splash),
              ),

              Text(AppStrings.appName, style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: AppSizes.w18),
              Text(
                AppStrings.splashSubtitle,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: AppSizes.sp14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
