import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.cancel),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.w18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.createNewPassword,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: 'otama.ep',
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomTextField(
                controller: newPasswordController,
                hintText: AppStrings.newPassword,
                isPassword: true,
                validator: (value) => value.validatePassword(),
              ),
              SizedBox(height: AppSizes.h10),
              CustomTextField(
                controller: confirmPasswordController,
                hintText: AppStrings.confirmPassword,
                isPassword: true,
                validator:
                    (value) => value.validateConfirmPassword(newPasswordController.text),
              ),
              SizedBox(height: AppSizes.h24),
              CustomButton(
                title: AppStrings.submit,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      User? user = FirebaseAuth.instance.currentUser;

                      if (user != null) {
                        await user.updatePassword(newPasswordController.text.trim());
                        CustomSnackBar.show(
                          context,
                          AppStrings.passwordUpdated,
                          backgroundColor: AppColors.secondary,
                        );
                        context.go(AppRouter.loginScreen);
                      } else {
                        CustomSnackBar.show(
                          context,
                          AppStrings.noAuthenticatedUser,
                          backgroundColor: AppColors.errorBorderColor,
                        );
                      }
                    } catch (e) {
                      CustomSnackBar.show(
                        context,
                        '${AppStrings.passwordUpdateError}: $e',
                        backgroundColor: AppColors.errorBorderColor,
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
