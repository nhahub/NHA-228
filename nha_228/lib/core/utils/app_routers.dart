import 'package:go_router/go_router.dart';
import 'package:nha_228/features/auth/screens/login_screen.dart';
import 'package:nha_228/features/auth/screens/register_screen.dart';
import 'package:nha_228/features/home/screens/home_screen.dart';
import 'package:nha_228/features/splash/screens/splash_screen.dart';

abstract class AppRouter {
  static const homeScreen = '/HomeScreen';
  static const searchScreen = '/SearchScreen';
  static const loginScreen = '/LoginScreen';
  static const registerScreen = '/RegisterScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: loginScreen, builder: (context, state) => LoginScreen()),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      //   GoRoute(
      //     path: searchScreen,
      //     builder: (context, state) => const SearchScreen(),
      //   ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
