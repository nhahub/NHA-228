import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/features/auth/screens/register_screen.dart';
import 'package:nha_228/features/auth/widgets/auth_redirect_text.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';
import 'package:nha_228/features/home/screens/home_screen.dart';
import 'package:nha_228/core/utils/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailControlller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppValues.padding),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.logo),
                  Text(
                    AppStrings.login,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  CustomTextField(
                    controller: emailControlller,
                    hintText: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value.validateEmail(),
                  ),
                  SizedBox(height: AppValues.h16),

                  CustomTextField(
                    controller: passwordController,
                    hintText: AppStrings.password,
                    isPassword: true,
                    validator: (value) => value.validatePassword(),
                  ),

                  SizedBox(height: 61.h),
                  SizedBox(
                    width: double.infinity,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(AppStrings.login),
                    ),
                  ),
                  AuthRedirectText(
                    message: "Don't have an account?",
                    actionText: "Sign Up",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
