import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/services/app_initialize.dart';
import 'package:nha_228/core/theme/app_theme.dart';
import 'package:nha_228/core/utils/app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitialize().intializrStings();
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
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
        );
      },
    );
  }
}
