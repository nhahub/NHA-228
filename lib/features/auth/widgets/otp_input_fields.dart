import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/otp_constants.dart';

class OtpInputFields extends StatefulWidget {
  final Function(String) onCompleted;

  const OtpInputFields({super.key, required this.onCompleted});

  @override
  State<OtpInputFields> createState() => _OtpInputFieldsState();
}

class _OtpInputFieldsState extends State<OtpInputFields> {
  final List<TextEditingController> _controllers = List.generate(
    otpConstants.otpLength,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(otpConstants.otpLength, (_) => FocusNode());

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
    if (value.isNotEmpty && index < otpConstants.otpLength-1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (index == otpConstants.otpLength-1 && value.isNotEmpty) {
      String code = _controllers.map((c) => c.text).join();
      widget.onCompleted(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(otpConstants.otpLength, (index) {
        return SizedBox(
          width: 53.w,
          height: 54.h,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: Colors.black,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => _onChanged(value, index),
            decoration: InputDecoration(
              counterText: '', // الغاء العداد الافتراضي (0/6)
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.focusedBorderColor, width: 2.w),
              ),
            ),
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}
