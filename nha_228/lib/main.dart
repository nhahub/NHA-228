import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/theme/app_theme.dart';
import 'package:nha_228/features/splash/screens/splash_screen.dart';
import 'package:nha_228/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
        );
      },
    );
  }
}
