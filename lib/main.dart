import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/core/cubit/theme_cubit.dart';
import 'package:nha_228/core/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitialize().intializrStings();
  runApp(BlocProvider(create: (context) => ThemeCubit(), child: const Krakibak()));
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
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              themeMode: state,
              theme: appTheme(),
              darkTheme: darkTheme(),
            );
          },
        );
      },
    );
  }
}
