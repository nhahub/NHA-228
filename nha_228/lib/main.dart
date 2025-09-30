import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/theme/app_theme.dart';
import 'package:nha_228/features/auth/screens/register.dart';
import 'package:nha_228/features/splash/screens/splash_screen.dart';

void main() {
  runApp(const Krakibak());
}

class Krakibak extends StatelessWidget {
  const Krakibak({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
        );
      },
    );
  }
}
