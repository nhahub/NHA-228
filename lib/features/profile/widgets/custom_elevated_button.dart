import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomElevatedButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(title),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width, AppSizes.h54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r14)),
      ),
      onPressed: onPressed,
    );
  }
}
