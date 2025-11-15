import 'package:go_router/go_router.dart';
import 'package:nha_228/features/auth/screens/forget_passward_screen.dart';
import 'package:nha_228/features/auth/screens/login_screen.dart';
import 'package:nha_228/features/auth/screens/register_screen.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/features/home/screens/card_detiles_screen.dart';
import 'package:nha_228/features/home/screens/search_screen.dart';
import 'package:nha_228/features/home/widgets/custom_nav_bar.dart';
import 'package:nha_228/features/post_material/screens/post_material_screen.dart';
import 'package:nha_228/features/profile/cubit/profile_cubit.dart';
import 'package:nha_228/features/profile/screens/edit_profile_screen.dart';
import 'package:nha_228/features/splash/screens/onboard_screen.dart';
import 'package:nha_228/features/splash/screens/splash_screen.dart';

abstract class AppRouter {
  static const root = '/';
  static const homeScreen = '/HomeScreen';
  static const searchScreen = '/SearchScreen';
  static const loginScreen = '/LoginScreen';
  static const otpScreen = '/OtpScreen';
  static const registerScreen = '/RegisterScreen';
  static const onboardScreen = '/OnboardScreen';
  static const postMaterialScreen = '/PostMaterialScreen';
  static const editProfileScreen = '/EditProfileScreen';
  static const forgetPasswordScreen = '/ForgetPasswordScreen';
  static const cardDetilesScreen = '/CardDetilesScreen';

  static final router = GoRouter(
    initialLocation: root,
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: loginScreen, builder: (context, state) => LoginScreen()),
      GoRoute(path: onboardScreen, builder: (context, state) => OnboardScreen()),
      GoRoute(path: registerScreen, builder: (context, state) => RegisterScreen()),
      GoRoute(path: homeScreen, builder: (context, state) => CustomNavBar()),
      GoRoute(
        path: searchScreen,
        builder: (context, state) {
          final String searchWord = state.extra as String;
          return SearchScreen(searchWord: searchWord);
        },
      ),
      GoRoute(
        path: postMaterialScreen,
        builder: (context, state) => PostMaterialScreen(),
      ),
      GoRoute(
        path: editProfileScreen,
        builder:
            (context, state) =>
                EditProfileScreen(profileCubit: state.extra as ProfileCubit),
      ),
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: cardDetilesScreen,
        builder:
            (context, state) => CardDetilesScreen(material: state.extra as MaterialModel),
      ),
    ],
  );
}
