import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/core.dart';

import 'package:nha_228/features/auth/cubit/forget_passward_cubit/forget_passward_cubit.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          }

          if (state is ForgetPasswordSuccess) {
            Navigator.pop(context);
            CustomSnackBar.show(
              context,
              "Check your email to reset password",
              backgroundColor: AppColors.success,
            );
          }

          if (state is ForgetPasswordError) {
            Navigator.pop(context);
            CustomSnackBar.show(context, state.message, backgroundColor: AppColors.error);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: const CustomAppBar(title: AppStrings.back),
            ),
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w20,
                    vertical: AppSizes.h20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.forgotPasswordTitle,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: AppSizes.sp32,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: AppSizes.h10),

                      Text(
                        AppStrings.forgotPasswordSubtitle,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: AppSizes.sp14,
                          color: AppColors.subtitle,
                        ),
                      ),

                      SizedBox(height: AppSizes.h50),

                      CustomTextField(
                        controller: emailController,
                        hintText: AppStrings.email,
                        validator: (value) => value?.validateEmail(),
                      ),

                      SizedBox(height: AppSizes.h30),

                      Center(
                        child: CustomButton(
                          title:
                              state is ForgetPasswordLoading
                                  ? AppStrings.sending
                                  : AppStrings.sendCodeButton,
                          onPressed:
                              state is ForgetPasswordLoading
                                  ? null
                                  : () {
                                    FocusScope.of(context).unfocus();
                                    cubit.sendResetEmail(emailController.text.trim());
                                  },
                        ),
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
