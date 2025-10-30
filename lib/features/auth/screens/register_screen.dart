import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/auth/cubit/register_cubit/register_cubit.dart';
import 'package:nha_228/features/auth/widgets/auth_redirect_text.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            CustomSnackBar.show(
              context,
              AppStrings.creatingAccount,
              backgroundColor: AppColors.primary,
            );
          } else if (state is RegisterSuccess) {
            CustomSnackBar.show(
              context,
              AppStrings.registerSuccess,
              backgroundColor: AppColors.success,
            );
            context.go(AppRouter.loginScreen);
          } else if (state is RegisterFailure) {
            CustomSnackBar.show(
              context,
              state.errorMessage,
              backgroundColor: AppColors.error,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is RegisterLoading;

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.w18),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: AppSizes.h20),
                      Image.asset(AppAssets.logo, height: AppSizes.h100),
                      SizedBox(height: AppSizes.h20),
                      Text(
                        AppStrings.signUpTitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: AppSizes.sp38),
                      ),
                      SizedBox(height: AppSizes.h20),

                      CustomTextField(
                        controller: firstNameController,
                        hintText: AppStrings.firstName,
                        validator: (value) => value.validateFirstName(),
                      ),
                      SizedBox(height: AppSizes.h16),

                      CustomTextField(
                        controller: lastNameController,
                        hintText: AppStrings.lastName,
                        validator: (value) => value.validateLastName(),
                      ),
                      SizedBox(height: AppSizes.h16),

                      CustomTextField(
                        controller: emailController,
                        hintText: AppStrings.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => value.validateEmail(),
                      ),
                      SizedBox(height: AppSizes.h16),

                      CustomTextField(
                        controller: phoneController,
                        hintText: AppStrings.number,
                        keyboardType: TextInputType.phone,
                        validator: (value) => value.validatePhone(),
                      ),
                      SizedBox(height: AppSizes.h16),

                      CustomTextField(
                        controller: passwordController,
                        hintText: AppStrings.password,
                        isPassword: true,
                        validator: (value) => value.validatePassword(),
                      ),
                      SizedBox(height: AppSizes.h16),

                      CustomTextField(
                        controller: confirmPasswordController,
                        hintText: AppStrings.confirmPassword,
                        isPassword: true,
                        validator: (value) => value.validateConfirmPassword(
                          passwordController.text,
                        ),
                      ),
                      SizedBox(height: AppSizes.h20),

                      CustomButton(
                        title: isLoading
                            ? "Creating your account..."
                            : AppStrings.signUpButton,
                        isLoading: isLoading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterCubit>().registerUser(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  firstName: firstNameController.text.trim(),
                                  lastName: lastNameController.text.trim(),
                                  phone: phoneController.text.trim(),
                                );
                          }
                        },
                      ),
                      SizedBox(height: AppSizes.h20),

                      AuthRedirectText(
                        message: AppStrings.alreadyHaveAccount,
                        actionText: AppStrings.login,
                        onTap: () {
                          context.go(AppRouter.loginScreen);
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
