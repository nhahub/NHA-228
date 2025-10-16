import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/auth/cubit/otp_cubit/otp_cubit.dart';
import 'package:nha_228/features/auth/widgets/custom_snack_bar.dart';

import '../widgets/otp_input_fields.dart';

class PhoneOtpScreen extends StatefulWidget {
  final String phoneNumber;

  const PhoneOtpScreen({super.key, required this.phoneNumber});

  @override
  State<PhoneOtpScreen> createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends State<PhoneOtpScreen> {
  late Timer _timer;
  int _secondsRemaining = 59;
  String _enteredCode = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 59;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String maskedPhone(String phone) {
    if (phone.length < 4) return phone;
    final visible = phone.substring(phone.length - 3);
    return '***$visible';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocConsumer<PhoneOtpCubit, PhoneOtpState>(
            listener: (context, state) {
              if (state is PhoneOtpError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is PhoneOtpVerified) {
                CustomSnackBar.show(
                  context,
                  AppStrings.codeSuccessfullyVerified,
                  backgroundColor: AppColors.success,
                );

                Navigator.pop(context, true);
              }
            },
            builder: (context, state) {
              if (state is PhoneOtpLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  SizedBox(height: AppSizes.h8),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.otpVerificationScreenTextColor,
                                size: 25,
                              ),
                            ),
                            Text(
                              AppStrings.cancel,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontSize: AppSizes.sp24,
                                fontFamily: 'Otama-ep',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSizes.h16),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.otpVerification,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: AppSizes.sp24,
                              fontFamily: 'Otama-ep',
                              color: AppColors.otpVerificationScreenTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.h10),
                      Row(
                        children: [
                          SizedBox(width: AppSizes.w8),
                          Text(
                            'We sent a 5-digit code to ${maskedPhone(widget.phoneNumber)}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color.fromARGB(255, 126, 123, 123),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: AppSizes.h54),

                  OtpInputFields(
                    onCompleted: (code) {
                      setState(() {
                        _enteredCode = code;
                      });
                    },
                  ),

                  SizedBox(height: AppSizes.h40),
                  SizedBox(
                    width: double.infinity,
                    height: AppSizes.h48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.focusedBorderColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.r8),
                        ),
                      ),
                      onPressed:
                          _enteredCode.isEmpty
                              ? null
                              : () {
                                context.read<PhoneOtpCubit>().verifyOtp(
                                  widget.phoneNumber,
                                );
                              },
                      child: Text(
                        AppStrings.confirmOtp,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: AppSizes.sp18,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child:
                        _secondsRemaining > 0
                            ? Text(
                              'Resend Code in 00:${_secondsRemaining.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                fontSize: AppSizes.sp14,
                                color: AppColors.textPrimary,
                              ),
                            )
                            : TextButton(
                              onPressed: () {
                                context.read<PhoneOtpCubit>().sendOtp(widget.phoneNumber);
                                _startTimer();
                              },
                              child: Text(
                                AppStrings.resendCode,
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontSize: AppSizes.sp14,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                  ),
                  SizedBox(height: AppSizes.h16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
