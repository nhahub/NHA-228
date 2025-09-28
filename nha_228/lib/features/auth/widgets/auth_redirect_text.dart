import 'package:flutter/material.dart';

class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(color: Color(0xff828282)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Log In",
            style: TextStyle(color: Color(0xff04332D)),
          ),
        ),
      ],
    );
  }
}
