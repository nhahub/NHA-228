import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/features/auth/cubit/login/cubit/login_cubit.dart';
import 'package:nha_228/features/auth/widgets/auth_redirect_text.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';
import 'package:nha_228/core/utils/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailControlller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
                CustomSnackBar.show(
                  context,
                  state.error,
                  backgroundColor: AppColors.error,
                );
              } else if (state is LoginSuccess) {
                CustomSnackBar.show(
                  context,
                  AppStrings.loginSuccess,
                  backgroundColor: AppColors.success,
                );
                context.go(AppRouter.homeScreen);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
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

                        SizedBox(height: AppValues.h61),
                        SizedBox(
                          width: double.infinity,
                          height:AppValues.h44,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginCubit>().loginUser(
                                  email: emailControlller.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            child:
                                state is LoginLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : Text(AppStrings.login),
                          ),
                        ),
                        AuthRedirectText(
                          message: AppStrings.noAccount,
                          actionText: AppStrings.signUpButton,
                          onTap: () {
                            context.push(AppRouter.registerScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
