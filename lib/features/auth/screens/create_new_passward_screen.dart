import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/core/widgets/custom_app_bar.dart';
import 'package:nha_228/core/widgets/custom_botton.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';
import 'package:nha_228/core/utils/validators.dart';

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
        padding: EdgeInsets.all(AppValues.padding),
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
                    color: AppColors.textprimary,
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
              SizedBox(height: AppValues.h10),
              CustomTextField(
                controller: confirmPasswordController,
                hintText: AppStrings.confirmPassword,
                isPassword: true,
                validator:
                    (value) => value.validateConfirmPassword(
                      newPasswordController.text,
                    ),
              ),
              SizedBox(height: AppValues.h24),
              CustomButton(
                title: AppStrings.submit,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      User? user = FirebaseAuth.instance.currentUser;

                      if (user != null) {
                        await user.updatePassword(
                          newPasswordController.text.trim(),
                        );
                        CustomSnackBar.show(
                          context,
                          "Password updated successfully",
                          backgroundColor: AppColors.secondary,
                        );
                        context.go(AppRouter.loginScreen);
                      } else {
                        CustomSnackBar.show(
                          context,
                          "No authenticated user found",
                          backgroundColor: AppColors.errorBorderColor,
                        );
                      }
                    } catch (e) {
                      CustomSnackBar.show(
                        context,
                        "Error: $e",
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
