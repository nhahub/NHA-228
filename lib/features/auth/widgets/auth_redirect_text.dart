import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({
    super.key,
    this.message,
    required this.actionText,
    required this.onTap,
    this.alignment = MainAxisAlignment.center,
  });

  final String? message;
  final String actionText;
  final VoidCallback onTap;
  final MainAxisAlignment alignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(message ?? '', style: TextStyle(color: Color(0xff828282))),
        TextButton(
          onPressed: onTap,
          child: Text(actionText, style: TextStyle(color: AppColors.secondary)),
        ),
      ],
    );
  }
}
