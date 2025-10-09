import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/widgets/custom_app_bar.dart';
import 'package:nha_228/core/widgets/custom_botton.dart';
import 'package:nha_228/features/auth/cubit/cubit/forget_passward_cubit.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final phoneController = TextEditingController();

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
          } else if (state is ForgetPasswordCodeSent) {
            Navigator.pop(context);
            CustomSnackBar.show(
              context,
              'Code sent successfully!',
              backgroundColor: AppColors.success,
            );
            //context.push(AppRouter.otpScreen, extra: state.verificationId);
          } else if (state is ForgetPasswordError) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }

            CustomSnackBar.show(context, state.message, backgroundColor: AppColors.error);
          }
        },

        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: CustomAppBar(title: AppStrings.back),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.forgotPasswordTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'otama.ep',
                        fontSize: 32.sp,
                        color: AppColors.appbar,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      AppStrings.forgotPasswordSubtitle,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.subtitle,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    CustomTextField(
                      controller: phoneController,
                      hintText: AppStrings.number,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: CustomButton(
                        title:
                            state is ForgetPasswordLoading
                                ? "Sending..."
                                : AppStrings.sendCodeButton,
                        onPressed:
                            state is ForgetPasswordLoading
                                ? null
                                : () {
                                  cubit.sendCode(phoneController.text.trim());
                                },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
