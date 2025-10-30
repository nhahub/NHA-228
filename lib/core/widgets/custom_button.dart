import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_sizes.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? height;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? AppSizes.h44,
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(title)),
    );
  }
}
