import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/core/utils/validators.dart';
import 'package:nha_228/features/auth/screens/login_screen.dart';
import 'package:nha_228/features/auth/widgets/auth_redirect_text.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppValues.w18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppValues.h10 * 1.5),
                Image.asset(AppAssets.logo, height: 100.h),
                SizedBox(height: AppValues.h10 * 1.5),

                Text(
                  AppStrings.signUpTitle,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: AppValues.sp38),
                ),
                SizedBox(height: AppValues.h10 * 1.5),

                CustomTextField(
                  controller: firstNameController,
                  hintText: AppStrings.firstName,
                  validator: (value) => value.validateFirstName(),
                ),
                SizedBox(height: AppValues.h16),

                CustomTextField(
                  controller: lastNameController,
                  hintText: AppStrings.lastName,
                  validator: (value) => value.validateLastName(),
                ),
                SizedBox(height: AppValues.h16),

                CustomTextField(
                  controller: emailController,
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
                SizedBox(height: AppValues.h16),

                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: AppStrings.confirmPassword,
                  isPassword: true,
                  validator:
                      (value) => value.validateConfirmPassword(
                        passwordController.text,
                      ),
                ),
                SizedBox(height: AppValues.h10 * 1.5),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data...')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(AppValues.h44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppValues.r8),
                    ),
                  ),
                  child: const Text(AppStrings.signUpButton),
                ),

                SizedBox(height: AppValues.h10),
                AuthRedirectText(
                  message: "Already have an account?",
                  actionText: 'log in',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
