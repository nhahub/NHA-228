import 'package:flutter/material.dart';

class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({super.key, required this.message, required this.actionText, required this.onTap});
 final String message;      
  final String actionText;   
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          message,
         // "Already have an account?",
          style: TextStyle(color: Color(0xff828282)),
        ),
        TextButton(
          onPressed:onTap,
          child:  Text(
            actionText,
            style: TextStyle(color: Color(0xff04332D)),
          ),
        ),
      ],
    );
  }
}
