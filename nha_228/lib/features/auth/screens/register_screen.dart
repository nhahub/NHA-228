import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/core/utils/validators.dart';
import 'package:nha_228/core/widgets/custom_botton.dart';
import 'package:nha_228/features/auth/cubit/register%20cubit/register_cubit.dart';
import 'package:nha_228/features/auth/screens/login_screen.dart';
import 'package:nha_228/features/auth/widgets/auth_redirect_text.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
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
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            CustomSnackBar.show(
              context,
              "Creating your account...",
              backgroundColor: Colors.blue,
            );
          } else if (state is RegisterSuccess) {
            CustomSnackBar.show(
              context,
              "Account created successfully!",
              backgroundColor: Colors.green,
            );
          } else if (state is RegisterFailure) {
            CustomSnackBar.show(
              context,
              state.errorMessage,
              backgroundColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppValues.w18),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: AppValues.h10 * 2),
                      Image.asset(AppAssets.logo, height: 100.h),
                      SizedBox(height: AppValues.h10 * 2),

                      Text(
                        AppStrings.signUpTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: AppValues.sp38,
                        ),
                      ),
                      SizedBox(height: AppValues.h10 * 2),

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
                      SizedBox(height: AppValues.h10),

                      CustomTextField(
                        controller: confirmPasswordController,
                        hintText: AppStrings.confirmPassword,
                        isPassword: true,
                        validator: (value) => value.validateConfirmPassword(
                          passwordController.text,
                        ),
                      ),
                      SizedBox(height: AppValues.h10 * 1.5),

                      CustomButton(
                        title: AppStrings.signUpButton,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterCubit>().registerUser(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                            );
                          }
                        },
                      ),

                      SizedBox(height: AppValues.h10),
                      AuthRedirectText(
                        message: "Already have an account?",
                        actionText: 'log in',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
