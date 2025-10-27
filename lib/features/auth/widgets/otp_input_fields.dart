import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nha_228/core/core.dart';

class OtpInputFields extends StatefulWidget {
  final Function(String) onCompleted;

  const OtpInputFields({super.key, required this.onCompleted});

  @override
  State<OtpInputFields> createState() => _OtpInputFieldsState();
}

class _OtpInputFieldsState extends State<OtpInputFields> {
  final List<TextEditingController> _controllers = List.generate(
    AppConstants.otpLength,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(
    AppConstants.otpLength,
    (_) => FocusNode(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < AppConstants.otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (index == AppConstants.otpLength - 1 && value.isNotEmpty) {
      String code = _controllers.map((c) => c.text).join();
      widget.onCompleted(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(AppConstants.otpLength, (index) {
        return SizedBox(
          width: AppSizes.w54,
          height: AppSizes.h54,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: AppColors.textPrimary,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => _onChanged(value, index),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.whiteColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.w8),
                borderSide: BorderSide(color: AppColors.borderSide),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r8),
                borderSide: BorderSide(
                  color: AppColors.focusedBorderColor,
                  width: AppSizes.w2,
                ),
              ),
            ),
            style: TextStyle(fontSize: AppSizes.sp20, fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}
